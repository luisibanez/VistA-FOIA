AUM111E ;IHS/SD/RNB - ICD 9 CODES FOR FY 2011 ; [ 09/09/2010   8:30 AM ]
 ;;11.0;TABLE MAINTENANCE;;OCT 15,2010
 ;
DRGS ;EP
 NEW AUMDA,AUMI,AUMLN,DA,DIE,DR
 F AUMI=1:1 S AUMLN=$P($T(DRG+AUMI),";;",2) Q:AUMLN="END"  D
 .S Y=$$IXDIC^AUM81("^ICD(","ILX","B","DRG"_$P(AUMLN,U),80.2,$P(AUMLN,U))
 .I Y=-1 Q
 .S DA=+Y
 .S DR=".01///DRG"_$P(AUMLN,U)       ;title
 .S DR=DR_";.06///"_$P(AUMLN,U,3)   ;surgery?
 .S DR=DR_";5///"_$P(AUMLN,U,2)     ;MDC
 .S DIE="^ICD("
 .S AUMDA=DA
 .D DIE^AUM81
 .S DA(1)=AUMDA
 .S DIC(0)="LOX"
 .S X=1
 .S DIC("P")=$P(^DD(80.2,1,0),"^",2)
 .S DIC="^ICD("_DA(1)_",1,"
 .S DIC("DR")=".01///"_$P(AUMLN,U,4)  ;description
 .D ^DIC
 Q
DRG ;;DRG^MDC^SURGERY?^DRG TITLE
 ;;END
 Q
ICD9PINA ;;ICD 9 PROCEDURE, INACTIVE CODES: CODE NUMBER(#.01)^DESCRIPTION(#10)^INACTIVE DATE(#102)
 ;;39.8^Operations on carotid body, carotid sinus and other vascular bodies^OCT 1, 2010
 ;;END
ICD9VNEW ;;ICD 9 DIAGNOSIS, NEW V-CODES: CODE NUMBER(#.01)^DIAGNOSIS(#3)^DESCRIPTION(#10)^USE ONLY WITH SEX(#9.5)^MDC(#5)^DRG(#60-65)
 ;;V11.4^Hx combat and oper stres react^Personal history of combat and operational stress reaction^^23^951^
 ;;V13.23^Hx of vaginal dysplasia^Personal history of vaginal dysplasia^^23^951^
 ;;V13.24^Hx of vulvar dysplasia^Personal history of vulvar dysplasia^^23^951^
 ;;V13.62^Hx oth congen malfor genit sys^Personal history of other (corrected) congenital malformations of genitourinary system^^23^951^
 ;;V13.63^Hx congential mal of nerv sys^Personal history of (corrected) congenital malformations of nervous system^^23^951^
 ;;V13.64^Hx congen mal of eye,ea,fac,ne^Personal history of (corrected) congenital malformations of eye, ear, face and neck^^23^951^
 ;;V13.65^Hx congen malf heart, cir sys^Personal history of (corrected) congenital malformations of heart and circulatory system^^23^951^
 ;;V13.66^Hx congen malfor respir sys^Personal history of (corrected) congenital malformations of respiratory system^^23^951^
 ;;V13.67^Hx congen malfo of digest sys^Personal history of (corrected) congenital malformations of digestive system^^23^951^
 ;;V13.68^Hx cong mal integu,lim,musosk^Personal history of (corrected) congenital malformations of integument, limbs, and musculoskeletal systems^^23^951^
 ;;V15.53^Hx retained forgn body removed^Personal history of retained foreign body fully removed^^23^951^
 ;;V25.11^Insertion IUD^Encounter for insertion of intrauterine contraceptive device^^23^951^
 ;;V25.12^Removal of IUD^Encounter for removal of intrauterine contraceptive device^^23^951^
 ;;V25.13^Removal/insertion of IUD^Encounter for removal and reinsertion of intrauterine contraceptive device^^23^951^
 ;;V49.86^Do not resuscitate status^Do not resuscitate status^^23^951^
 ;;V49.87^Physical restraints status^Physical restraints status^^23^951^
 ;;V62.85^Homicidal ideation^Homicidal ideation^^23^951^
 ;;V85.41^BMI 40.0-44.9, adult^Body Mass Index 40.0-44.9, adult^^10^640,641^1
 ;;V85.42^BMI 45.0-49.9, adult^Body Mass Index 45.0-49.9, adult^^10^640,641^1
 ;;V85.43^BMI 50.0-59.9, adult^Body Mass Index 50.0-59.9, adult^^10^640,641^1
 ;;V85.44^BMI 60.0-69.9, adult^Body Mass Index 60.0-69.9, adult^^10^640,641^1
 ;;V85.45^BMI 70 and over, adult^Body Mass Index 70 and over, adult^^10^640,641^1
 ;;V88.11^Acq total absence of pancreas^Acquired total absence of pancreas^^23^951^
 ;;V88.12^Acq part absence of pancreas^Acquired partial absence of pancreas^^23^951^
 ;;V90.01^Retain depleted uranium fragm^Retained depleted uranium fragments^^23^951^
 ;;V90.09^Oth retain radioactiv fragmen^Other retained radioactive fragments^^23^951^
 ;;V90.10^Retain metal fragments, unspec^Retained metal fragments, unspecified^^23^951^
 ;;V90.11^Retain magnetic metal fragment^Retained magnetic metal fragments^^23^951^
 ;;V90.12^Retain nonmagnetic metal frag^Retained nonmagnetic metal fragments^^23^951^
 ;;V90.2^Retained plastic fragments^Retained plastic fragments^^23^951^
 ;;V90.31^Retain animal quills or spines^Retained animal quills or spines^^23^951^
 ;;V90.32^Retained tooth^Retained tooth^^23^951^
 ;;V90.33^Retained wood fragments^Retained wood fragments^^23^951^
 ;;V90.39^Oth retained organic fragments^Other retained organic fragments^^23^951^
 ;;V90.81^Retained glass fragments^Retained glass fragments^^23^951^
 ;;V90.83^Retain stone or crystall frag^Retained stone or crystalline fragments^^23^951^
 ;;V90.89^Oth spec retain foreign body^Other specified retained foreign body^^23^951^
 ;;V90.9^Retain forein body, unspec mat^Retained foreign body, unspecified material^^23^951^
 ;;V91.00^Twin gest, unspec # placen,sac^Twin gestation, unspecified number of placenta, unspecified number of amniotic sacs^^23^951^
 ;;V91.01^Twin gest, 1 placen,1 amno sac^Twin gestation, monochorionic/monoamniotic (one placenta, one amniotic sac)^^23^951^
 ;;V91.02^Twin gest, 1 placen,2 amno sac^Twin gestation, monochorionic/diamniotic (one placenta, two amniotic sacs)^^23^951^
 ;;V91.03^Twin gest, 2 placen,2 amno sac^Twin gestation, dichorionic/diamniotic (two placentae, two amniotic sacs)^^23^951^
 ;;V91.09^Twin gest, unable # of pla/sac^Twin gestation, unable to determine number of placenta and number of amniotic sacs^^23^951^
 ;;V91.10^Trip gest, unspec # of pla/sac^Triplet gestation, unspecified number of placenta and unspecified number of amniotic sacs^^23^951^
 ;;V91.11^Trip gest, 2/+ monochor fetuse^Triplet gestation, with two or more monochorionic fetuses^^23^951^
 ;;V91.12^Trip gest, 2/+ monoamno fetuse^Triplet gestation, with two or more monoamniotic fetuses^^23^951^
 ;;V91.19^Trip gest, unable # of pla/sac^Triplet gestation, unable to determine number of placenta and number of amniotic sacs^^23^951^
 ;;V91.20^Quad gest, unspec # of pla/sac^Quadruplet gestation, unspecified number of placenta and unspecified number of amniotic sacs^^23^951^
 ;;V91.21^Quad gest, 2/+ monochor fetuse^Quadruplet gestation, with two or more monochorionic fetuses^^23^951^
 ;;V91.22^Quad gest, 2/+ monoamno fetuse^Quadruplet gestation, with two or more monoamniotic fetuses^^23^951^
 ;;V91.29^Quad gest, unable # of pla/sac^Quadruplet gestation, unable to determine number of placenta and number of amniotic sacs^^23^951^
 ;;V91.90^Oth mul gest, unspec # pla/sac^Other specified multiple gestation, unspecified number of placenta and unspecified number of amniotic sacs^^23^951^
 ;;V91.91^Oth spec mult gest, 2/+ monoch^Other specified multiple gestation, with two or more monochorionic fetuses^^23^951^
 ;;V91.92^Oth spec mulgest, 2/+ monoamn^Other specified multiple gestation, with two or more monoamniotic fetuses^^23^951^
 ;;V91.99^Oth spec mult gest,unab # p/s^Other specified multiple gestation, unable to determine number of placenta and number of amniotic sacs^^23^951^
 ;;END
ICD9NEW2 ;
 ;;END
ICD9PREV ;;ICD OPERATION/PROCEDURE, REVISED CODES: CODE NUMBER(#.01)^OPERATION/PROCEDURE(#4)^DESCRIPTION(#10)^USE ONLY WITH SEX(#9.5)^MDC(#80.12)-DRG(#80.12,1-6) (Multiple MDCs/DRGs separated by "~")
 ;;00.55^Insert drug-elut stent(s) oth peripheral vessel(s)^Insertion of drug-eluting stent(s) of other peripheral vessel(s)^^^^
 ;;35.96^Percutaneous balloon valvuloplasty^Percutaneous balloon valvuloplasty^^5-231,232,246,247,248,249,250,251^^
 ;;37.34^Excise/destruc oth heart les or tissue, endovascul^Excision or destruction of other lesion or tissue of heart, endovascular approach^^5-246,247,248,249,250,251^^
 ;;81.02^Oth cervial fusion anterior column, anter techni^Other cervical fusion of the anterior column, anterior technique^^1-28,29,30~8-453,454,455,471,472,473~21-907,908,909~24-957,958,959^^
 ;;81.03^Oth cervical fusion posterior column, poster tech^Other cervical fusion of the posterior column, posterior technique^^1-28,29,30~8-453,454,455,471,472,473~21-907,908,909~24-957,958,959^^
 ;;81.04^Dorsal/dorsolumbar fusi anterior column, anter tec^Dorsal and dorsolumbar fusion of the anterior column, anterior technique^^1-28,29,30~8-453,454,455,456,457,458,459,460~21-907,908,909~24-957,958,959^^
 ;;81.05^Dorsal/dorsolumbar fusi posterior colum, poste tec^Dorsal and dorsolumbar fusion of the posterior column, posterior technique^^1-28,29,30~8-453,454,455,456,457,458,459,560~21-907,908,909~24-957,958,959^^
 ;;81.06^Lumbar/lumbosac fusion anterior column, anter tec^Lumbar and lumbosacral fusion of the anterior column, anterior technique^^1-28,29,30~8-453,454,455,456,457,458,459,460~21-907,908,909~24-947,958,959^^
 ;;81.07^Lumbar/lumbosac fusion posterior column, pos tech^Lumbar and lumbosacral fusion of the posterior column, posterior technique^^1-28,29,30~8-453,454,455,456,457,458,459,460~21-907,908,909~24-947,958,959^^
 ;;81.08^Lumbar/lumbosacral fusi anterior column, post tech^Lumbar and lumbosacral fusion of the anterior column, posterior technique^^1-28,29,30~8-453,454,455,456,457,458,459,460~21-907,908,909~24-947,958,959^^
 ;;81.32^Refusi oth cervica spine, anterior col, anter tec^Refusion of other cervical spine, anterior column, anterior technique^^1-28,29,30~8-453,454,455,471,472,473~21-907,908,909~24-957,958,959^^
 ;;81.33^Refus oth cervical spine, posterior col, post tech^Refusion of other cervical spine, posterior column, posterior technique^^1-28,29,30~8-453,454,455,471,472,473~21-907,908,909~24-957,958,959^^
 ;;81.34^Refusi dorsal/dorsolumb, anterior col, anter techn^Refusion of dorsal and dorsolumbar spine, anterior column, anterior technique^^1-28,29,30~8-453,454,455,456,457,458,459,460~21-907,908,909~24-947,958,959^^
 ;;81.35^Refusi dorsal/dorsolumbar, posterior col, post tec^Refusion of dorsal and dorsolumbar spine, posterior column, posterior technique^^1-28,29,30~8-453,454,455,456,457,458,459,460~21-907,908,909~24-947,958,959^^
 ;;81.36^Refusi lumbar/lumbosacral, anterior col, anter tec^Refusion of lumbar and lumbosacral spine, anterior column, anterior technique^^1-28,29,30~8-453,454,455,456,457,458,459,460~21-907,908,909~24-947,958,959^^
 ;;81.37^Refusi lumbar/lumbosacral, posterior col, post tec^Refusion of lumbar and lumbosacral spine, posterior column, posterior technique^^1-28,29,30~8-453,454,455,456,457,458,459,460~21-907,908,909~24-947,958,959^^
 ;;81.38^Refusi lumbar/lumbosacral anterior col, post tech^Refusion of lumbar and lumbosacral spine, anterior column, posterior technique^^1-28,29,30~8-453,454,455,456,457,458,459,460~21-907,908,909~24-947,958,959^^
 ;;81.80^Other total shoulder replacement^Other total shoulder replacement^^8-483,484~21-907,908,909~24-957,958,959^^
 ;;83.21^Open biopsy of soft tissue^Open biopsy of soft tissue^^1-40,41,42~4-166,167,168~08-500,501,502~9-579,580,581~16-802,803,804^^
 ;;86.11^Closed biopsy of skin and subcutaneous tissue^Closed biopsy of skin and subcutaneous tissue^^^^
 ;;88.59^Intra-operative coronary fluoresc vascul angiogra^Intra-operative coronary fluorescence vascular angiography^^^^
 ;;99.14^Injection or infusion of immunoglobulin^Injection or infusion of immunoglobulin^^^^
 ;;END
PRNT ;
 S U="^"
 W !," CODE",?10,"DIAGNOSIS",!?10,"DESCRIPTION",!," -----",?10,"-----------"
 NEW X,Y,P2,P3
 F X=1:1 S Y=$P($T(ICD9NEW+X),";;",3),P2=$P(Y,U,2),P3=$P(Y,U,3) Q:Y="END"  W !," ",$P(Y,U,1),?10,$S($L(P3):P3,1:P2),!?10,P2
 Q
