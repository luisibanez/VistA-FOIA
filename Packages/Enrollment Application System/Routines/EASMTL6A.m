EASMTL6A ; MIN/TCM ALB/SCK/PHH - AUTOMATED MEANS TEST LETTER-PRINT LETTERS CONT ; 3/10/03 4:07pm
 ;;1.0;ENROLLMENT APPLICATION SYSTEM;**3,14,15,29,28,54**;MAR 15,2001
 ;
LETTER(EASN,TYPE) ;Print letter
 ; Input
 ;     EASN    - File #713.2 IEN
 ;     TYPE    - Letter type
 ;
 N DFN,EASADD,EASIN,EASNME,EALNE,EASFAC,MSG,TAB,EAFIEN,EAX,LINE,EASANV,EASX,VADM,VAROOT,OFFSET,EASPTR,EASLIEN,EASITE,EASRTE,EASDEM,POP
 ;
 S TAB=3 ; Tab spacing for letters
 S OFFSET=+$$GET1^DIQ(713,1,10) ; Get print offset for address
 ;
 ;  Get patient data for letter
 S EASPTR=$$GET1^DIQ(713.2,EASN,2,"I")
 I EASPTR]"" S DFN=$$GET1^DIQ(713.1,EASPTR,.01,"I")
 E  S DFN=-1
 ; Get patient mailing information
 D GETPAT(DFN,.EASDEM,.EASADD)
 ;  Get return address info
 D GETFAC^EASMTL6(DFN,.EASFAC)
 ;
 W @IOF
 I EASFAC(100)]"" D
 . W !!?TAB+OFFSET,EASFAC(100)
 E  D
 . W !!?TAB+OFFSET,"VA MEDICAL CENTER"
 W ?(IOM-10),$E(EASDEM(1),1,1),EASDEM(2)
 ;
 W !?TAB+OFFSET,EASFAC(1.01)
 I EASFAC(1.02)]"" W !?TAB+OFFSET,EASFAC(1.02)
 W !?TAB+OFFSET,EASFAC(1.03)_" "_$P(EASFAC(.02),U,2)_" "_EASFAC(1.04)
 W !!!?TAB+OFFSET,$$FMTE^XLFDT(DT,1)
 ;
 ;; generic test letter setup
 I DFN>0 D
 . S EASNME("FILE")=2,EASNME("IENS")=DFN,EASNME("FIELD")=.01
 . W !!!!?TAB+OFFSET,$$NAMEFMT^XLFNAME(.EASNME,"G")
 E  D
 . W !!!!?TAB+OFFSET,EASDEM(1)
 ;;
 W !?TAB+OFFSET,EASADD(1)
 ;
 I EASADD(2)]"" W !?TAB+OFFSET,EASADD(2)
 W !?TAB+OFFSET,EASADD(4)
 I +EASADD(5) W " ",$$GET1^DIQ(5,$P(EASADD(5),U),1)
 W " ",$P(EASADD(11),U,2)
 ;
 S EASANV=$$GET1^DIQ(713.2,EASN,3,"I")
 W !!!!,?TAB,"MEANS TEST ANNIVERSARY DATE: ",$$FMTE^XLFDT($$ADDLEAP^EASMTUTL(EASANV))
 ;
 S EASX=$P(EASDEM(5),U)
 ;; Patch 15
 W !!,?TAB,"Dear ",$S(EASX="M":"Mr. ",EASX="F":"Ms. ",1:"Mr./Ms. ")
 W $S(DFN>0:$$NAMEFMT^XLFNAME(.EASNME,"O","M"),1:"TEST"),":"
 ;;
 ;  Print letter body
 S EASLIEN=$O(^EAS(713.3,"C",TYPE,0))
 Q:'EASLIEN
 S EALNE=0
 ;
 W !
 F  S EALNE=$O(^EAS(713.3,EASLIEN,1,EALNE)) Q:'EALNE  D
 . S LINE=^EAS(713.3,EASLIEN,1,EALNE,0)
 . I LINE["|ANNVDT|" W !?TAB,$P(LINE,"|ANNVDT|",1),$$FMTE^XLFDT($$ADDLEAP^EASMTUTL(EASANV)),$P(LINE,"|ANNVDT|",2) Q
 . W !?TAB,LINE
 ;
 ; Retrieve division section of letter
 S EAFIEN=$O(^EAS(713.3,EASLIEN,2,"B",+EASFAC("FACNUM"),0))
 ;
 I 'EAFIEN D  ; Print default signature block
 . N EAX,LINE
 . F EAX=1:1:9  D
 . . S LINE=$P($T(DEFSIG+EAX),";;",2)
 . . I LINE["|FAC|" W !?TAB,$P(LINE,"|FAC|",1),$S(EASFAC(100)]"":EASFAC(100),1:"VA Medical Center"),$P(LINE,"|FAC|",2) Q
 . . W !?TAB,LINE
 ;
 I EAFIEN D  ; Print division/facility signature block
 . S EALNE=0
 . F  S EALNE=$O(^EAS(713.3,EASLIEN,2,EAFIEN,1,EALNE)) Q:'EALNE  D
 . . W !?TAB,^EAS(713.3,EASLIEN,2,EAFIEN,1,EALNE,0)
 ;
 W !!?TAB,"Enclosure"
 Q
 ;
GETPAT(DFN,EASDEM,EASADD) ; Get patient information
 N VAROOT,VA
 ;
 ;; Patch 15, Generic test letter
 I DFN<0 D  Q
 . S EASDEM(1)="TEST LETTER (DO NOT MAIL!)"
 . S EASDEM(2)="6789"
 . S EASDEM(5)="M"
 . S EASADD(1)="THIS IS A TEST LETTER STREET ADDRESS"
 . S EASADD(2)=""
 . S EASADD(4)="ANYTOWN"
 . S EASADD(5)="36^NEW YORK"
 . S EASADD(11)="111110000^11111-0000"
 ;; End patch 15
 ;
 S VAROOT="EASADD"
 D ADD^VADPT
 ;
 S VAROOT="EASDEM"
 D DEM^VADPT
 ;
 D PID^VADPT6
 S EASDEM(2)=VA("BID")
 Q
 ;
CHKADR(EASPTR) ; Check for valid address
 N EASADD,RSLT,DFN,VAROOT
 ;
 S DFN=$$GET1^DIQ(713.1,EASPTR,.01,"I")
 S RSLT=1
 S VAROOT="EASADD"
 D ADD^VADPT
 ;; Check for valid mailing address
 I EASADD(1)]"",EASADD(4)]"",EASADD(5)]"",EASADD(11)]"" S RSLT=0
 ;; Check for Bad Address Indicator
 S EASADD("BAI")=$$BADADR^DGUTL3(DFN),$P(EASADD("BAI"),U,2)=$$EXTERNAL^DILFD(2,.121,"",+EASADD("BAI"))
 S:'RSLT&(EASADD("BAI")) RSLT=1
 D:RSLT ADRERR^EASMTUTL(.EASADD,DFN)
 Q $G(RSLT)
 ;
DEFSIG ; Default closing and signature block
 ;;Thank you for your assistance and cooperation.  If you have any
 ;;questions or need assistance in the completion of the information
 ;;requested, please contact the |FAC| Business 
 ;;Office between 8:00am and 4:00pm Monday through Friday.
 ;;
 ;;Sincerely,
 ;;
 ;;
 ;;
