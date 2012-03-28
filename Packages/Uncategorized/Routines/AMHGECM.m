AMHGECM ; IHS/CMI/MAW - AMHG Case Management Adds/Edits 3/3/2009 5:00:28 PM ;
 ;;4.0;IHS BEHAVIORAL HEALTH;;MAY 14, 2010
 ;
 ;
 ;
DEBUG(RETVAL,AMHSTR) ;-- debug entry point
 D DEBUG^%Serenji("EP^AMHGD(RETVAL,.AMHSTR)")
 Q
 ;
CM(AMHIEN,DM,REC,PRO,CO,PP,PV,CA,NR,DC,DSP,PAT,CMT) ;EP -- file the case status
 N AMHFDA,AMHIENS,AMHERRR,FL
 S FL=9002011.58
 S AMHIENS=$S(DM="A":"+1,",1:REC_",")
 S AMHFDA(FL,AMHIENS,.02)=PAT
 S AMHFDA(FL,AMHIENS,.03)=PRO
 S AMHFDA(FL,AMHIENS,.04)=CA
 S AMHFDA(FL,AMHIENS,.05)=DC
 S AMHFDA(FL,AMHIENS,.06)=DSP
 S AMHFDA(FL,AMHIENS,.08)=PP
 S AMHFDA(FL,AMHIENS,.09)=PV
 S AMHFDA(FL,AMHIENS,.12)=NR
 S AMHFDA(FL,AMHIENS,1101)=CMT
 I DM="A" D  Q
 . S AMHFDA(FL,AMHIENS,.01)=CO
 . S AMHFDA(FL,AMHIENS,.11)=DT
 . D UPDATE^DIE("","AMHFDA","AMHIENS","AMHERRR(0")
 . I '$D(AMHERRR) S AMHIEN=$G(AMHIENS(1)) Q
 . S AMHER="0~Add Case"
 I DM="E" D  Q
 . S AMHFDA(FL,AMHIENS,.01)=CO
 . D FILE^DIE("K","AMHFDA","AMHERRR(0)")
 . I '$D(AMHERRR) S AMHIEN=REC Q
 . S AMHER="0~Edit Case"
 Q
 ;
PI(AMHIEN,DM,REC,DMP,DSP,DCP,DPO,DONA,DONB,FLG,FLGN) ;EP -- file the patient information
 N AMHFDA,AMHIENS,AMHERRR,FL
 S FL=9002011.55
 S AMHIENS=$S(DM="A":"+1,",1:REC_",")
 I '$D(^AMHPATR(REC)) S AMHIENS="+1,",DM="A"
 I $D(^AMHPATR(REC)) S AMHIENS=REC_",",DM="E"
 S AMHIENS(1)=REC
 S AMHFDA(FL,AMHIENS,.02)=DMP
 S AMHFDA(FL,AMHIENS,.03)=DSP
 S AMHFDA(FL,AMHIENS,.04)=DCP
 S AMHFDA(FL,AMHIENS,.09)=FLG
 S AMHFDA(FL,AMHIENS,.11)=FLGN
 S AMHFDA(FL,AMHIENS,.12)=DPO
 S AMHFDA(FL,AMHIENS,.13)=DONA
 S AMHFDA(FL,AMHIENS,.14)=DONB
 I DM="A" D  Q
 . S AMHFDA(FL,AMHIENS,.01)=REC
 . D UPDATE^DIE("","AMHFDA","AMHIENS","AMHERRR(0")
 . I '$D(AMHERRR) S AMHIEN=$G(AMHIENS(1)) Q
 . S AMHER="0~Add Patient Information"
 I DM="E" D  Q
 . D FILE^DIE("K","AMHFDA","AMHERRR(0)")
 . I '$D(AMHERRR) S AMHIEN=REC Q
 . S AMHER="0~Edit Patient Information"
 Q
 ;
PH(AMHIEN,D,RC,PHSTR) ;EP -- add/edit/delete Personal History
 N PHS
 D ARRAY^AMHGU(.PHS,PHSTR)
 N AMHDA
 S AMHDA=0 F  S AMHDA=$O(PHS(AMHDA)) Q:'AMHDA  D
 . N PH
 . S PH=+$G(PHS(AMHDA))
 . D MODPH(PH,RC)
 D DELPH(RC,.PHS)
 Q
 ;
MODPH(PI,R) ;-- add a personal history
 Q:$$FNDPH^AMHGU(R,PI)
 N AMHFDA,AMHIENS,AMHERRR,AMHPIEN
 S AMHIENS="+1,"
 S AMHFDA(9002011.52,AMHIENS,.01)=PI
 S AMHFDA(9002011.52,AMHIENS,.02)=R
 S AMHFDA(9002011.52,AMHIENS,.03)=DT
 D UPDATE^DIE("","AMHFDA","AMHIENS","AMHERRR(1)")
 I $D(AMHERRR) S AMHER="0~Add Personal History"
 S AMHPIEN=$G(AMHIENS(1))
 Q
 ;
DELPH(REC,PHI) ;-- check to see if any personal history records were deleted during edit
 N ADA,R,C,PH
 S R="~"
 S ADA=0 F  S ADA=$O(PHI(ADA)) Q:'ADA  D
 . N PHIEN
 . S PHIEN=$P(PHI(ADA),R)
 . S PH(PHIEN)=PHIEN
 N IEN
 S IEN=0 F  S IEN=$O(^AMHPPHX("AA",REC,IEN)) Q:'IEN  D
 . I '$G(PH(IEN)) D
 .. S DIK="^AMHPPHX(",DA=$O(^AMHPPHX("AA",REC,IEN,0)) D ^DIK
 Q
 ;
