ONCOEDC1 ;Hines OIFO/RTK-EDIT CHECKS FOR ABSTRACT STATUS ;10/30/00
 ;;2.11;ONCOLOGY;**27,28,29,34,36,39,41,42**;Mar 07,1995
 ;
F1655 ;If any fields not filled in S CMPLT=0 and add that field to LIST
 S FLD=$$GET1^DIQ(165.5,PRM,155,"I") I FLD="" S FDNUM=155 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,56,"I") I FLD="" S FDNUM=56 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,125,"I") I FLD="" S FDNUM=125 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,126,"I") I FLD="" S FDNUM=126 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,363,"I") I FLD="" S FDNUM=363 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,.03,"I") I FLD="" S FDNUM=.03 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,.05,"I") I FLD="" S FDNUM=.05 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,.06,"I") I FLD="" S FDNUM=.06 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,.07,"I") I FLD="" S FDNUM=.07 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,8,"I") I FLD="" S FDNUM=8 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,8.1,"I") I FLD="" S FDNUM=8.1 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,16,"I") I FLD="" S FDNUM=16 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,11,"I") I FLD="" S FDNUM=11 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,9,"I") I FLD="" S FDNUM=9 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,10,"I") I FLD="" S FDNUM=10 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,4,"E") I FLD="" S FDNUM=4 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,1.2,"I") I FLD="" S FDNUM=1.2 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,2.1,"I") I FLD="" S FDNUM=2.1 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,18,"I") I FLD="" S FDNUM=18 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,.04,"I") I FLD="" S FDNUM=.04 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,12,"I") I FLD="" S FDNUM=12 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,3,"I") I FLD="" S FDNUM=3 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,147,"I") I FLD="" S FDNUM=147 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,20,"I") I FLD="" S FDNUM=20 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,28,"I") I FLD="" S FDNUM=28 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,22.3,"I") I FLD="" S FDNUM=22.3 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,24,"I") I FLD="" S FDNUM=24 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,26,"I") I FLD="" S FDNUM=26 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,29,"I") I FLD="" S FDNUM=29 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,30,"I") I FLD="" S FDNUM=30 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,31,"I") I FLD="" S FDNUM=31 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,33,"I") I FLD="" S FDNUM=33 D CMPLT
 I DTDX<3040000 D
 .S FLD=$$GET1^DIQ(165.5,PRM,34,"I") I FLD="" S FDNUM=34 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,34.1,"I") I FLD="" S FDNUM=34.1 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,34.2,"I") I FLD="" S FDNUM=34.2 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,35,"I") I FLD="" S FDNUM=35 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,32,"I") I FLD="" S FDNUM=32 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,37.1,"I") I FLD="" S FDNUM=37.1  D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,85,"I") I FLD="" S FDNUM=85 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,37.2,"I") I FLD="" S FDNUM=37.2 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,86,"I") I FLD="" S FDNUM=86 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,37.3,"I") I FLD="" S FDNUM=37.3 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,87,"I") I FLD="" S FDNUM=87 D CMPLT
 I DTDX<3030000 D
 .S FLD=$$GET1^DIQ(165.5,PRM,25.1,"I") I FLD="" S FDNUM=25.1 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,25.2,"I") I FLD="" S FDNUM=25.2 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,25.3,"I") I FLD="" S FDNUM=25.3 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,38,"I") I FLD="" S FDNUM=38 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,88,"I") I FLD="" S FDNUM=88 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,19,"I") I FLD="" S FDNUM=19 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,89,"I") I FLD="" S FDNUM=89 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,58.3,"I") I FLD="" S FDNUM=58.3 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,58.1,"I") I FLD="" S FDNUM=58.1 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,560,"I") I FLD="" S FDNUM=560 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,49,"E") I FLD="" S FDNUM=49 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,50,"I") I FLD="" S FDNUM=50 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,58,"I") I FLD="" S FDNUM=58 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,58.6,"I") I FLD="" S FDNUM=58.6 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,75,"I") I FLD="" S FDNUM=75 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,59,"I") I FLD="" S FDNUM=59 D CMPLT
 I DTDX<3030000 D
 .S FLD=$$GET1^DIQ(165.5,PRM,23,"I") I FLD="" S FDNUM=23 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,51,"I") I FLD="" S FDNUM=51 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,51.2,"I") I FLD="" S FDNUM=51.2 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,51.3,"I") I FLD="" S FDNUM=51.3 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,53,"I") I FLD="" S FDNUM=53 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,53.2,"I") I FLD="" S FDNUM=53.2 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,54,"I") I FLD="" S FDNUM=54 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,54.2,"I") I FLD="" S FDNUM=54.2 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,55,"I") I FLD="" S FDNUM=55 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,55.2,"I") I FLD="" S FDNUM=55.2 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,57,"I") I FLD="" S FDNUM=57 D CMPLT
 S FLD=$$GET1^DIQ(165.5,PRM,57.2,"I") I FLD="" S FDNUM=57.2 D CMPLT
 I DTDX<3030000 D
 .S FLD=$$GET1^DIQ(165.5,PRM,74,"I") I FLD="" S FDNUM=74 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,58.2,"I") I FLD="" S FDNUM=58.2 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,50.2,"I") I FLD="" S FDNUM=50.2 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,138,"I") I FLD="" S FDNUM=138 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,138.1,"I") I FLD="" S FDNUM=138.1 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,139,"I") I FLD="" S FDNUM=139 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,139.1,"I") I FLD="" S FDNUM=139.1 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,140,"I") I FLD="" S FDNUM=140 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,140.1,"I") I FLD="" S FDNUM=140.1 D CMPLT
 I DTDX>2971231 D
 .S FLD=$$GET1^DIQ(165.5,PRM,138.4,"I") I FLD="" S FDNUM=138.4 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,139.4,"I") I FLD="" S FDNUM=139.4 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,138.5,"I") I FLD="" S FDNUM=138.5 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,139.5,"I") I FLD="" S FDNUM=139.5 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,435,"I") I FLD="" S FDNUM=435 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,14,"I") I FLD="" S FDNUM=14 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,58.7,"I") I FLD="" S FDNUM=58.7 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,51.4,"I") I FLD="" S FDNUM=51.4 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,53.3,"I") I FLD="" S FDNUM=53.3 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,54.3,"I") I FLD="" S FDNUM=54.3 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,55.3,"I") I FLD="" S FDNUM=55.3 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,57.3,"I") I FLD="" S FDNUM=57.3 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,58.4,"I") I FLD="" S FDNUM=58.4 D CMPLT
 I DTDX>2961231 S FLD=$$GET1^DIQ(165.5,PRM,442,"I") I FLD="" S FDNUM=442 D CMPLT
 I DTDX>3031231 D
 .S FLD=$$GET1^DIQ(165.5,PRM,29.2,"I") I FLD="" S FDNUM=29.2 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,30.2,"I") I FLD="" S FDNUM=30.2 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,29.1,"I") I FLD="" S FDNUM=29.1 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,31.1,"I") I FLD="" S FDNUM=31.1 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,32.1,"I") I FLD="" S FDNUM=32.1 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,34.3,"I") I FLD="" S FDNUM=34.3 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,34.4,"I") I FLD="" S FDNUM=34.4 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,44.1,"I") I FLD="" S FDNUM=44.1 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,44.2,"I") I FLD="" S FDNUM=44.2 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,44.3,"I") I FLD="" S FDNUM=44.3 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,44.4,"I") I FLD="" S FDNUM=44.4 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,44.5,"I") I FLD="" S FDNUM=44.5 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,44.6,"I") I FLD="" S FDNUM=44.6 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,160,"I") I FLD="" S FDNUM=160 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,161,"I") I FLD="" S FDNUM=161 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,162,"I") I FLD="" S FDNUM=162 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,163,"I") I FLD="" S FDNUM=163 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,164,"I") I FLD="" S FDNUM=164 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,165,"I") I FLD="" S FDNUM=165 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,166,"I") I FLD="" S FDNUM=166 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,167,"I") I FLD="" S FDNUM=167 D CMPLT
 .S FLD=$$GET1^DIQ(165.5,PRM,168,"I") I FLD="" S FDNUM=168 D CMPLT
 Q
 ;
CMPLT ;Set CMPLT = 0 and add FLD to LIST of fields needed to be filled in.
 S FLDNAME=$P($G(^DD(ONCFILE,FDNUM,0)),U,1) S FDNUM=""
 S CMPLT=0,LIST(FLDNAME)=""
 Q
