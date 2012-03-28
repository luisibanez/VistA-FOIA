BNPENV ;IHS/OIT/ENM - ENVIRONMENT CHECK
 ;;1.0;NATIONAL SITE TRACKING SYSTEM;;07/31/2009
ALLPKG ;LOOP ON PACKAGE FILE "B" XREF
 S AZFMSITE="",PKRN="",AZASUFAC="",AZFMCT=1,BNPOS="",LOCNUM=""
 ;
 ;GET LOCNAM
 S LOCNUM=$P($G(^AUTTSITE(1,0)),"^",1)
 ;
 I $G(LOCNUM)>0 S AZFMSITE=$P($G(^DIC(4,LOCNUM,0)),"^",1),AZASUFAC=$P($G(^AUTTLOC(LOCNUM,0)),"^",10)
 ;
 S AZFM="",LPATCH="",LPAT="",DINSLV="",INSDT="",HL7PDT="",HL7IDT=""
 F NA=0:0 S AZFM=$O(^DIC(9.4,"B",AZFM)) Q:AZFM=""  D PKGWR
 D XBC ;MOVE XTMP GBL TO UNIX
 D OUT
 Q
PKGWR S AZVER=$$VERSION^XPDUTL(AZFM),LPATCH=$$LAST^BNPENV2(AZFM,AZVER),LPATCH=$S(LPATCH'[-1:LPATCH,1:"") D DTFIX
 ;
 I LPATCH="" S LPAT="",HL7DT="",LLPAT="^"
 I LPATCH]"" S LPAT=$P(LPATCH,"^",1)_" / "_$P(LPATCH,"^",2)
 ;GRAB THE PREFIX
 S PKRN=$O(^DIC(9.4,"B",AZFM,"")) S:'PKRN PKRN=""
 S PREFIX=$P($G(^DIC(9.4,PKRN,0)),"^",2)
 I AZVER]"" S DINSLV=$O(^DIC(9.4,PKRN,22,"B",AZVER,"")) S:'DINSLV DINSLV=""
 I DINSLV]"" S INSDT=$P($G(^DIC(9.4,PKRN,22,DINSLV,0)),"^",3) D DTFIX1
 ;GET OS
 S BNPOS=$ZV
 ;
 S ^BNPENV(AZFMCT)=AZASUFAC_"^"_AZFMSITE_"^"_AZFM_"^"_PREFIX_"^"_AZVER_"^"_LLPAT_"^"_$S(INSDT]"":INSDT,1:"")_"^"_BNPOS
 S AZFMCT=AZFMCT+1
 Q
PCC2 S PCCF200=$P($G(^AUTTSITE(1,0)),"^",22) I PCCF200="" S PCCF200="No"
 I PCCF200=1 S PCCF200="YES"
 ;W !,?30,"IHS V Files 200 Conversion Done?// ",PCCF200
 Q
DOONE ;DO ONE RECORD FOR TESTING ONLY
 S AZFM="ADVERSE REACTION TRACKING" D PKGWR
 D OUT
 Q
DTFIX Q:'+LPATCH
 I $P(LPATCH,"^",2)]"" S HL7PDT=$P(LPATCH,"^",2),X=$$FMTHL7^XLFDT(HL7PDT),LLPAT=$P(LPATCH,"^",1)_"^"_X ;SET HL7 PATCH INSTALL DATE
 I $P(LPATCH,"^",2)']"" S LLPAT=$P(LPATCH,"^",1)_"^"_""
 I $P(LPATCH,"^",2)]"" S Y=$P(LPATCH,"^",2) X ^DD("DD") S $P(LPATCH,"^",2)=" "_Y
 Q
DTFIX1 Q:'+INSDT
 I INSDT]"" S HL7IDT=INSDT,X=$$FMTHL7^XLFDT(HL7IDT),INSDT=X
 I INSDT']"" S INSDT=""
 Q
OUT ;
 ;W !!,"END OF PACKAGE FILE PROFILE CHECK!"
 K NA,AZFM,AZVER,LPATCH,PCCF200,AZASUFAC
 Q
PFIX S AZFMSITE="",PKRN=""
 ;
 S AZFM="",LPATCH="",LPAT=""
 F NA=0:0 S AZFM=$O(^DIC(9.4,"B",AZFM)) Q:AZFM=""  D PGWR
 D OP2
 D OUT
 Q
PGWR S AZVER=$$VERSION^XPDUTL(AZFM),LPATCH=$$LAST^BNPENV2(AZFM,AZVER),LPATCH=$S(LPATCH'[-1:LPATCH,1:"") D DTFIX
 I LPATCH="" S LPAT=""
 I LPATCH]"" S LPAT=$P(LPATCH,"^",1)_" / "_$P(LPATCH,"^",2)
 ;GRAB THE PREFIX
 S PKRN=$O(^DIC(9.4,"B",AZFM,"")) S:'PKRN PKRN=""
 S PREFIX=$P($G(^DIC(9.4,PKRN,0)),"^",2)
 ;
 S ENM(PREFIX)=AZFM_"^"_AZVER_"^"_LPAT
 Q
OP2 ;
 S PFX="",AZFM1="",AZVER1="",APAT1=""
 F  S PFX=$O(ENM(PFX)) Q:'PFX  S AZFM1=$P($G(ENM(PFX)),"^",1),AZVER1=$P($G(ENM(PFX)),"^",2),APAT1=$P($G(ENM(PFX)),"^",3) D LS
 Q
LS ;
 ;W !,AZFM1_"-("_PFX_")",?40,AZVER1,?50,LPAT1 I AZFM1="IHS V FILES 200 CONVERSION" D PCC2
 Q
 ;SAVE PACKAGE STATUS DATA TO A UNIX FILE
XBC ;XBGL=GLOBAL NAME,XBUF=UNIX DIRECTORY,XBFN=UNIX FILE NAME
 ;Next line will try to send file to 92.145 with ftpsend
 ;
 ;S XBGL="AZFMENV",XBUF="161.223.92.145",XBFN="AZFMENV"_AZASUFAC_".G",XBMED="F"
 ;S XBUF="/usr2/ihs/emoore",XBFLT=1 ;note this line has not been tested!!!!
 ;S XBGL="BNPENV(",XBFN="BNPENV"_AZASUFAC_".G",XBMED="F"
 ;S XBS1="AZFMSITETRACK"
 ;S XBGL="BNPENV",XBUF="/usr2/ihs/emoore",XBFN="BNPENV"_AZASUFAC_".G",XBMED="F"
 ;D ^XBGSAVE
 D ^BNPENHT ;CALL MIKE PIKES ROUTINE
 Q
