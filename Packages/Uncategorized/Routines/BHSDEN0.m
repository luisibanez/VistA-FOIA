BHSDEN0 ;IHS/CIA/MGH - Health Summary for Dental ;17-Mar-2006 10:36;MGH
 ;;1.0;HEALTH SUMMARY COMPONENTS;;March 17, 2006
 ;===================================================================
 ;Taken from ADERVW0
 ; IHS/HQT/MJL  - DENTAL CHART REVW PT 2 ;09:34 PM  [ 03/24/1999   9:04
 ;;6.0;ADE;;APRIL 1999
 ;Health summary for dental, printout of data
PRTTXT ;EP
 S ADEDLT=1,ADEILN=IOM-ADEICL-1
 F ADEQ=0:0 S:ADENRQ]""&(($L(ADENRQ)+$L(ADETXT)+2)<255) ADETXT=$S(ADETXT]"":ADETXT_"; ",1:"")_ADENRQ,ADENRQ="" Q:ADETXT=""  D PRTTXT2
 K ADEILN,ADEDLT,ADEF,ADEC,ADETXT
 Q
PRTTXT2 D GETFRAG D CKP^GMTSUP Q:$D(GMTSSQIT)  W ?ADEICL W ADEF,! S ADEICL=ADEICL+ADEDLT,ADEILN=ADEILN-ADEDLT,ADEDLT=0
 Q
GETFRAG I $L(ADETXT)<ADEILN S ADEF=ADETXT,ADETXT="" Q
 F ADEC=ADEILN:-1:1 Q:$E(ADETXT,ADEC)=" "
 S ADEF=$E(ADETXT,1,ADEC-1),ADETXT=$E(ADETXT,ADEC+1,255)
 Q
GETSITE ;EP
 S:ADESITE="" ADESITE="null"
 S %=$S($D(^AUTTLOC(ADESITE,0)):^(0),1:"")
 S ADENSH=$P(%,U,2) I ADENSH="" S ADENSH="<"_ADESITE_">"
 Q
HEADER ;EP
 S ADEPG=ADEPG+1,ADEHD2=$P(^DPT(ADEPAT,0),U,1)_"  (DENTAL SUMMARY)  pg. "_ADEPG,%="",$P(%,"*",((IOM-4-$L(ADEHD2))\2)+1)="*",%=%_" "_ADEHD2_" "_%
 D CKP^GMTSUP Q:$D(GMTSQIT)
 W !,ADEHDR,!,%,!
 Q
 ;
BREAK S %="",$P(%,"-",IOM-3-$L(GMTSEGH_GMTSEGL)/2)="",%=%_" "_GMTSEGH_GMTSEGL_" "_% W !,%,!!
 Q