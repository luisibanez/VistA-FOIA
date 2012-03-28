BITN2 ;IHS/CMI/MWR - BUILD ^BITN GLOBAL SECOND HALF; OCT 15, 2010
 ;;8.4;IMMUNIZATION;**2**;MAY 10,2010
 ;;* MICHAEL REMILLARD, DDS * CIMARRON MEDICAL INFORMATICS, FOR IHS *
 ;;  UTILITY: BUILD STANDARD ^BITN GLOBAL.
 ;;  PATCH 2: Add new CVX Codes 140 and 141.  TABLE+85
 ;
 ;
 ;----------
TABLE ; EP
 ;;200;;VEE, NOS^VEE,NOS^92^^^^1^^^^^^^^^0^0^.5
 ;;200a;;^^^^^^^^^^^^^Venezuelan equine enchapahlitis vaccine, NOS
 ;;201;;MMRV^MMRV^94^^^^0^^^^90710^3,4,5,6,7,21,38,121^3080313^^^0^1^.5^^^117^132
 ;;201a;;Pro-Quad^^^^^^^^^^^^^Measles, Mumps, Rubella, and Varicella virus vaccine
 ;;202;;TST-OT TINE TEST^TST-OT TIN^95^^^^1^1^13^^^^^^^0^0^.5
 ;;202a;;^^^^^^^^^^^^^Tuberculin skin test; old tuberculin, multipuncture device
 ;;203;;TST-PPD INTRADERMAL^TST-PPD^96^^^^1^1^13^^^^^^^0^0^.5
 ;;203a;;PPD^^^^^^^^^^^^^Tuberculin skin test; purified protein derivative, intradermal
 ;;204;;TST-PPD TINE TEST^TST-PPD TI^97^^^^1^1^13^^^^^^^0^0^.5
 ;;204a;;^^^^^^^^^^^^^Tuberculin skin test; purified proten derivative, multipuncture device
 ;;205;;TST, NOS^TST,NOS^98^^^^1^1^13^^^^^^^0^0^.5
 ;;205a;;^^^^^^^^^^^^^Tuberculin skin test; NOS
 ;;206;;RESERVED - DO NOT USE3^RESERVED -^99^^^^1^^^^^^^^^0^0^.5
 ;;206a;;^^^^^^^^^^^^^RESERVED -do not use
 ;;207;;TYPHOID, VICPS^TYPHOID,VI^101^^^^0^^^^90691^^3040519^^^0^1^.5
 ;;207a;;^^^^^^^^^^^^^Typhoid Vi capsular polysaccharide vaccine
 ;;208;;DTP-HIB-HEP B^DTP-HIB-HE^102^^^^1^^^^^^3080918^^^0^0^.5^^^103^136^138
 ;;208a;;^^^^^^^^^^^^^DTP-Haemophilus influenzae type b conjugate and hepatitis b vaccine
 ;;209;;HEP A-HEP B^TWINRIX^104^^^^0^^14^^90636^52,83,84,31,85,8,42,43,44,45,51,110^3070718^^^0^1^.5^^^144^168
 ;;209a;;Twinrix^59^^^^^^^^^^^^Hepatitis A and hepatitis B vaccine
 ;;210;;SMALLPOX, DILUTED^SMALLPOX,D^105^^^^1^^^^^^^^^0^1^.5
 ;;210a;;^^^^^^^^^^^^^Smallpox vaccine, diluted
 ;;211;;DTAP, 5 PERTUSSIS ANTIGENS^DTAP,5PE^106^^^^1^^1^^^20,107,110,50^3070517^^^0^1^.5^^
 ;;211a;;Daptacel^54^^^^^^^^^^^^Diphtheria, tetanus toxoids and acellular pertussis vaccine, 5 pertussis antigens
 ;;212;;DTAP, NOS^DTAP,NOS^107^^^^1^^1^^^20,106,110,50^^^^0^1^.5^^
 ;;212a;;^^^^^^^^^^^^^Diphtheria, tetanus toxoids and acellular pertussis vaccine, NOS
 ;;213;;MENINGOCOCCAL, NOS^MENING,NOS^108^^^^1^^16^^^32,103,114^^^^0^1^.5
 ;;213a;;^^^^^^^^^^^^^Meningococcal vaccine, NOS
 ;;214;;PNEUMOCOCCAL, NOS^PNEUMO,NOS^109^^^^1^^11^^^33,100^^^^0^1^.5
 ;;214a;;^^^^^^^^^^^^^Pneumococcal vaccine, NOS
 ;;215;;NO VACCINE ADMINISTERED^NO VACCINE^998^^^^1^^^^^^^^^0^0^.5
 ;;215a;;^^^^^^^^^^^^^No vaccine administered
 ;;216;;DTaP-Hep B-IPV^PEDIARIX^110^^^^0^^14^^90723^1,22,28,102,43,44,45,10,106,107,50,8,42,20^3080918^^^0^1^.5^^^138^107^133
 ;;216a;;Pediarix^59^^^^^^^^^^^^DTap- hepatitis B and poliovirus vaccine
 ;;217;;INFLUENZA, INTRANASAL^FLU-NASAL^111^^^^0^^10^^90660^125^3100810^^^0^1^.2
 ;;217a;;FluMist^42^^^^^^^^^^^^Influenza virus vaccine, live, attenuated, for intranasal use
 ;;218;;TETANUS TOXOID, NOS^TETTOX,NOS^112^^^^1^^1^^^9,28,35,113,115^^^^^1^.5
 ;;218a;;^^^^^^^^^^^^^TETANUS TOXOID, NOS
 ;;219;;TD (ADULT) PRESERVATIVE FREE^Td-ADULTpf^113^^^^0^^8^^90714^9,28,35,112,115^3081118^^^0^1^.5
 ;;219a;;^^^^^^^^^^^^^TD (ADULT) PRESERVATIVE FREE
 ;;220;;MENINGOCOCCAL A,C,Y,W-135 DIPHTHERIA CONJ^MENING-CV4^114^^^^0^^16^^90734^32,103,108^3080128^^^^1^.5
 ;;220a;;Menactra^^Menveo^^^^^^^^^^^MENINGOCOCCAL POLYSACCHARIDE (groups A, C, Y and W-135) diphtheria toxoid conj
 ;;221;;Tdap^Tdap^115^^^^0^^8^^90715^9,28,35,112,113^3081118^^^^1^.5
 ;;221a;;Boostrix^^Adacel^^^^^^^^^^^TETANUS TOXOID, REDUCED DIPHTHERIA, ACELL PERTUSSIS VACCINE, ABSORBED
 ;;222;;ROTAVIRUS, PENTAVALENT^ROTA-5^116^^^^0^0^15^^90680^74,119,122^3080918^^^^1^2
 ;;222a;;Rotateq^^^^^^^^^^^^^rotavirus, live, pentavalent vaccine
 ;;223;;VZIG-IND^VZIG-IND^117^^^^0^0^7^^^36^^^^^1
 ;;223a;;^^^^^^^^^^^^^varicella zoster immune globulin (Investigational New Drug)
 ;;224;;HPV, bivalent^HPV-2^118^^^^1^0^17^^^62^3100330^^^^1
 ;;224a;;Cervarix^^^^^^^^^^^^^human papilloma virus vaccine, bivalent
 ;;225;;ROTAVIRUS, MONOVALENT^ROTA-1^119^^^^0^0^15^^^74,116,122^3080918^^^^1
 ;;225a;;Rotarix^^^^^^^^^^^^^rotavirus, live, monovalent vaccine
 ;;226;;DTaP-Hib-IPV^PENTACEL^120^^^^1^0^14^^90698^01,10,17,20,22,46,47,48,49,50,51,102,106,107,110,120^3080918^^^^1^.5^^^133^136^107
 ;;226a;;^^^^^^^^^^^^^DTaP-Hib-IPV
 ;;227;;ZOSTER^ZOSTER^121^^^^0^0^7^^90736^21,94,117^3091006
 ;;227a;;Zostavax^^^^^^^^^^^^^zoster vaccine, live
 ;;228;;ROTAVIRUS, NOS^ROTA,NOS^122^^^^1^0^15^^^74,116,119^^^^^1
 ;;228a;;^^^^^^^^^^^^^rotavirus vaccine, NOS
 ;;229;;INFLUENZA, H5N1^FLU-H5N1^123^^^^1^^10^^^15,16,88,111,123,125,126,127,128,135^^^^0^0^
 ;;229a;;^^^^^^^^^^^^^Influenza virus vaccine, H5N1, A/Vietnam/1203/2004 (national stockpile)
 ;;230;;DTaP-IPV^KINRIX^130^^^^0^0^14^^90696^10,110,20,50,106,107^3070517^^^^1^^^^133^107
 ;;230a;;Kinrix^^^^^^^^^^^^^Diphtheria, tetanus toxoids and acellular pertussis, and poliovirus, inactivated
 ;;231;;Novel Influenza-H1N1-09, Nasal^H1N1-NASAL^125^^^^0^0^18^SWINEFLU^^111^3091001^^^0^1^.2
 ;;231a;;^^^^^^^^^^^^^Novel Influenza-H1N1-09, live virus for nasal administration
 ;;232;;Novel influenza-H1N1-09, preservative-free^H1N1-pfree^126^^^^0^0^18^^^15,16,88,111,123,125,126,127,128,135^3091001^^^0^1
 ;;232a;;^^^^^^^^^^^^^Novel influenza-H1N1-09, preservative-free, injectable
 ;;233;;Novel influenza-H1N1-09^H1N1^127^^^^0^0^18^^^15,16,88,111,123,125,126,127,128,135^3091001^^^0^1^.5
 ;;233a;;^^^^^^^^^^^^^Novel influenza-H1N1-09, injectable
 ;;234;;Novel influenza-H1N1-09, all formulations^H1N1,NOS^128^^^^1^0^18^^90663^15,16,88,111,123,125,126,127,128,135^^^^0^1^.5
 ;;234a;;^^^^^^^^^^^^^Novel influenza-H1N1-09, all formulations
 ;;235;;Pneumococcal, PCV-13^PCV-13^133^^^^0^0^11^PCV13^90670^100,109^3100416^^^0^1^.5
 ;;235a;;Prevnar 13^^PREVNAR 13^^^^^^^^^^^pneumococcal conjugate vaccine, 13 valent
 ;;236;;INFLUENZA, HIGH DOSE SEASONAL^FLU-HIGH^135^^^^0^0^10^^^15,16,88,111,123,125,126,127,128,135^3100810^^^^1^.5
 ;;236a;;^^^^^^^^^^^^^INFLUENZA, HIGH DOSE SEASONAL, PRESERVATIVE-FREE
 ;;237;;Meningococcal MCV4O^MeningCV4O^136^^^^0^^16^^90734^103,114,108^3080128^^^0^1^.5
 ;;237a;;Menveo^^^^^^^^^^^^^meningococcal oligosaccharide (groups A, C, Y and W-135) diphtheria toxoid conj
 ;;238;;DTaP-IPV-HIB-HEP B, historical^DTaPIPVHHb^132^^^^1^^14^^^^^^^^^^^^133^107^124^110
 ;;238a;;^^^^^^^^^^^^^DTaP-IPV-HIB-HEP B, historical
 ;;239;;HPV,NOS^HPV,NOS^137^^^^1^^17
 ;;239a;;^^^^^^^^^^^^^HPV, NOS
 ;;240;;Japanese Encephalitis-IM^JAPAN E IM^134^^^^1^^12
 ;;240a;;^^^^^^^^^^^^^Japanese Encephalitis vaccine for intramuscular administration.
 ;;241;;Typhus, historical^TYPHUS,NOS^131^^^^1^^12
 ;;241a;;^^^^^^^^^^^^^Historical record of a typhus vaccination
 ;;242;;INFLUENZA [TIVpf], SEASONAL INJ, P FREE^FLU-TIVpf^140^^^^0^0^10^^90655^15,16,88,111,123,125,126,127,128,135,140,141^3100810^^^0^1^.25
 ;;242a;;^^^^^^^^^^^^^INFLUENZA, SEASONAL INJ, PRES. FREE^90656
 ;;243;;INFLUENZA [TIV], SEASONAL, INJ^FLU-TIV^141^^^^0^0^10^^90657^15,16,88,111,123,125,126,127,128,135,140,141^3100810^^^0^1^.5
 ;;243a;;^^^^^^^^^^^^^INFLUENZA, SEASONAL INJECTABLE^90658
 Q
