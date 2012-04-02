BGP7LXFC ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON AUG 28, 2006 ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;21,"66813-0073-16 ")
 ;;620
 ;;21,"66813-0074-01 ")
 ;;621
 ;;21,"67386-0501-52 ")
 ;;18
 ;;21,"67386-0501-55 ")
 ;;19
 ;;21,"67386-0801-02 ")
 ;;6
 ;;21,"67386-0802-02 ")
 ;;8
 ;;21,"67386-0803-02 ")
 ;;10
 ;;21,"67870-0111-01 ")
 ;;622
 ;;21,"67870-0111-05 ")
 ;;623
 ;;21,"68115-0054-06 ")
 ;;624
 ;;21,"68115-0054-12 ")
 ;;691
 ;;21,"68115-0054-30 ")
 ;;625
 ;;21,"68115-0054-50 ")
 ;;626
 ;;21,"68115-0054-60 ")
 ;;627
 ;;21,"68115-0055-30 ")
 ;;813
 ;;21,"68115-0056-30 ")
 ;;692
 ;;21,"68115-0057-00 ")
 ;;274
 ;;21,"68115-0627-00 ")
 ;;299
 ;;21,"87701-0537-46 ")
 ;;393
 ;;21,"87701-0649-54 ")
 ;;394
 ;;21,"87701-0833-36 ")
 ;;395
 ;;21,"87701-0847-72 ")
 ;;396
 ;;21,"94441-0200-93 ")
 ;;476
 ;;21,"94441-0223-30 ")
 ;;477
 ;;9002226,623,.01)
 ;;BGP HEDIS BARBITURATE NDC
 ;;9002226,623,.02)
 ;;@
 ;;9002226,623,.04)
 ;;n
 ;;9002226,623,.06)
 ;;@
 ;;9002226,623,.08)
 ;;@
 ;;9002226,623,.09)
 ;;@
 ;;9002226,623,.11)
 ;;@
 ;;9002226,623,.12)
 ;;@
 ;;9002226,623,.13)
 ;;1
 ;;9002226,623,.14)
 ;;@
 ;;9002226,623,.15)
 ;;@
 ;;9002226,623,.16)
 ;;@
 ;;9002226,623,.17)
 ;;@
 ;;9002226,623,3101)
 ;;@
 ;;9002226.02101,"623,00002-0640-02 ",.01)
 ;;00002-0640-02
 ;;9002226.02101,"623,00002-0640-02 ",.02)
 ;;00002-0640-02
 ;;9002226.02101,"623,00002-0640-33 ",.01)
 ;;00002-0640-33
 ;;9002226.02101,"623,00002-0640-33 ",.02)
 ;;00002-0640-33
 ;;9002226.02101,"623,00002-0665-02 ",.01)
 ;;00002-0665-02
 ;;9002226.02101,"623,00002-0665-02 ",.02)
 ;;00002-0665-02
 ;;9002226.02101,"623,00002-1031-02 ",.01)
 ;;00002-1031-02
 ;;9002226.02101,"623,00002-1031-02 ",.02)
 ;;00002-1031-02
 ;;9002226.02101,"623,00002-1032-02 ",.01)
 ;;00002-1032-02
 ;;9002226.02101,"623,00002-1032-02 ",.02)
 ;;00002-1032-02
 ;;9002226.02101,"623,00002-1032-04 ",.01)
 ;;00002-1032-04
 ;;9002226.02101,"623,00002-1032-04 ",.02)
 ;;00002-1032-04
 ;;9002226.02101,"623,00008-0303-02 ",.01)
 ;;00008-0303-02
 ;;9002226.02101,"623,00008-0303-02 ",.02)
 ;;00008-0303-02
 ;;9002226.02101,"623,00008-0304-01 ",.01)
 ;;00008-0304-01
 ;;9002226.02101,"623,00008-0304-01 ",.02)
 ;;00008-0304-01
 ;;9002226.02101,"623,00008-0499-01 ",.01)
 ;;00008-0499-01
 ;;9002226.02101,"623,00008-0499-01 ",.02)
 ;;00008-0499-01
 ;;9002226.02101,"623,00008-0499-50 ",.01)
 ;;00008-0499-50
 ;;9002226.02101,"623,00008-0499-50 ",.02)
 ;;00008-0499-50
 ;;9002226.02101,"623,00008-0747-01 ",.01)
 ;;00008-0747-01
 ;;9002226.02101,"623,00008-0747-01 ",.02)
 ;;00008-0747-01
 ;;9002226.02101,"623,00024-1171-06 ",.01)
 ;;00024-1171-06
 ;;9002226.02101,"623,00024-1171-06 ",.02)
 ;;00024-1171-06
 ;;9002226.02101,"623,00024-1231-05 ",.01)
 ;;00024-1231-05
 ;;9002226.02101,"623,00024-1231-05 ",.02)
 ;;00024-1231-05
 ;;9002226.02101,"623,00024-1232-05 ",.01)
 ;;00024-1232-05
 ;;9002226.02101,"623,00024-1232-05 ",.02)
 ;;00024-1232-05
 ;;9002226.02101,"623,00024-1233-05 ",.01)
 ;;00024-1233-05
 ;;9002226.02101,"623,00024-1233-05 ",.02)
 ;;00024-1233-05
 ;;9002226.02101,"623,00037-0110-16 ",.01)
 ;;00037-0110-16
 ;;9002226.02101,"623,00037-0110-16 ",.02)
 ;;00037-0110-16
 ;;9002226.02101,"623,00037-0113-60 ",.01)
 ;;00037-0113-60
 ;;9002226.02101,"623,00037-0113-60 ",.02)
 ;;00037-0113-60
 ;;9002226.02101,"623,00037-0113-80 ",.01)
 ;;00037-0113-80
 ;;9002226.02101,"623,00037-0113-80 ",.02)
 ;;00037-0113-80
 ;;9002226.02101,"623,00037-0114-60 ",.01)
 ;;00037-0114-60
 ;;9002226.02101,"623,00037-0114-60 ",.02)
 ;;00037-0114-60
 ;;9002226.02101,"623,00043-0219-16 ",.01)
 ;;00043-0219-16
 ;;9002226.02101,"623,00043-0219-16 ",.02)
 ;;00043-0219-16
 ;;9002226.02101,"623,00043-0491-12 ",.01)
 ;;00043-0491-12
 ;;9002226.02101,"623,00043-0491-12 ",.02)
 ;;00043-0491-12
 ;;9002226.02101,"623,00054-8701-04 ",.01)
 ;;00054-8701-04
 ;;9002226.02101,"623,00054-8701-04 ",.02)
 ;;00054-8701-04
 ;;9002226.02101,"623,00054-8703-25 ",.01)
 ;;00054-8703-25
 ;;9002226.02101,"623,00054-8703-25 ",.02)
 ;;00054-8703-25
 ;;9002226.02101,"623,00054-8704-04 ",.01)
 ;;00054-8704-04
 ;;9002226.02101,"623,00054-8704-04 ",.02)
 ;;00054-8704-04
 ;;9002226.02101,"623,00054-8705-25 ",.01)
 ;;00054-8705-25
 ;;9002226.02101,"623,00054-8705-25 ",.02)
 ;;00054-8705-25
 ;;9002226.02101,"623,00054-8707-25 ",.01)
 ;;00054-8707-25
 ;;9002226.02101,"623,00054-8707-25 ",.02)
 ;;00054-8707-25
 ;;9002226.02101,"623,00054-8708-25 ",.01)
 ;;00054-8708-25
 ;;9002226.02101,"623,00054-8708-25 ",.02)
 ;;00054-8708-25
 ;;9002226.02101,"623,00071-0471-32 ",.01)
 ;;00071-0471-32
 ;;9002226.02101,"623,00071-0471-32 ",.02)
 ;;00071-0471-32
 ;;9002226.02101,"623,00071-0471-40 ",.01)
 ;;00071-0471-40
 ;;9002226.02101,"623,00071-0471-40 ",.02)
 ;;00071-0471-40
 ;;9002226.02101,"623,00071-0840-24 ",.01)
 ;;00071-0840-24
 ;;9002226.02101,"623,00071-0840-24 ",.02)
 ;;00071-0840-24
 ;;9002226.02101,"623,00074-1540-01 ",.01)
 ;;00074-1540-01
 ;;9002226.02101,"623,00074-1540-01 ",.02)
 ;;00074-1540-01
 ;;9002226.02101,"623,00074-2343-01 ",.01)
 ;;00074-2343-01
 ;;9002226.02101,"623,00074-2343-01 ",.02)
 ;;00074-2343-01
 ;;9002226.02101,"623,00074-2343-31 ",.01)
 ;;00074-2343-31
 ;;9002226.02101,"623,00074-2343-31 ",.02)
 ;;00074-2343-31
 ;;9002226.02101,"623,00074-2349-01 ",.01)
 ;;00074-2349-01
 ;;9002226.02101,"623,00074-2349-01 ",.02)
 ;;00074-2349-01
 ;;9002226.02101,"623,00074-2349-31 ",.01)
 ;;00074-2349-31
 ;;9002226.02101,"623,00074-2349-31 ",.02)
 ;;00074-2349-31
 ;;9002226.02101,"623,00074-3114-01 ",.01)
 ;;00074-3114-01
 ;;9002226.02101,"623,00074-3114-01 ",.02)
 ;;00074-3114-01
 ;;9002226.02101,"623,00074-3114-02 ",.01)
 ;;00074-3114-02
 ;;9002226.02101,"623,00074-3114-02 ",.02)
 ;;00074-3114-02
 ;;9002226.02101,"623,00074-3142-01 ",.01)
 ;;00074-3142-01
 ;;9002226.02101,"623,00074-3142-01 ",.02)
 ;;00074-3142-01
 ;;9002226.02101,"623,00074-3145-01 ",.01)
 ;;00074-3145-01
 ;;9002226.02101,"623,00074-3145-01 ",.02)
 ;;00074-3145-01
 ;;9002226.02101,"623,00074-3148-01 ",.01)
 ;;00074-3148-01
 ;;9002226.02101,"623,00074-3148-01 ",.02)
 ;;00074-3148-01
 ;;9002226.02101,"623,00074-3150-11 ",.01)
 ;;00074-3150-11
 ;;9002226.02101,"623,00074-3150-11 ",.02)
 ;;00074-3150-11
 ;;9002226.02101,"623,00074-3272-01 ",.01)
 ;;00074-3272-01
 ;;9002226.02101,"623,00074-3272-01 ",.02)
 ;;00074-3272-01
 ;;9002226.02101,"623,00074-3778-04 ",.01)
 ;;00074-3778-04
 ;;9002226.02101,"623,00074-3778-04 ",.02)
 ;;00074-3778-04
 ;;9002226.02101,"623,00074-3778-05 ",.01)
 ;;00074-3778-05
 ;;9002226.02101,"623,00074-3778-05 ",.02)
 ;;00074-3778-05
 ;;9002226.02101,"623,00074-6899-04 ",.01)
 ;;00074-6899-04
 ;;9002226.02101,"623,00074-6899-04 ",.02)
 ;;00074-6899-04
 ;;9002226.02101,"623,00078-0084-05 ",.01)
 ;;00078-0084-05
 ;;9002226.02101,"623,00078-0084-05 ",.02)
 ;;00078-0084-05
 ;;9002226.02101,"623,00078-0084-06 ",.01)
 ;;00078-0084-06
 ;;9002226.02101,"623,00078-0084-06 ",.02)
 ;;00078-0084-06
 ;;9002226.02101,"623,00078-0084-08 ",.01)
 ;;00078-0084-08
 ;;9002226.02101,"623,00078-0084-08 ",.02)
 ;;00078-0084-08
 ;;9002226.02101,"623,00078-0103-05 ",.01)
 ;;00078-0103-05
 ;;9002226.02101,"623,00078-0103-05 ",.02)
 ;;00078-0103-05
 ;;9002226.02101,"623,00078-0103-08 ",.01)
 ;;00078-0103-08
 ;;9002226.02101,"623,00078-0103-08 ",.02)
 ;;00078-0103-08
 ;;9002226.02101,"623,00078-0103-13 ",.01)
 ;;00078-0103-13
 ;;9002226.02101,"623,00078-0103-13 ",.02)
 ;;00078-0103-13
 ;;9002226.02101,"623,00078-0107-05 ",.01)
 ;;00078-0107-05
 ;;9002226.02101,"623,00078-0107-05 ",.02)
 ;;00078-0107-05
 ;;9002226.02101,"623,00078-0107-13 ",.01)
 ;;00078-0107-13
 ;;9002226.02101,"623,00078-0107-13 ",.02)
 ;;00078-0107-13
 ;;9002226.02101,"623,00078-0243-05 ",.01)
 ;;00078-0243-05
 ;;9002226.02101,"623,00078-0243-05 ",.02)
 ;;00078-0243-05
 ;;9002226.02101,"623,00086-0050-10 ",.01)
 ;;00086-0050-10
 ;;9002226.02101,"623,00086-0050-10 ",.02)
 ;;00086-0050-10
 ;;9002226.02101,"623,00086-0050-50 ",.01)
 ;;00086-0050-50
 ;;9002226.02101,"623,00086-0050-50 ",.02)
 ;;00086-0050-50
 ;;9002226.02101,"623,00086-0056-10 ",.01)
 ;;00086-0056-10
 ;;9002226.02101,"623,00086-0056-10 ",.02)
 ;;00086-0056-10
 ;;9002226.02101,"623,00086-0056-50 ",.01)
 ;;00086-0056-50
 ;;9002226.02101,"623,00086-0056-50 ",.02)
 ;;00086-0056-50
 ;;9002226.02101,"623,00093-0854-01 ",.01)
 ;;00093-0854-01
 ;;9002226.02101,"623,00093-0854-01 ",.02)
 ;;00093-0854-01
 ;;9002226.02101,"623,00095-0240-01 ",.01)
 ;;00095-0240-01
 ;;9002226.02101,"623,00095-0240-01 ",.02)
 ;;00095-0240-01
 ;;9002226.02101,"623,00095-0240-05 ",.01)
 ;;00095-0240-05
 ;;9002226.02101,"623,00095-0240-05 ",.02)
 ;;00095-0240-05
 ;;9002226.02101,"623,00115-1110-02 ",.01)
 ;;00115-1110-02
 ;;9002226.02101,"623,00115-1110-02 ",.02)
 ;;00115-1110-02
 ;;9002226.02101,"623,00115-1110-04 ",.01)
 ;;00115-1110-04
 ;;9002226.02101,"623,00115-1110-04 ",.02)
 ;;00115-1110-04
 ;;9002226.02101,"623,00115-4211-01 ",.01)
 ;;00115-4211-01
 ;;9002226.02101,"623,00115-4211-01 ",.02)
 ;;00115-4211-01
 ;;9002226.02101,"623,00115-4211-03 ",.01)
 ;;00115-4211-03
 ;;9002226.02101,"623,00115-4211-03 ",.02)
 ;;00115-4211-03
 ;;9002226.02101,"623,00115-4212-01 ",.01)
 ;;00115-4212-01
 ;;9002226.02101,"623,00115-4212-01 ",.02)
 ;;00115-4212-01
 ;;9002226.02101,"623,00115-4212-03 ",.01)
 ;;00115-4212-03
 ;;9002226.02101,"623,00115-4212-03 ",.02)
 ;;00115-4212-03
 ;;9002226.02101,"623,00115-4214-01 ",.01)
 ;;00115-4214-01
 ;;9002226.02101,"623,00115-4214-01 ",.02)
 ;;00115-4214-01
 ;;9002226.02101,"623,00115-4214-03 ",.01)
 ;;00115-4214-03
 ;;9002226.02101,"623,00115-4214-03 ",.02)
 ;;00115-4214-03
 ;;9002226.02101,"623,00115-4229-01 ",.01)
 ;;00115-4229-01
 ;;9002226.02101,"623,00115-4229-01 ",.02)
 ;;00115-4229-01
 ;;9002226.02101,"623,00115-4229-03 ",.01)
 ;;00115-4229-03
 ;;9002226.02101,"623,00115-4229-03 ",.02)
 ;;00115-4229-03
 ;;9002226.02101,"623,00115-4231-01 ",.01)
 ;;00115-4231-01
 ;;9002226.02101,"623,00115-4231-01 ",.02)
 ;;00115-4231-01
 ;;9002226.02101,"623,00115-4231-03 ",.01)
 ;;00115-4231-03
 ;;9002226.02101,"623,00115-4231-03 ",.02)
 ;;00115-4231-03
 ;;9002226.02101,"623,00115-4233-03 ",.01)
 ;;00115-4233-03
 ;;9002226.02101,"623,00115-4233-03 ",.02)
 ;;00115-4233-03
 ;;9002226.02101,"623,00121-0518-05 ",.01)
 ;;00121-0518-05
 ;;9002226.02101,"623,00121-0518-05 ",.02)
 ;;00121-0518-05
 ;;9002226.02101,"623,00121-0518-10 ",.01)
 ;;00121-0518-10
 ;;9002226.02101,"623,00121-0518-10 ",.02)
 ;;00121-0518-10
 ;;9002226.02101,"623,00121-0518-20 ",.01)
 ;;00121-0518-20
 ;;9002226.02101,"623,00121-0518-20 ",.02)
 ;;00121-0518-20
 ;;9002226.02101,"623,00121-0531-03 ",.01)
 ;;00121-0531-03
 ;;9002226.02101,"623,00121-0531-03 ",.02)
 ;;00121-0531-03
 ;;9002226.02101,"623,00121-0531-05 ",.01)
 ;;00121-0531-05
 ;;9002226.02101,"623,00121-0531-05 ",.02)
 ;;00121-0531-05
 ;;9002226.02101,"623,00121-0531-07 ",.01)
 ;;00121-0531-07
 ;;9002226.02101,"623,00121-0531-07 ",.02)
 ;;00121-0531-07
 ;;9002226.02101,"623,00121-0531-15 ",.01)
 ;;00121-0531-15
 ;;9002226.02101,"623,00121-0531-15 ",.02)
 ;;00121-0531-15
 ;;9002226.02101,"623,00121-0531-16 ",.01)
 ;;00121-0531-16
 ;;9002226.02101,"623,00121-0531-16 ",.02)
 ;;00121-0531-16
 ;;9002226.02101,"623,00143-1115-01 ",.01)
 ;;00143-1115-01
 ;;9002226.02101,"623,00143-1115-01 ",.02)
 ;;00143-1115-01
 ;;9002226.02101,"623,00143-1115-05 ",.01)
 ;;00143-1115-05
 ;;9002226.02101,"623,00143-1115-05 ",.02)
 ;;00143-1115-05
 ;;9002226.02101,"623,00143-1445-10 ",.01)
 ;;00143-1445-10
 ;;9002226.02101,"623,00143-1445-10 ",.02)
 ;;00143-1445-10
 ;;9002226.02101,"623,00143-1450-10 ",.01)
 ;;00143-1450-10
 ;;9002226.02101,"623,00143-1450-10 ",.02)
 ;;00143-1450-10
 ;;9002226.02101,"623,00143-1455-10 ",.01)
 ;;00143-1455-10
 ;;9002226.02101,"623,00143-1455-10 ",.02)
 ;;00143-1455-10
 ;;9002226.02101,"623,00143-1458-01 ",.01)
 ;;00143-1458-01
 ;;9002226.02101,"623,00143-1458-01 ",.02)
 ;;00143-1458-01
 ;;9002226.02101,"623,00143-1458-10 ",.01)
 ;;00143-1458-10
 ;;9002226.02101,"623,00143-1458-10 ",.02)
 ;;00143-1458-10
 ;;9002226.02101,"623,00143-1785-01 ",.01)
 ;;00143-1785-01
 ;;9002226.02101,"623,00143-1785-01 ",.02)
 ;;00143-1785-01
 ;;9002226.02101,"623,00143-1785-10 ",.01)
 ;;00143-1785-10
 ;;9002226.02101,"623,00143-1785-10 ",.02)
 ;;00143-1785-10
 ;;9002226.02101,"623,00143-1787-01 ",.01)
 ;;00143-1787-01
 ;;9002226.02101,"623,00143-1787-01 ",.02)
 ;;00143-1787-01
 ;;9002226.02101,"623,00143-1787-05 ",.01)
 ;;00143-1787-05
 ;;9002226.02101,"623,00143-1787-05 ",.02)
 ;;00143-1787-05
 ;;9002226.02101,"623,00143-3000-01 ",.01)
 ;;00143-3000-01
 ;;9002226.02101,"623,00143-3000-01 ",.02)
 ;;00143-3000-01
 ;;9002226.02101,"623,00182-0036-01 ",.01)
 ;;00182-0036-01
 ;;9002226.02101,"623,00182-0036-01 ",.02)
 ;;00182-0036-01
 ;;9002226.02101,"623,00182-0140-01 ",.01)
 ;;00182-0140-01
 ;;9002226.02101,"623,00182-0140-01 ",.02)
 ;;00182-0140-01
 ;;9002226.02101,"623,00182-0292-10 ",.01)
 ;;00182-0292-10
 ;;9002226.02101,"623,00182-0292-10 ",.02)
 ;;00182-0292-10
 ;;9002226.02101,"623,00182-0314-40 ",.01)
 ;;00182-0314-40
 ;;9002226.02101,"623,00182-0314-40 ",.02)
 ;;00182-0314-40
 ;;9002226.02101,"623,00182-0314-41 ",.01)
 ;;00182-0314-41
 ;;9002226.02101,"623,00182-0314-41 ",.02)
 ;;00182-0314-41
 ;;9002226.02101,"623,00182-0590-10 ",.01)
 ;;00182-0590-10
 ;;9002226.02101,"623,00182-0590-10 ",.02)
 ;;00182-0590-10
 ;;9002226.02101,"623,00182-1098-00 ",.01)
 ;;00182-1098-00
 ;;9002226.02101,"623,00182-1098-00 ",.02)
 ;;00182-1098-00