AGED10 ; IHS/ASDS/EFG - EDIT PAGE NOK ;  
 ;;7.1;PATIENT REGISTRATION;;AUG 25,2005
 S AG("N")=7
VAR D DRAW
 W !,AGLINE("EQ") W !?23,"CHANGE which item? (1-",AG("N"),") NONE// " D READ^AGED1 G ^AGED8:$D(DUOUT)&'$D(AGXTERN),END:$D(DLOUT)!(Y["N"),VAR:$D(AG("ERR")) G:$D(AG("ED"))&'$D(AGXTERN) @("^AGED"_AG("ED"))
 Q:$D(DTOUT)!$D(DFOUT)  I $D(DQOUT)!(+Y<1)!(+Y>AG("N")) D QUES^AGED1 G VAR
CC S AG("C")="NKNAME^AG8B,NKPH^AG8B,NKREL^AG8B,NKSTR^AG8B,NKCITY^AG8B,NKST^AG8B,NKZIP^AG8B"
C ;EP - Edit multiple fields on a Reg edit page.
 S AGY=Y F AGI=1:1 S AG("SEL")=+$P(AGY,",",AGI) Q:AG("SEL")<1!(AG("SEL")>AG("N"))  D @($P(AG("C"),",",AG("SEL")))
 D UPDATE1^AGED(DUZ(2),DFN,10,"") K AGI,AGY
EC ;
 G VAR
END K AG,DUOUT,DFOUT,DTOUT,DQOUT,DLOUT,DA,AGSCRN,Y
 Q:$D(AGXTERN)
 G ^AGED11
DRAW ;EP
 S AG("PG")=10,DA=DFN,AGSCRN=$P($T(@1),";;",2,8) D ^AGED K ^UTILITY("DIQ1",$J)
 F AG=1:1:7 W:AG=4 !?37,"Address" S X=$P(AGSCRN,";;",AG),DIC=$P(X,U,3),DR=$P(X,U,4) W !,AG,".",?$P(X,U,2),$P($G(^DD(DIC,DR,0)),U)," :  " D EN^DIQ1 I $D(^(DR)) W ^(DR)
 Q
1 ;;^11^2^.211;;^13^2^.219;;^6^9000001^2802;;^4^2^.213;;^6^2^.216;;^5^2^.217;;^7^2^.218
