LRWOMEN ;DALOI/CYM/FT -  LINK TO WOMEN'S HEALTH PROGRAM ;10/22/04  13:14
 ;;5.2;LAB SERVICE;**231,248,311,324**;Sep 27, 1994
 ;
 ;Reference to CREATE^WVLRLINK supported by IA #2772
 ;Reference to DELETE^WVLRLINK supported by IA #2772
 ;Reference to MOVE^WVLRLINK supported by IA #2772
 ;Reference to ^XPDUTL supported by IA #10141
 ;Reference to ^ORB3LAB supported by IA #4287
 ;Reference to CREATE^WVLABCHK supported by IA #4525
 ;
ADD ; From DD 63.08,.11 and 63.09,.11
 Q:+$G(LRDPF)'=2
 Q:'$D(LRSS)
 Q:$P(^LR(LRDFN,LRSS,LRI,0),U,11)']""
 I $$PATCH^XPDUTL("OR*3.0*210") D
 .Q:$G(LRAPOLDF)=1
 .D LAB^ORB3LAB(DFN,LRDFN,LRI,$G(LRA),LRSS)
 Q:$G(SEX)'["F"
 Q:$T(CREATE^WVLRLINK)']""
 D CREATE^WVLRLINK(DFN,LRDFN,LRI,$G(LRA),LRSS)
 Q
DEL ; From LRAPM
 Q:$G(SEX)'["F"
 Q:+$G(LRDPF)'=2
 Q:'$D(LRSS)
 Q:$P(^LR(LRDFN,LRSS,LRI,0),U,11)]""
 Q:$T(DELETE^WVLRLINK)']""
 D DELETE^WVLRLINK(DFN,LRDFN,LRI,X,LRSS)
 Q
MOVE ; From LRAPMV
 ; no longer used after LR*5.2*259
 Q
SNOMED ; From DD 63.08,10 and 63.09,10
 Q:+$G(LRDPF)'=2
 Q:'$D(LRSS)
 Q:$P(^LR(LRDFN,LRSS,LRI,0),U,11)=""
 Q:$G(SEX)'["F"
 Q:$T(CREATE^WVLABCHK)']""
 D CREATE^WVLABCHK(DFN,LRDFN,LRI,$G(LRA),LRSS)
 Q
