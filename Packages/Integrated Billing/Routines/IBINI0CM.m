IBINI0CM	; ; 21-MAR-1994
	;;Version 2.0 ; INTEGRATED BILLING ;; 21-MAR-94
	F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q	Q
	;;^UTILITY(U,$J,"DIE",1071,"DR",2,2,1)
	;;=S:X="N" Y="@915" S:X="Y" DIE("NO^")="";.1217;I X']"" W !?4,*7,"But I need a Start Date for this Temporary Address." S Y=.12105;.1218;.1211;I X']"" W !?4,*7,"But I need at least one line of a Temporary address." S Y=.12105;.1212;
	;;^UTILITY(U,$J,"DIE",1071,"DR",2,2,2)
	;;=S:X']"" Y=.1214;.1213;.1214;.1215;.12112;.1219;@915;K DIE("NO^");@16;
	;;^UTILITY(U,$J,"DIE",1071,"DR",3,2.01)
	;;=.01:1
	;;^UTILITY(U,$J,"DIE",1071,"ROU")
	;;=^IBXSC1
	;;^UTILITY(U,$J,"DIE",1071,"ROUOLD")
	;;=IBXSC1
	;;^UTILITY(U,$J,"DIE",1072,0)
	;;=IB SCREEN2^2940308.1606^@^399^10882^@^2940316
	;;^UTILITY(U,$J,"DIE",1072,"DIAB",1,0,399,0)
	;;=.02:
	;;^UTILITY(U,$J,"DIE",1072,"DR",1,399)
	;;=^2^DPT(^^S I(0,0)=D0 S Y(1)=$S($D(^DGCR(399,D0,0)):^(0),1:"") S X=$P(Y(1),U,2),X=X S D(0)=+X S X=$S(D(0)>0:D(0),1:"");
	;;^UTILITY(U,$J,"DIE",1072,"DR",2,2)
	;;=S:IBDR20'["21" Y="@41";.07;.31115;I $S(X']"":1,X=3:1,X=9:1,1:0) S Y="@41";.3111;S:X']"" Y="@41";.3113;S:X']"" Y=.3116;.3114;S:X']"" Y=.3116;.3115;.3116;.3117;.2205;.3119;@41;S:IBDR20'["22" Y="@42";.251;S:X']"" Y="@42";.252;
	;;^UTILITY(U,$J,"DIE",1072,"DR",2,2,1)
	;;=S:X']"" Y=.255;.253;S:X']"" Y=.255;.254;.255;.256;.2206;.258;@42;
	;;^UTILITY(U,$J,"DIE",1072,"ROU")
	;;=^IBXSC2
	;;^UTILITY(U,$J,"DIE",1072,"ROUOLD")
	;;=IBXSC2
	;;^UTILITY(U,$J,"DIE",1074,0)
	;;=IB SCREEN4^2940227.17^@^399^10882^@^2940314
	;;^UTILITY(U,$J,"DIE",1074,"DIAB",1,1,399.04,0)
	;;=ALL
	;;^UTILITY(U,$J,"DIE",1074,"DR",1,399)
	;;=S:IBDR20'["41" Y="@42";160;159;158;@42;S:IBDR20'["42" Y="@43";162;@43;S:IBDR20'["43" Y="@45";I IBPTF S Y="@943";S Y="@45";@943;D DX^IBCSC4B;@45;@46;S:IBDR20'["46" Y="@47";41;@47;S:IBDR20'["47" Y="@44";40;@44;S:IBDR20'["44" Y="@48";
	;;^UTILITY(U,$J,"DIE",1074,"DR",1,399,1)
	;;=S IBZ20=$P(^DGCR(399,DA,0),U,9);.09;D PRO^IBCSC4B;S IBASKCOD=1;@48;S:IBDR20'["48" Y="@49";I $P(^DGCR(399,DA,0),U,19)=2 S Y="@49";47;@49;
	;;^UTILITY(U,$J,"DIE",1074,"DR",2,399.04)
	;;=.01
	;;^UTILITY(U,$J,"DIE",1074,"DR",2,399.041)
	;;=.01;.02;I $P(^DGCR(399,DA(1),0),U,19)'=2 S Y="@454";.03;S Y="@455";@454;I '$P(^DGCR(399.1,+^DGCR(399,DA(1),"OC",DA,0),0),U,10) S Y="@455";.04;@455;
	;;^UTILITY(U,$J,"DIE",1074,"DR",2,399.047)
	;;=.01;.02;
	;;^UTILITY(U,$J,"DIE",1074,"ROU")
	;;=^IBXSC4
	;;^UTILITY(U,$J,"DIE",1074,"ROUOLD")
	;;=IBXSC4
	;;^UTILITY(U,$J,"DIE",1075,0)
	;;=IB SCREEN5^2940227.1701^@^399^10882^@^2940318
	;;^UTILITY(U,$J,"DIE",1075,"DIAB",1,1,399.04,0)
	;;=ALL
	;;^UTILITY(U,$J,"DIE",1075,"DIAB",1,1,399.043,0)
	;;=ALL
	;;^UTILITY(U,$J,"DIE",1075,"DR",1,399)
	;;=S:IBDR20'["53" Y="@51";S:$D(IBOUT) Y="@999";43;@999;K IBOUT;@51;S:IBDR20'["51" Y="@52";.03;@52;S:IBDR20'["52" Y="@55";@55;@56;S:IBDR20'["57" Y="@58";41;@56;@58;S:IBDR20'["58" Y="@54";40;@54;S:IBDR20'["54" Y="@59";
	;;^UTILITY(U,$J,"DIE",1075,"DR",1,399,1)
	;;=S IBZ20=$P(^DGCR(399,DA,0),U,9);.09;S IBASKCOD=1;@59;S:IBDR20'["59" Y="@999";I $P(^DGCR(399,DA,0),U,19)=2 S Y="@999";47;@999;
	;;^UTILITY(U,$J,"DIE",1075,"DR",2,399.04)
	;;=.01
	;;^UTILITY(U,$J,"DIE",1075,"DR",2,399.041)
	;;=.01;.02;I $P(^DGCR(399,DA(1),0),U,19)'=2 S Y="@554";.03;S Y="@555";@554;I '$P(^DGCR(399.1,+^DGCR(399,DA(1),"OC",DA,0),0),U,10) S Y="@555";.04;@555;
	;;^UTILITY(U,$J,"DIE",1075,"DR",2,399.043)
	;;=.01
	;;^UTILITY(U,$J,"DIE",1075,"DR",2,399.047)
	;;=.01;.02;
	;;^UTILITY(U,$J,"DIE",1075,"ROU")
	;;=^IBXSC5
	;;^UTILITY(U,$J,"DIE",1075,"ROUOLD")
	;;=IBXSC5
	;;^UTILITY(U,$J,"DIE",1076,0)
	;;=IB SCREEN6^2940201.1541^@^399^10882^@^2940317
	;;^UTILITY(U,$J,"DIE",1076,"DR",1,399)
	;;=S:IBDR20'["61" Y="@62";.06;216;217;@62;S:IBDR20'["62" Y="@63";155;S:X=0 Y=156;157;156;S:'$D(IBOX) Y="@63";153;@63;S:IBDR20'["63" Y="@64";151;152;@64;S:IBDR20'["64" Y="@65";161;165;@65;S:IBDR20'["65" Y="@66";D RCD^IBCU1;42;202;