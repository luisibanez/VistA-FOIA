APCHSM05 ; IHS/CMI/LAB -- CONTINUATION OF ROUTINES ;
 ;;2.0;IHS PCC SUITE;**2**;MAY 14, 2009
 ;IHS/CMI/LAB - uncommented age limit on pap smear
 ;
 ; ******************** SURVEILLANCE - HARD CODE ********************
S(X) ;
 NEW %,C S (C,%)=0 F  S %=$O(APCHSTEX(%)) Q:%'=+%  S C=C+1
 S APCHSTEX(C+1)=X
 Q
HEARWT ;
 S V=$$REF^APCHSMU(APCHSPAT,9999999.15,$O(^AUTTEXAM("C","17",0)),APCHLAST) I V]"" S X=$P(V,U) D S(X) S X=$P(V,U,2) I X]"" D S(X)
 S V=$$REF^APCHSMU(APCHSPAT,9999999.15,$O(^AUTTEXAM("C","23",0)),APCHLAST) I V]"" S X=$P(V,U) D S(X) S X=$P(V,U,2) I X]"" D S(X)
 S V=$$REF^APCHSMU(APCHSPAT,9999999.15,$O(^AUTTEXAM("C","24",0)),APCHLAST) I V]"" S X=$P(V,U) D S(X) S X=$P(V,U,2) I X]"" D S(X)
 ;S V=$$REF^APCHSMU(APCHSPAT,81,+$$CODEN^ICPTCOD(92552),APCHLAST) I V]"" S X=$P(V,U) D S(X) S X=$P(V,U,2) I X]"" D S(X)
 ;S V=$$REF^APCHSMU(APCHSPAT,81,+$$CODEN^ICPTCOD(92553),APCHLAST) I V]"" S X=$P(V,U) D S(X) S X=$P(V,U,2) I X]"" D S(X)
 ;S V=$$REF^APCHSMU(APCHSPAT,81,+$$CODEN^ICPTCOD(92555),APCHLAST) I V]"" S X=$P(V,U) D S(X) S X=$P(V,U,2) I X]"" D S(X)
 ;S V=$$REF^APCHSMU(APCHSPAT,81,+$$CODEN^ICPTCOD(92556),APCHLAST) I V]"" S X=$P(V,U) D S(X) S X=$P(V,U,2) I X]"" D S(X)
 S APCHT=$O(^ATXAX("B","APCH HEARING SCREEN CPTS",0))
 I APCHT S V=$$CPTREFT^APCHSMU2(APCHSPAT,APCHLAST,DT,APCHT) I V]"" S X=$P(V,U) D S(X) S X=$P(V,U,2) I X]"" D S(X)
 D WRITE^APCHSMU
 X APCHSURX
 Q
HEAR ;
 Q:'$$INAC^APCHSMU(APCHSITI)  ;is item turned on or off
 S APCHLAST="",APCHNEXT="" K APCHSTEX
 S APCHICAR=$$LASTHEAR^APCLAPI3(APCHSPAT,$$DATEAGE^APCHSMU(APCHSPAT,3),,"A")
 S APCHLAST=$P(APCHICAR,U,1)
 S APCHOVR=$$OVR^APCHSMU(APCHSPAT,APCHSITI)
 I $P(APCHOVR,U)>APCHLAST D  Q
 .S X=$$DATE^APCHSMU($P(APCHOVR,U))_" (per "_$P(APCHOVR,U,2)_")" D S(X) S X=$P(APCHOVR,U,3) D S(X)
 .D HEARWT
 .Q
HEARREG ;regular stuff
 S APCHSINT="",APCHSCRI=$$SITECRIT^APCHSMU(APCHSITI)
 I 'APCHSCRI,APCHSAGE<7 S APCHSINT=365,APCHMIN=3
 I 'APCHSCRI Q:APCHSAGE<3
 I APCHSCRI S APCHSINT=$$AGESEX^APCHSMU(APCHSITI,APCHSPAT),APCHMIN=$$MINAGE^APCHSMU(APCHSITI,APCHSPAT) ;return in APCHSINT the frequency in days for this age/sex
 I APCHSINT="" X APCHSURX Q  ;no frequency so skip it
 I APCHLAST="" S APCHSTEX(1)=$$DATE^APCHSMU($$DATEAGE^APCHSMU(APCHSPAT,APCHMIN)) D HEARWT Q
 S APCHSOLD=$$FMDIFF^XLFDT(APCHLAST,APCHSDOB)
 I 'APCHSCRI,APCHSAGE>2,APCHSOLD<(3*365) S APCHSTEX(1)=$$DATE^APCHSMU($$FMADD^XLFDT(APCHSDOB,(4*365))) D HEARWT Q
 I APCHLAST]"" X APCHSURX Q  ;had one in appropriate time so quit
 S APCHNEXT=$$FMADD^XLFDT(APCHLAST,APCHSINT)
 I APCHNEXT>DT S APCHSTEX(1)=$$DATE^APCHSMU(APCHNEXT)
 I APCHNEXT'>DT S APCHSTEX(1)=$$DATE^APCHSMU(APCHNEXT)
 D HEARWT
 Q
STRAB ;EP
 X APCHSURX
 Q:'$$INAC^APCHSMU(APCHSITI)  ;is item turned on or off
 S APCHLAST="",APCHNEXT="" K APCHSTEX
 S APCHSINT="",APCHSCRI=$$SITECRIT^APCHSMU(APCHSITI)
 I APCHSCRI S APCHSINT=$$AGESEX^APCHSMU(APCHSITI,APCHSPAT),APCHMIN=$$MINAGE^APCHSMU(APCHSITI,APCHSPAT)
 I 'APCHSCRI D
 .Q:APCHSAGE<3
 .Q:APCHSAGE>4
 .S APCHSINT=(2*365)
 .S APCHMIN=3
 I APCHSINT="" X APCHSURX Q  ;no frequency so skip it
 S APCHSTEX(1)="Consider checking for Strabismus" D  Q
 .D WRITE^APCHSMU
 .X APCHSURX
 .Q
 Q
 ;
WT ;EP - height
 X APCHSURX
 Q:'$$INAC^APCHSMU(APCHSITI)  ;is item turned on or off
 S APCHLAST="",APCHNEXT="" K APCHSTEX
 S APCHICAR=$$LASTITEM^APCLAPIU(APCHSPAT,"WT","MEASUREMENT",,,"A")
 S APCHLAST=$P(APCHICAR,U,1)
 S APCHOVR=$$OVR^APCHSMU(APCHSPAT,APCHSITI)
 I $P(APCHOVR,U)>APCHLAST D  Q
 .S X=$$DATE^APCHSMU($P(APCHOVR,U))_" (per "_$P(APCHOVR,U,2)_")" D S(X) S X=$P(APCHOVR,U,3) D S(X)
 .D PRWT
WTREG ;
 S APCHSINT="",APCHSCRI=$$SITECRIT^APCHSMU(APCHSITI)
 I APCHSCRI S APCHSINT=$$AGESEX^APCHSMU(APCHSITI,APCHSPAT),APCHMIN=$$MINAGE^APCHSMU(APCHSITI,APCHSPAT)
 I 'APCHSCRI S APCHSINT=365,APCHMIN=0
 I APCHSINT="" X APCHSURX Q  ;no frequency so skip it
 I 'APCHSCRI D IHSWT Q
WTREG1 ;
 I APCHLAST="" S APCHSTEX(1)=$$DATE^APCHSMU($$DATEAGE^APCHSMU(APCHSPAT,APCHMIN)) D PRWT Q
 S APCHNEXT=$$FMADD^XLFDT(APCHLAST,APCHSINT)
 I APCHNEXT>DT S APCHSTEX(1)=$$DATE^APCHSMU(APCHNEXT)
 I APCHNEXT'>DT S APCHSTEX(1)=$$DATE^APCHSMU(APCHNEXT)
 D PRWT
 Q
 ;
IHSWT ;use IHS default criteria
 I APCHLAST="" S APCHSTEX(1)=$$DATE^APCHSMU($$DATEAGE^APCHSMU(APCHSPAT,APCHMIN)) D PRWT Q  ;never had one recorded so due on DOB
 I APCHSAGE>1 S APCHSINT=365 D WTREG1 Q
 ;calculate next date due
 S APCHDAYS=$$FMDIFF^XLFDT(DT,APCHSDOB)
 I APCHDAYS>0,APCHDAYS<(2*30.5) S APCHSTEX(1)=$$DATE^APCHSMU($$FMADD^XLFDT(APCHSDOB,(2*30.5))) D PRWT Q
 I APCHDAYS'<(2*30.5),APCHDAYS<(4*30.5) S APCHNEXT=$$FMADD^XLFDT(APCHSDOB,(4*30.5)),APCHLDUE=$$FMADD^XLFDT(APCHSDOB,(2*30.5)) D WTT Q
 I APCHDAYS'<(4*30.5),APCHDAYS<(6*30.5) S APCHNEXT=$$FMADD^XLFDT(APCHSDOB,(6*30.5)),APCHLDUE=$$FMADD^XLFDT(APCHSDOB,(4*30.5)) D WTT Q
 I APCHDAYS'<(6*30.5),APCHDAYS<365 S APCHNEXT=$$FMADD^XLFDT(APCHSDOB,365),APCHLDUE=$$FMADD^XLFDT(APCHSDOB,(6*30.5)) D WTT Q
 I APCHDAYS'<365,APCHDAYS<(18*30.5) S APCHNEXT=$$FMADD^XLFDT(APCHSDOB,(18*30.5)),APCHLDUE=$$FMADD^XLFDT(APCHSDOB,365) D WTT Q
 S APCHNEXT=$$FMADD^XLFDT(APCHSDOB,(2*365)),APCHLDUE=$$FMADD^XLFDT(APCHSDOB,(18*30.5)) D WTT Q
 Q
WTT ;
 I APCHLDUE>APCHLAST S APCHSTEX(1)=$$DATE^APCHSMU(APCHLDUE) D PRWT Q
 I APCHNEXT<DT S APCHSTEX(1)=$$DATE^APCHSMU(APCHNEXT) D PRWT Q
 I APCHNEXT'<DT S APCHSTEX(1)=$$DATE^APCHSMU(APCHNEXT) D PRWT Q
 Q
PRWT ;
 S V=$$REF^APCHSMU(APCHSPAT,9999999.07,$O(^AUTTMSR("B","WT",0)),APCHLAST) I V]"" S X=$P(V,U) D S(X) S X=$P(V,U,2) I X]"" D S(X)
 D WRITE^APCHSMU X APCHSURX
 Q
 ;
REF ;
 K APCHREF S APCHT=0 F  S APCHT=$O(^ATXLAB(APCHTAXN,21,"B",APCHT)) Q:APCHT'=+APCHT  D
 .S V=$$REF^APCHSMU(APCHSPAT,60,APCHT,APCHLAST) I V]"" S APCHREF(9999999-$P(V,U,3))=V
 I $D(APCHREF) S %=0,%=$O(APCHREF(%)) I % S V=APCHREF(%),X=$P(V,U) D S(X) S X=$P(V,U,2) I X]"" D S(X)
 Q
URIN ;
 X APCHSURX
 Q:'$$INAC^APCHSMU(APCHSITI)  ;is item turned on or off
 S APCHSINT="",APCHSCRI=$$SITECRIT^APCHSMU(APCHSITI)
 I 'APCHSCRI,APCHSAGE<13 S APCHSINT=365,APCHMIN=5
 I 'APCHSCRI Q:APCHSAGE<5
 I APCHSCRI S APCHSINT=$$AGESEX^APCHSMU(APCHSITI,APCHSPAT),APCHMIN=$$MINAGE^APCHSMU(APCHSITI,APCHSPAT)
 S APCHLAST="",APCHNEXT="",APCHICAR="" K APCHSTEX
 S APCHTAXN=$O(^ATXLAB("B","DM AUDIT URINALYSIS TAX",0))
 I APCHSINT,APCHTAXN="" S APCHSTEX(1)="DM AUDIT URINALYSIS TAX Taxonomy Missing" D WRITE^APCHSMU X APCHSURX Q
 S APCHICAR=$$LASTLAB^APCLAPIU(APCHSPAT,,,,$O(^ATXLAB("B","DM AUDIT URINALYSIS TAX",0)),,$O(^ATXAX("B","DM AUDIT URINALYSIS LOINC",0)),"A")
 S APCHLAST=$P(APCHICAR,U,1)
 S APCHOVR=$$OVR^APCHSMU(APCHSPAT,APCHSITI)
 I $P(APCHOVR,U)>APCHLAST D  Q
 .S X=$$DATE^APCHSMU($P(APCHOVR,U))_" (per "_$P(APCHOVR,U,2)_")" D S(X) S X=$P(APCHOVR,U,3) D S(X)
 .D REF
 .D WRITE^APCHSMU
 .X APCHSURX
 .Q
URINREG ;regular stuff
 I APCHSINT="" X APCHSURX Q  ;no frequency so skip it
 I APCHLAST="" S APCHSTEX(1)=$$DATE^APCHSMU($$DATEAGE^APCHSMU(APCHSPAT,APCHMIN)) D  Q
 .D REF
 .D WRITE^APCHSMU
 .X APCHSURX
 .Q
 S APCHSOLD=$$FMDIFF^XLFDT(APCHLAST,APCHSDOB)
 I 'APCHSCRI,APCHSAGE>3,APCHSOLD<(3*365) S APCHSTEX(1)=$$DATE^APCHSMU($$FMADD^XLFDT(APCHSDOB,(5*365))) D REF,WRITE^APCHSMU X APCHSURX Q
 I 'APCHSCRI,APCHSAGE>3,APCHSOLD>(3*365) X APCHSURX Q
 S APCHNEXT=$$FMADD^XLFDT(APCHLAST,APCHSINT)
 I APCHNEXT>DT S APCHSTEX(1)=$$DATE^APCHSMU(APCHNEXT)
 I APCHNEXT'>DT S APCHSTEX(1)=$$DATE^APCHSMU(APCHNEXT)
 D REF
 D WRITE^APCHSMU
 X APCHSURX
 Q
 ;
VISIWT ;
 S V=$$REF^APCHSMU(APCHSPAT,9999999.15,$O(^AUTTEXAM("C","19",0)),APCHLAST) I V]"" S X=$P(V,U) D S(X) S X=$P(V,U,2) I X]"" D S(X)
 D WRITE^APCHSMU
 X APCHSURX
 Q
VISI ;
 Q:'$$INAC^APCHSMU(APCHSITI)  ;is item turned on or off
 S APCHLAST="",APCHNEXT="" K APCHSTEX
 S APCHICAR=$$LASTVAE^APCLAPI1(APCHSPAT,,,"A")
 S APCHLAST=$P(APCHICAR,U,1)
VISIREG ;regular stuff
 S APCHSINT="",APCHSCRI=$$SITECRIT^APCHSMU(APCHSITI)
 I 'APCHSCRI,APCHSAGE>64 S APCHSINT=(2*365),APCHMIN=64
 I APCHSCRI S APCHSINT=$$AGESEX^APCHSMU(APCHSITI,APCHSPAT),APCHMIN=$$MINAGE^APCHSMU(APCHSITI,APCHSPAT) ;return in APCHSINT the frequency in days for this age/sex
 I APCHSINT="" X APCHSURX Q  ;no frequency so skip it
 I APCHLAST="" S APCHSTEX(1)=$$DATE^APCHSMU($$DATEAGE^APCHSMU(APCHSPAT,APCHMIN)) D VISIWT Q
 S APCHNEXT=$$FMADD^XLFDT(APCHLAST,APCHSINT)
 I APCHNEXT>DT S APCHSTEX(1)=$$DATE^APCHSMU(APCHNEXT)
 I APCHNEXT'>DT S APCHSTEX(1)=$$DATE^APCHSMU(APCHNEXT)
 D VISIWT
 Q
DOMVWT ;
 D WRITE^APCHSMU
 X APCHSURX
 Q
DOMV ;EP - domestic violence
 Q:'$$INAC^APCHSMU(APCHSITI)  ;is item turned on or off
 S APCHLAST="",APCHNEXT="" K APCHSTEX
 S APCHLAST=$$LASTHF^APCHSMU(APCHSPAT,"DOMESTIC VIOLENCE")
DOMVREG ;regular stuff
 S APCHSINT="",APCHSCRI=$$SITECRIT^APCHSMU(APCHSITI)
 I 'APCHSCRI,APCHSAGE>14 S APCHSINT=365
 I APCHSCRI S APCHSINT=$$AGESEX^APCHSMU(APCHSITI,APCHSPAT) ;return in APCHSINT the frequency in days for this age/sex
 I APCHSINT="" X APCHSURX Q  ;no frequency so skip it
 I APCHLAST="" S APCHSTEX(1)=$$DATE^APCHSMU($$DATEAGE^APCHSMU(APCHSPAT,APCHMIN)) D DOMVWT Q
 S APCHNEXT=$$FMADD^XLFDT(APCHLAST,APCHSINT)
 I APCHNEXT>DT S APCHSTEX(1)=$$DATE^APCHSMU(APCHNEXT)
 I APCHNEXT'>DT S APCHSTEX(1)=$$DATE^APCHSMU(APCHNEXT)
 D DOMVWT
 Q
IPVWT ;
 K APCHV
 S V=$$REF^APCHSMU(APCHSPAT,9999999.15,$O(^AUTTEXAM("C","34",0)),APCHLAST)
 I V]"" S X=$P(V,U,3) S APCHV((9999999-X))=$P(V,U,1,2)
 ;now look at AMHREC field
 S APCHC=0,V=""
 S E=9999999-APCHLAST,D=9999999-DT-1_".99" F  S D=$O(^AMHREC("AE",APCHSPAT,D)) Q:D'=+D!($P(D,".")>E)  S V=0 F  S V=$O(^AMHREC("AE",APCHSPAT,D,V)) Q:V'=+V  D
 .S X=$P($G(^AMHREC(V,14)),U)
 .I X="" Q  ;no test
 .I $E(X)="U" S APCHV(D)="Unable to Screen INT PARTNER VIOLENCE SCREEN",$P(APCHV(D),U,2)="on "_$$FMTE^XLFDT((9999999-$P(D,".")))
 .I X="REF" S APCHV(D)="Patient Refused INT PARTNER VIOLENCE SCREEN ",$P(APCHV(D),U,2)="on "_$$FMTE^XLFDT((9999999-$P(D,".")))
 .Q
 I $O(APCHV(0)) S Y=$O(APCHV(0)) S Z=9999999-Y I Z>APCHLAST S X=$P(APCHV(Y),U) D S(X) S X=$P(APCHV(Y),U,2) I X]"" D S(X)
IPVWT1 ;
 D WRITE^APCHSMU
 X APCHSURX
 Q
IPV ;EP
 Q:'$$INAC^APCHSMU(APCHSITI)  ;is item turned on or off
 S APCHLAST="",APCHNEXT="" K APCHSTEX
 S APCHICAR=$$LASTIPVS^APCLAPI(APCHSPAT,,,"A")
 S APCHLAST=$P(APCHICAR,U,1)
IPVREG ;regular stuff
 S APCHSINT="",APCHSCRI=$$SITECRIT^APCHSMU(APCHSITI)
 I 'APCHSCRI,APCHSAGE>14,$P(^DPT(APCHSPAT,0),U,2)="F" S APCHSINT=365,APCHMIN=15
 I APCHSCRI S APCHSINT=$$AGESEX^APCHSMU(APCHSITI,APCHSPAT),APCHMIN=$$MINAGE^APCHSMU(APCHSITI,APCHSPAT) ;return in APCHSINT the frequency in days for this age/sex
 I APCHSINT="" X APCHSURX Q  ;no frequency so skip it
 I APCHLAST="" S APCHSTEX(1)=$$DATE^APCHSMU($$DATEAGE^APCHSMU(APCHSPAT,APCHMIN)) D IPVWT Q
 S APCHNEXT=$$FMADD^XLFDT(APCHLAST,APCHSINT)
 I APCHNEXT>DT S APCHSTEX(1)=$$DATE^APCHSMU(APCHNEXT)
 I APCHNEXT'>DT S APCHSTEX(1)=$$DATE^APCHSMU(APCHNEXT)
 D IPVWT
 Q
LASTIPV(P) ;
 ;look for exams and bh
 NEW APCHG,%,APCHX,APCHC,APCHV
 K APCHG,APCHX S %=P_"^LAST EXAM 34",E=$$START1^APCLDF(%,"APCHG(")
 I $D(APCHG(1)) S APCHX(9999999-$P(APCHG(1),U))=""
 ;now look at AMHREC field
 S APCHC=0,APCHV=""
 S E=0,D=9999999-DT-1_".99" F  S D=$O(^AMHREC("AE",P,D)) Q:D'=+D!(APCHC)  S V=0 F  S V=$O(^AMHREC("AE",P,D,V)) Q:V'=+V!(APCHC)  D
 .S X=$P($G(^AMHREC(V,14)),U)
 .I X="" Q  ;no test
 .I $E(X)="U" Q  ;don't count refusal here
 .I X="REF" Q
 .S APCHC=APCHC+1,APCHX($P(D,"."))=""
 I $O(APCHX(0)) Q (9999999-$O(APCHX(0)))
 Q ""
