ACMSRT2 ; IHS/TUCSON/TMJ - GETS SORT INFOR FOR CNSR ;
 ;;2.0;ACM CASE MANAGEMENT SYSTEM;;JAN 10, 1996
 ;EP;ENTRY POINT:
EN D SET,INIT:'$D(ACMQUIT),MENU:'$D(ACMQUIT)
 Q
SET S ACMRPT=$P(ACMENTRY,";;",2),ACMPTMP=$O(^DIPT("B","ACM "_ACMRPT,""))
 I '$D(ACMPTMP)!(ACMPTMP="") S ACMQUIT="" Q
 S ACMFILE=$P(ACMENTRY,";;",3),ACMDIC="^ACM("_ACMFILE_","
 Q
INIT S FLDS="[`"_ACMPTMP_"]",FR="",TO="",ACMN=1,ACMMAND=99,ACMCSTG="^99^"
 S:'$D(BY) BY="" I BY'["EDITED NOT PRINTED" S BY=""
 Q
MENU S ACMYX="",ACMYI=0
 F  S ACMYX=$O(^ACM(48.5,"B",ACMYX)) Q:ACMYX=""  S ACMYY=0 F  S ACMYY=$O(^ACM(48.5,"B",ACMYX,ACMYY)) Q:'ACMYY!($D(ACMDM)&(ACMYX="REGISTER"))  I $D(^ACM(48.5,ACMYY,2,"B",ACMPTMP)) D M1
 W !
 Q
M1 N ACMYZ
 S ACMYZ=$O(^ACM(48.5,ACMYY,2,"B",ACMPTMP,"")),ACMYZ=^(ACMYZ)
 ;S ACMYI=ACMYI+1,ACMUB(ACMYY)=ACMYY_U_ACMYX_U_ACMYZ
 S ACMYI=ACMYI+1,ACMUB(ACMYI)=ACMYY_U_ACMYX_U_ACMYZ
 Q
