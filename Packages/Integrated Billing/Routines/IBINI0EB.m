IBINI0EB	; ; 21-MAR-1994
	;;Version 2.0 ; INTEGRATED BILLING ;; 21-MAR-94
	F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q	Q
	;;^UTILITY(U,$J,"PKG",200,22,"B","2.0V2",7)
	;;=
	;;^UTILITY(U,$J,"PKG",200,22,"B","2.0V3",8)
	;;=
	;;^UTILITY(U,$J,"PKG",200,22,"B","2.0V4",9)
	;;=
	;;^UTILITY(U,$J,"PKG",200,22,"B","2.0a1",2)
	;;=
	;;^UTILITY(U,$J,"PKG",200,22,"B","2.0p1",3)
	;;=
	;;^UTILITY(U,$J,"PKG",200,"DEV")
	;;=AAS/ALB
	;;^UTILITY(U,$J,"PKG",200,"DIBT",0)
	;;=^9.48^1^1
	;;^UTILITY(U,$J,"PKG",200,"DIBT",1,0)
	;;=IBNOTVER1^2
	;;^UTILITY(U,$J,"PKG",200,"DIE",0)
	;;=^9.47^^0
	;;^UTILITY(U,$J,"PKG",200,"DIPT",0)
	;;=^9.46^3^3
	;;^UTILITY(U,$J,"PKG",200,"DIPT",1,0)
	;;=IB CPT RG DISPLAY^409.71
	;;^UTILITY(U,$J,"PKG",200,"DIPT",2,0)
	;;=IB DIVISION DISPLAY^40.8
	;;^UTILITY(U,$J,"PKG",200,"DIPT",3,0)
	;;=IBNOTVER^2
	;;^UTILITY(U,$J,"PKG",200,"EX",0)
	;;=^9.432^2^2
	;;^UTILITY(U,$J,"PKG",200,"EX",1,0)
	;;=IBZ
	;;^UTILITY(U,$J,"PKG",200,"EX",2,0)
	;;=IBIZ
	;;^UTILITY(U,$J,"PKG",200,"INI")
	;;=IB20IN^
	;;^UTILITY(U,$J,"PKG",200,"INIT")
	;;=IB20PT^
	;;^UTILITY(U,$J,"PKG",200,"M",0)
	;;=^9.495^^0
	;;^UTILITY(U,$J,"PKG",200,"PRE")
	;;=IB20PRE^
	;;^UTILITY(U,$J,"SBF",2,2)
	;;=
	;;^UTILITY(U,$J,"SBF",2,2.312)
	;;=
	;;^UTILITY(U,$J,"SBF",2,2.98)
	;;=
	;;^UTILITY(U,$J,"SBF",36,36)
	;;=
	;;^UTILITY(U,$J,"SBF",36,36.011)
	;;=
	;;^UTILITY(U,$J,"SBF",36,36.02)
	;;=
	;;^UTILITY(U,$J,"SBF",36,36.03)
	;;=
	;;^UTILITY(U,$J,"SBF",350,350)
	;;=
	;;^UTILITY(U,$J,"SBF",350.1,350.1)
	;;=
	;;^UTILITY(U,$J,"SBF",350.2,350.2)
	;;=
	;;^UTILITY(U,$J,"SBF",350.21,350.21)
	;;=
	;;^UTILITY(U,$J,"SBF",350.3,350.3)
	;;=
	;;^UTILITY(U,$J,"SBF",350.4,350.4)
	;;=
	;;^UTILITY(U,$J,"SBF",350.41,350.41)
	;;=
	;;^UTILITY(U,$J,"SBF",350.5,350.5)
	;;=
	;;^UTILITY(U,$J,"SBF",350.6,350.6)
	;;=
	;;^UTILITY(U,$J,"SBF",350.7,350.7)
	;;=
	;;^UTILITY(U,$J,"SBF",350.71,350.71)
	;;=
	;;^UTILITY(U,$J,"SBF",350.8,350.8)
	;;=
	;;^UTILITY(U,$J,"SBF",350.9,350.9)
	;;=
	;;^UTILITY(U,$J,"SBF",351,351)
	;;=
	;;^UTILITY(U,$J,"SBF",351.1,351.1)
	;;=
	;;^UTILITY(U,$J,"SBF",351.2,351.2)
	;;=
	;;^UTILITY(U,$J,"SBF",352.1,352.1)
	;;=
	;;^UTILITY(U,$J,"SBF",352.2,352.2)
	;;=
	;;^UTILITY(U,$J,"SBF",352.3,352.3)
	;;=
	;;^UTILITY(U,$J,"SBF",352.4,352.4)
	;;=
	;;^UTILITY(U,$J,"SBF",353,353)
	;;=
	;;^UTILITY(U,$J,"SBF",353.1,353.1)
	;;=
	;;^UTILITY(U,$J,"SBF",353.2,353.2)
	;;=
	;;^UTILITY(U,$J,"SBF",354,354)
	;;=
	;;^UTILITY(U,$J,"SBF",354.1,354.1)
	;;=
	;;^UTILITY(U,$J,"SBF",354.2,354.2)
	;;=
	;;^UTILITY(U,$J,"SBF",354.3,354.3)
	;;=
	;;^UTILITY(U,$J,"SBF",354.4,354.4)
	;;=
	;;^UTILITY(U,$J,"SBF",354.5,354.5)
	;;=
	;;^UTILITY(U,$J,"SBF",354.5,354.5002)
	;;=
	;;^UTILITY(U,$J,"SBF",354.5,354.52)
	;;=
	;;^UTILITY(U,$J,"SBF",354.6,354.6)
	;;=
	;;^UTILITY(U,$J,"SBF",354.6,354.61)
	;;=
	;;^UTILITY(U,$J,"SBF",354.6,354.62)
	;;=
	;;^UTILITY(U,$J,"SBF",355.1,355.1)
	;;=
	;;^UTILITY(U,$J,"SBF",355.1,355.11)
	;;=
	;;^UTILITY(U,$J,"SBF",355.2,355.2)
	;;=
	;;^UTILITY(U,$J,"SBF",355.2,355.21)
	;;=
	;;^UTILITY(U,$J,"SBF",355.3,355.3)
	;;=
	;;^UTILITY(U,$J,"SBF",355.3,355.311)
	;;=
	;;^UTILITY(U,$J,"SBF",355.4,355.4)
	;;=
	;;^UTILITY(U,$J,"SBF",355.5,355.5)
	;;=
	;;^UTILITY(U,$J,"SBF",355.6,355.6)
	;;=
	;;^UTILITY(U,$J,"SBF",355.6,355.611)
	;;=
	;;^UTILITY(U,$J,"SBF",355.7,355.7)
	;;=
	;;^UTILITY(U,$J,"SBF",356,356)
	;;=
	;;^UTILITY(U,$J,"SBF",356.1,356.1)
	;;=
	;;^UTILITY(U,$J,"SBF",356.1,356.111)
	;;=
	;;^UTILITY(U,$J,"SBF",356.1,356.112)
	;;=
	;;^UTILITY(U,$J,"SBF",356.1,356.113)
	;;=
	;;^UTILITY(U,$J,"SBF",356.11,356.11)
	;;=
	;;^UTILITY(U,$J,"SBF",356.2,356.2)
	;;=
	;;^UTILITY(U,$J,"SBF",356.2,356.211)
	;;=
	;;^UTILITY(U,$J,"SBF",356.2,356.212)
	;;=
	;;^UTILITY(U,$J,"SBF",356.2,356.213)
	;;=
	;;^UTILITY(U,$J,"SBF",356.2,356.214)
	;;=
	;;^UTILITY(U,$J,"SBF",356.21,356.21)
	;;=
