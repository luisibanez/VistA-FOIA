DINIT0FA ;SFISC/MKO-DATA FOR FORM AND BLOCK FILES ;8:28 AM  18 Jan 2000 [ 04/02/2003   8:25 AM ]
 ;;22.0;VA FileMan;**1001**;APR 1, 2003
 ;;22.0;VA FileMan;**20**;Mar 30, 1999
 ;Per VHA Directive 10-93-142, this routine should not be modified.
 F I=1:2 S X=$T(ENTRY+I) G:X="" ^DINIT0FB S Y=$E($T(ENTRY+I+1),5,999),X=$E(X,4,999),@X=Y
 Q
ENTRY ;
 ;;^DIST(.404,.110101,40,10,0)
 ;;=2^Root File^3
 ;;^DIST(.404,.110101,40,10,1)
 ;;=.51
 ;;^DIST(.404,.110101,40,10,2)
 ;;=1,60^20^1,49
 ;;^DIST(.404,.110101,40,10,4)
 ;;=^^^1
 ;;^DIST(.404,.110101,40,11,0)
 ;;=4^Root Type^3
 ;;^DIST(.404,.110101,40,11,1)
 ;;=.5
 ;;^DIST(.404,.110101,40,11,2)
 ;;=2,60^16^2,49
 ;;^DIST(.404,.110101,40,11,4)
 ;;=^^^1
 ;;^DIST(.404,.110101,40,14,0)
 ;;=7^!M^1
 ;;^DIST(.404,.110101,40,14,.1)
 ;;=N WPROOT S WPROOT=$$GET^DDSVAL(.11,.DA,.1),Y=$S(WPROOT]"":$G(@WPROOT@(1,0)),1:""),Y=$S(Y]"":"["_$E(Y,1,56)_"]",1:"(empty)")
 ;;^DIST(.404,.110101,40,14,2)
 ;;=^^5,23
 ;;^DIST(.404,.110102,0)
 ;;=DIKC EDIT HDR 1^.11
 ;;^DIST(.404,.110102,40,0)
 ;;=^.4044I^4^4
 ;;^DIST(.404,.110102,40,1,0)
 ;;=1^EDIT AN INDEX^1
 ;;^DIST(.404,.110102,40,1,2)
 ;;=^^1,34
 ;;^DIST(.404,.110102,40,2,0)
 ;;=2^Number^4
 ;;^DIST(.404,.110102,40,2,2)
 ;;=1,9^15^1,1
 ;;^DIST(.404,.110102,40,2,30)
 ;;=S Y=DA
 ;;^DIST(.404,.110102,40,3,0)
 ;;=3^Page 1 of 2^1
 ;;^DIST(.404,.110102,40,3,2)
 ;;=^^1,69
 ;;^DIST(.404,.110102,40,4,0)
 ;;=4^-------------------------------------------------------------------------------^1
 ;;^DIST(.404,.110102,40,4,2)
 ;;=^^2,1
 ;;^DIST(.404,.110103,0)
 ;;=DIKC EDIT LOGIC^.11
 ;;^DIST(.404,.110103,40,0)
 ;;=^.4044I^28^5
 ;;^DIST(.404,.110103,40,1,0)
 ;;=1^Set Logic^3
 ;;^DIST(.404,.110103,40,1,1)
 ;;=1.1
 ;;^DIST(.404,.110103,40,1,2)
 ;;=3,13^67^3,2
 ;;^DIST(.404,.110103,40,1,14)
 ;;=D VALLOG^DIKCFORM
 ;;^DIST(.404,.110103,40,2,0)
 ;;=2^Kill Logic^3
 ;;^DIST(.404,.110103,40,2,1)
 ;;=2.1
 ;;^DIST(.404,.110103,40,2,2)
 ;;=4,13^67^4,1
 ;;^DIST(.404,.110103,40,2,14)
 ;;=D VALLOG^DIKCFORM
 ;;^DIST(.404,.110103,40,18,0)
 ;;=3^Whole Kill^3
 ;;^DIST(.404,.110103,40,18,1)
 ;;=2.5
 ;;^DIST(.404,.110103,40,18,2)
 ;;=5,13^67^5,1
 ;;^DIST(.404,.110103,40,18,14)
 ;;=D VALLOG^DIKCFORM
 ;;^DIST(.404,.110103,40,27,0)
 ;;=8^Set Condition^3
 ;;^DIST(.404,.110103,40,27,1)
 ;;=1.4
 ;;^DIST(.404,.110103,40,27,2)
 ;;=7,17^63^7,2
 ;;^DIST(.404,.110103,40,27,14)
 ;;=I $G(DUZ(0))'="@" S DDSERROR=1 D HLP^DDSUTL($C(7)_"Only programmers are allowed to edit the Set Condition.")
 ;;^DIST(.404,.110103,40,28,0)
 ;;=9^Kill Condition^3
 ;;^DIST(.404,.110103,40,28,1)
 ;;=2.4
 ;;^DIST(.404,.110103,40,28,2)
 ;;=8,17^63^8,1
 ;;^DIST(.404,.110103,40,28,14)
 ;;=I $G(DUZ(0))'="@" S DDSERROR=1 D HLP^DDSUTL($C(7)_"Only programmers are allowed to edit the Kill Condition.")
 ;;^DIST(.404,.110104,0)
 ;;=DIKC EDIT CRV^.114
 ;;^DIST(.404,.110104,40,0)
 ;;=^.4044I^5^5
 ;;^DIST(.404,.110104,40,1,0)
 ;;=1^^3^^ORDER
 ;;^DIST(.404,.110104,40,1,1)
 ;;=.01
 ;;^DIST(.404,.110104,40,1,2)
 ;;=1,3^3
 ;;^DIST(.404,.110104,40,1,10)
 ;;=S DDSSTACK=$S($$GET^DDSVAL(.114,.DA,1)="F":2.1,1:2.2)
 ;;^DIST(.404,.110104,40,1,13)
 ;;=D:DDSOLD'="" BLDLOG^DIKCFORM(DA(1))
 ;;^DIST(.404,.110104,40,2,0)
 ;;=2^^3
 ;;^DIST(.404,.110104,40,2,1)
 ;;=.5
 ;;^DIST(.404,.110104,40,2,2)
 ;;=1,12^3
 ;;^DIST(.404,.110104,40,2,13)
 ;;=D BLDLOG^DIKCFORM(DA(1))
 ;;^DIST(.404,.110104,40,3,0)
 ;;=3^^3
 ;;^DIST(.404,.110104,40,3,1)
 ;;=1
 ;;^DIST(.404,.110104,40,3,2)
 ;;=1,19^8
 ;;^DIST(.404,.110104,40,3,10)
 ;;=S:X'=DDSOLD DDSSTACK=$S(X="F":2.1,1:2.2)
 ;;^DIST(.404,.110104,40,3,13)
 ;;=D CRVTYPE^DIKCFORM
 ;;^DIST(.404,.110104,40,4,0)
 ;;=5^^4
 ;;^DIST(.404,.110104,40,4,2)
 ;;=1,36^43
 ;;^DIST(.404,.110104,40,4,30)
 ;;=N FIL,FLD,TYP S TYP={TYPE OF VALUE;I} S:TYP="F" FIL=+{FILE},FLD=+{FIELD},Y=$S('FIL!'FLD:"",$P($G(^DD(FIL,FLD,0)),U)="":"",1:$P(^(0),U)_" (#"_FLD_")") S:TYP="C" Y={COMPUTED CODE} S:$L($G(Y))>43 Y=$E(Y,1,40)_"..."
 ;;^DIST(.404,.110104,40,5,0)
 ;;=4^^3
 ;;^DIST(.404,.110104,40,5,1)
 ;;=6
 ;;^DIST(.404,.110104,40,5,2)
 ;;=1,29^3
 ;;^DIST(.404,.110104,40,5,13)
 ;;=D:$$GET^DDSVAL(.114,.DA,.5) BLDLOG^DIKCFORM(DA(1))
 ;;^DIST(.404,.110105,0)
 ;;=DIKC EDIT CRV HDR^.11
 ;;^DIST(.404,.110105,40,0)
 ;;=^.4044I^12^11
 ;;^DIST(.404,.110105,40,1,0)
 ;;=1^CROSS-REFERENCE VALUES:^1
 ;;^DIST(.404,.110105,40,1,2)
 ;;=^^1,1
 ;;^DIST(.404,.110105,40,3,0)
 ;;=2^Order...^1
 ;;^DIST(.404,.110105,40,3,2)
 ;;=^^2,2
 ;;^DIST(.404,.110105,40,4,0)
 ;;=7^--------^1
 ;;^DIST(.404,.110105,40,4,2)
 ;;=^^3,2
 ;;^DIST(.404,.110105,40,5,0)
 ;;=3^Subscr^1
 ;;^DIST(.404,.110105,40,5,2)
 ;;=^^2,12
 ;;^DIST(.404,.110105,40,6,0)
 ;;=8^------^1
 ;;^DIST(.404,.110105,40,6,2)
 ;;=^^3,12
 ;;^DIST(.404,.110105,40,7,0)
 ;;=4^Type^1
 ;;^DIST(.404,.110105,40,7,2)
 ;;=^^2,20
 ;;^DIST(.404,.110105,40,8,0)
 ;;=9^----^1
 ;;^DIST(.404,.110105,40,8,2)
 ;;=^^3,20
 ;;^DIST(.404,.110105,40,9,0)
 ;;=6^Field or Computed Expression^1
 ;;^DIST(.404,.110105,40,9,2)
 ;;=^^2,37
 ;;^DIST(.404,.110105,40,10,0)
 ;;=11^-------------------------------------^1
 ;;^DIST(.404,.110105,40,10,2)
 ;;=^^3,37
 ;;^DIST(.404,.110105,40,11,0)
 ;;=5^Length^1
 ;;^DIST(.404,.110105,40,11,2)
 ;;=^^2,29
 ;;^DIST(.404,.110105,40,12,0)
 ;;=10^------^1
 ;;^DIST(.404,.110105,40,12,2)
 ;;=^^3,29
 ;;^DIST(.404,.110106,0)
 ;;=DIKC EDIT HDR 2^.11
 ;;^DIST(.404,.110106,40,0)
 ;;=^.4044I^4^4
 ;;^DIST(.404,.110106,40,1,0)
 ;;=1^Number^4
 ;;^DIST(.404,.110106,40,1,2)
 ;;=1,9^15^1,1
 ;;^DIST(.404,.110106,40,1,30)
 ;;=S Y=DA
 ;;^DIST(.404,.110106,40,2,0)
 ;;=2^EDIT AN INDEX^1
 ;;^DIST(.404,.110106,40,2,2)
 ;;=^^1,34
 ;;^DIST(.404,.110106,40,3,0)
 ;;=3^Page 2 of 2^1
 ;;^DIST(.404,.110106,40,3,2)
 ;;=^^1,69
 ;;^DIST(.404,.110106,40,4,0)
 ;;=4^-------------------------------------------------------------------------------^1
 ;;^DIST(.404,.110106,40,4,2)
 ;;=^^2,1
 ;;^DIST(.404,.110107,0)
 ;;=DIKC EDIT FIELD CRV^.114
 ;;^DIST(.404,.110107,40,0)
 ;;=^.4044I^12^12
 ;;^DIST(.404,.110107,40,1,0)
 ;;=1^ Field-Type Cross Reference Value ^1
 ;;^DIST(.404,.110107,40,1,2)
 ;;=^^1,23
 ;;^DIST(.404,.110107,40,2,0)
 ;;=2^Order Number^3
 ;;^DIST(.404,.110107,40,2,1)
 ;;=.01
 ;;^DIST(.404,.110107,40,2,2)
 ;;=3,18^3^3,4
 ;;^DIST(.404,.110107,40,2,11)
 ;;=I $G(DIKCPG21),$$GET^DDSVAL(DIE,.DA,3)="" S DDSBR="FIELD" K DIKCPG21
 ;;^DIST(.404,.110107,40,2,13)
 ;;=S:$$GET^DDSVAL(.114,.DA,.5) DIKCCRV=1
 ;;^DIST(.404,.110107,40,3,0)
 ;;=3^Subscript Number^3
 ;;^DIST(.404,.110107,40,3,1)
 ;;=.5
 ;;^DIST(.404,.110107,40,3,2)
 ;;=3,58^3^3,40
 ;;^DIST(.404,.110107,40,3,3)
 ;;=!M
 ;;^DIST(.404,.110107,40,3,3.1)
 ;;=S Y=$S($$GET^DDSVAL(.11,DA(1),.2)="R":$$GET^DDSVAL(.114,.DA,.01),1:"")
 ;;^DIST(.404,.110107,40,3,13)
 ;;=I X=""!(DDSOLD="") S DIKCCRV=1 D:X="" PUT^DDSVAL(.114,.DA,6) I DDSOLD="" N DIKCTYPE S DIKCTYPE=$P($G(^DD(+$$GET^DDSVAL(.114,.DA,2),+$$GET^DDSVAL(.114,.DA,3),0)),U,2) D:DIKCTYPE["F"!(DIKCTYPE["K") PUT^DDSVAL(.114,.DA,6,30)
 ;;^DIST(.404,.110107,40,4,0)
 ;;=10^Transform for Storage^3
 ;;^DIST(.404,.110107,40,4,1)
 ;;=5
 ;;^DIST(.404,.110107,40,4,2)
 ;;=9,25^53^9,2
 ;;^DIST(.404,.110107,40,4,13)
 ;;=D TRANS^DIKCFORM
