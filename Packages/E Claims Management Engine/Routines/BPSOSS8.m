BPSOSS8 ;BHAM ISC/FCS/DRS/FLS - option BPS SETUP PART 1 the basic setup ;06/01/2004
 ;;1.0;E CLAIMS MGMT ENGINE;**1**;JUN 2004
 Q
PART1 ;EP - option BPS SETUP PART 1 - the basic setup
 W !!,"Edit Pharmacy ECME configuration",!
 D NEW99
 N DIE,DA,DR,DIDEL,DTOUT
 S DIE=9002313.99,DA=1
 S DR="3.01R~ECME timeout? (0 to 30 seconds) //10"
 D ^DIE
 Q  ; Vista OP Pharmacy handles pricing in the IB module
 ;
 W !!,"Now set up the STANDARD Pricing Formula.  (Different pricing",!
 W "policies for different insurers can be established later.)",!
 S DIE=9002313.53,DA=1
 S DR=".02R~Where do we find the UNIT PRICE of a drug?"
 S DR=DR_";.04R~Multiply the unit price by what factor (1 = 100%, .95 = 95%, etc.) ?"
 S DR=DR_";.05R~What is the default DISPENSING FEE?"
 D ^DIE
 Q
NEW99 ; create new entry in 9002313.99
 Q:$P($G(^BPS(9002313.99,1,0)),U)]""  ; already has an entry
 N FDA,IEN,MSG
 S FDA(9002313.99,"+1,",.01)="ECME SETUP"
 S FDA(9002313.99,"+1,",951)=30 ; insurance grace period default
N99A D UPDATE^DIE("","FDA","IEN","MSG")
 I '$D(MSG),IEN(1)=1,$D(^BPS(9002313.99,1,0)) D  Q  ; success
 . ; Insurance base scores - default to Private primary,
 . ; Medicaid secondary, Medicare tertiary, No insurance last
 . S ^BPS(9002313.99,1,"INS BASE SCORES")="900^300^600^300^100"
 ; Failure:
 D ZWRITE^BPSOS("FDA","IEN","MSG")
 G N99A:$$IMPOSS^BPSOSUE("FM","TRI","UPDATE^DIE failed",,"N99A",$T(+0))
 Q
INS ;EP - option BPS INSURANCE SEL
 N DIE,DA,DR,DIDEL,DTOUT
 S DIE=9002313.99,DA=1
 W !!,"The insurance selection ""grace period"" means that if the",!
 W "registration data shows that insurance has expired, but the",!
 W "expiration was within N days prior to the prescription fill",!
 W "date, we assume that the coverage was renewed.",!
 W "This is a system-wide default setting; you can override it later",!
 W "on an insurer-by-insurer basis.",!
 S DR="951Grace period default"
 D ^DIE
 ;
 W !!,"Enter the base scores for each insurance type.",!
 W !,"For example, if Private insurance is usually primary,",!
 W ?10,"and Medicaid is secondary and Medicare is tertiary",!
 W "then you might give Private 900 points, Medicaid 600 points,",!
 W "Medicare and Railroad each 300 points and Self pay 100 points.",!
 W !
 S DR="960.01;960.03;960.02;960.04;960.05"
 D ^DIE
 ;
 N ALLRULES,MYRULES
11 S (ALLRULES,MYRULES)=0 ; have we printed them yet?
10 W !!,"Select any additional insurance rules that might",!
 W "be needed for distinguishing among private insurances.",!
 I 'ALLRULES,$$ALLRULES D  G 10
 . D TEMPLATE^BPSOSS2("BPS INSURANCE RULES AVAIL",9002313.94)
 . S ALLRULES=1
 I 'MYRULES,$$MYRULES D RPTINUSE S MYRULES=1 G 10
 W !,"Usually, the plus points value for a rule is about 10 or 20",!
 W "and the minus points value is 0."
 W "If you need a new rule which isn't shown in the list,",!
 W "the ECME programmer will have to add it.",!
 W "The INS RULE ORDER tells what order the rules are applied,",!
 W "from low to high.  10, 20, 30, etc. are good choices for ORDER.",!
 S DIE=9002313.99,DR=970.01,DA=1
 D ^DIE
 I $$ANYINUSE I $$MYRULES D RPTINUSE
 I $$MOREEDIT G 11
 ;
 W !!,"This concludes the system-wide insurance setup.",!
 W "Remember, there is another setup program to setup specific",!
 W "insurers with their electronic formats, insurance selection",!
 W "settings, grace period override, etc.",!
 N % R %:10,!
 Q
ANYINUSE() ;EP - BPSOSS1
 Q $O(^BPS(9002313.99,1,"INS RULES",0))
RPTINUSE ;EP - BPSOSS1
 D TEMPLATE^BPSOSS2("BPS INSURANCE RULES IN-USE",9002313.99) Q
ALLRULES()         Q $$YESNO("Do you want to see a list of all the AVAILABLE rules")
MYRULES()          Q $$YESNO("Do you want to see a list of the rules that are IN USE now")
MOREEDIT()         Q $$YESNO("Do you want to go back and edit the rules again")
YESNO(TEXT) ;EP - BPSOSS3
 Q $$YESNO^BPSOSU3(TEXT,"NO",1,60)=1
