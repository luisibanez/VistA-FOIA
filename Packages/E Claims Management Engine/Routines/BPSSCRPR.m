BPSSCRPR ;BHAM ISC/SS - ECME SCREEN PRINT ;05-APR-05
 ;;1.0;E CLAIMS MGMT ENGINE;**1**;JUN 2004
 ;; Per VHA Directive 10-93-142, this routine should not be modified.
 Q
 ;
PR ;
 D FULL^VALM1
 D PRTL^VALM1 ;standard LM API to print all entries on the device,
 ;prompts for the device
 S VALMBCK="R"
 Q
 ;
