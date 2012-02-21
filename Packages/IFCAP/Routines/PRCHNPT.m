PRCHNPT ;SF/TKW-INPUT TRANSFORM ;9-1-89/1:58 PM
V ;;5.1;IFCAP;;Oct 20, 2000
 ;Per VHA Directive 10-93-142, this routine should not be modified.
EN1 ;INPUT TRANSFORM FOR NSN (FIELD #5) ON ITEM MASTER FILE (441)
 Q:'$D(X)  I '$D(^PRC(441.2,+X,0)) W $C(7),!,"First 4 digits MUST be an FSC code!!" K X Q
 S Z=$O(^PRC(441,"BB",X,0)) S:Z=DA Z=$O(^(DA)) I Z W $C(7),!,"This NSN has already been assigned to Item # "_Z_"!!" K X,Z Q
 K Z Q
