IBINI0B7	; ; 21-MAR-1994
	;;Version 2.0 ; INTEGRATED BILLING ;; 21-MAR-94
	Q:'DIFQR(399.2)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q	Q
	;;^UTILITY(U,$J,399.2)
	;;=^DGCR(399.2,
	;;^UTILITY(U,$J,399.2,0)
	;;=REVENUE CODE^399.2I^999^999
	;;^UTILITY(U,$J,399.2,1,0)
	;;=001^TOTAL CHARGE^1^TOTAL CHARGE
	;;^UTILITY(U,$J,399.2,2,0)
	;;=002^*RESERVED^0^*RESERVED
	;;^UTILITY(U,$J,399.2,3,0)
	;;=003^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,4,0)
	;;=004^*RESERVED^0^*RESERVED
	;;^UTILITY(U,$J,399.2,5,0)
	;;=005^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,6,0)
	;;=006^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,7,0)
	;;=007^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,8,0)
	;;=008^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,9,0)
	;;=009^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,10,0)
	;;=010^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,11,0)
	;;=011^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,12,0)
	;;=012^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,13,0)
	;;=013^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,14,0)
	;;=014^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,15,0)
	;;=015^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,16,0)
	;;=016^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,17,0)
	;;=017^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,18,0)
	;;=018^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,19,0)
	;;=019^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,20,0)
	;;=020^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,21,0)
	;;=021^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,22,0)
	;;=022^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,23,0)
	;;=023^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,24,0)
	;;=024^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,25,0)
	;;=025^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,26,0)
	;;=026^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,27,0)
	;;=027^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,28,0)
	;;=028^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,29,0)
	;;=029^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,30,0)
	;;=030^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,31,0)
	;;=031^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,32,0)
	;;=032^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,33,0)
	;;=033^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,34,0)
	;;=034^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,35,0)
	;;=035^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,36,0)
	;;=036^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,37,0)
	;;=037^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,38,0)
	;;=038^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,39,0)
	;;=039^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,40,0)
	;;=040^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,41,0)
	;;=041^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,42,0)
	;;=042^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,43,0)
	;;=043^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,44,0)
	;;=044^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,45,0)
	;;=045^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,46,0)
	;;=046^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,47,0)
	;;=047^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,48,0)
	;;=048^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,49,0)
	;;=049^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,50,0)
	;;=050^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,51,0)
	;;=051^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,52,0)
	;;=052^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,53,0)
	;;=053^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,54,0)
	;;=054^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,55,0)
	;;=055^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,56,0)
	;;=056^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,57,0)
	;;=057^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,58,0)
	;;=058^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,59,0)
	;;=059^*RESERVED^^*RESERVED
	;;^UTILITY(U,$J,399.2,60,0)
	;;=060^*RESERVED^^*RESERVED
