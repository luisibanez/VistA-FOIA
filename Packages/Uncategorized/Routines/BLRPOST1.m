BLRPOST1 ;;IHS/ITSC/TPF - FORCE COMPARE OF SYSTEM TO TRANSPORT GLOBAL [ 10/15/2002  11:33 AM ]
 ;;5.2;LR;**1014**;OCT 9, 2002
 ;CLEAR OUT NON LR NAMESPACE GLOBAL
 N BLR
 F BLR="^TIMTEST" D
 . I $$KILLOK^ZIBGCHAR($P(BLR,U,2)) W !,$$ERR^ZIBGCHAR($$KILLOK^ZIBGCHAR($P(BLR,U,2)))_"  "_BLR Q
 . W !,"KILLING "_BLR K @BLR
 Q
