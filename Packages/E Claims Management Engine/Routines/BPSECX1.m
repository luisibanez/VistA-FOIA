BPSECX1 ;BHAM ISC/FCS/DRS/VA/DLF - Create new Claim ID for Claim Submission file ;05/17/2004
 ;;1.0;E CLAIMS MGMT ENGINE;**1**;JUN 2004
 ;----------------------------------------------------------------------
 ;Create new Claim ID for Claim Submission file (9002313.02)
 ;
 ;Input Variables:   NRDEFIEN  - NCPDP Record Definitions IEN
 ;                               (9002313.92)
 ;
 ;Function Returns:  String:  C<YY>-<BBBBBB>-<NNNNN>
 ;                         C can also be P or other ORIGIN code.
 ;                         See remarks a few lines below about ORIGIN
 ;                   Where:   <YY> is the year
 ;                            <BBBBBB> is the BIN number of the payor
 ;                            <NNNNN> is a 5-digit sequence number
 ;----------------------------------------------------------------------
 ; Also called from old Alaska Medicaid batch method,
 ; regrettably still in use at one site, but we're going to
 ; phase it out someday.
 ;
 ;  ORIGIN argument added 08/23/2000
 ;     Can specify the leading character of the claim ID.
 ;     Defaults to "C".
 ;     ECME sends in "P"
 ;   09/20/2000 - can override by setting BPSECX1("PREFIX")=letter
 ;     (Do this if you change the batch file to submit via POS)
 ;
 ;  Also changed 08/23/2000:  Sequence number is now 6 digits
 ;  and the first number assigned is 100000.  As of yesterday, ANMC
 ;  is already up to almost 40000.
 ;  Can't change length in the middle of the year or the $O(,-1) is
 ;  messed up.   So the code will adapt - if it finds 5-digit format
 ;  already there, it will assign new numbers with 5 digits.
 ;
CLAIMID(NRDEFIEN,ORIGIN) ;EP - Called from BPSOSCE from BPSOSCA from BPSOSQG from BPSOSQ2
 N PHARMACY,NABP,THIRD,DEL,PLAN,I,BIN,SEQNUM,ROOT,LAST ;LJE
 ;
 I '$D(ORIGIN) S ORIGIN="C"
 I $G(BPSECX1("PREFIX"))?1U S ORIGIN=BPSECX1("PREFIX")
 ;
 ; LJE;7/24/03; The following lines generate the VA transmission ID and quits
 I VARX D  Q ROOT
 . ;
 . ; Default the Origin (first piece of transmission ID
 . S ORIGIN="VA"
 . ;
 . ; Get and format NABP number (second piece of the transmission ID)
 . I '$D(CERTIFY) S CERTIFY=($G(^BPS(9002313.99,1,"CERTIFIER"))=DUZ)
 . I 'CERTIFY S PHARMACY=+$P($G(^BPST(IEN59,1)),U,7),NABP=$P($G(^BPS(9002313.56,PHARMACY,0)),"^",2)
 . I CERTIFY,'$G(PHARMACY) S PHARMACY=10,NABP=$P($G(^BPS(9002313.56,PHARMACY,0)),"^",2)
 . S NABP=$TR($J("",7-$L(NABP))," ","0")_NABP
 . ;
 . ; Get the third piece of the transmission ID
 . ;  If the National Plan ID is available, use it with '=' delimiter (new format)
 . ;  If not, it will need to be the BIN with the '-' delimiter (old format)
 . S THIRD="",PLAN=$$GET1^DIQ(9002313.59902,"1,"_IEN59_",","902.27")
 . I PLAN]"" D
 .. F I=1:1:$L(PLAN) I $E(PLAN,I)?1N Q
 .. S PLAN=$E(PLAN,I,$L(PLAN))
 .. S THIRD=PLAN,DEL="="
 . ;
 . ; If no plan, get BIN and use '-' delimiter (old format)
 . I THIRD="" S DEL="-",THIRD=$S(CERTIFY:$P($G(^BPSF(9002313.92,NRDEFIEN,1)),U,1),1:$$GET1^DIQ(9002313.59902,"1,"_IEN59_",","902.03"))
 . ;
 . ; Pad third piece with zeros
 . S THIRD=$TR($J("",6-$L(THIRD))," ","0")_THIRD
 . ;
 . ; Get and format the sequence number (fourth piece)
 . L +^BPS(9002313.99,1,3):15 I '$T D IMPOSS^BPSOSUE("DB,P","TI","",,"Can't lock BPS(9002313.99,1,3)",$T(+0))
 . S SEQNUM=+$G(^BPS(9002313.99,1,3)),^BPS(9002313.99,1,3)=SEQNUM+1
 . I $L(SEQNUM<7) S SEQNUM=$E($TR($J("",7-$L(SEQNUM))," ","0")_SEQNUM,1,7)
 . L -^BPS(9002313.99,1,3)
 . ;
 . ; Create the Transmission ID
 . S ROOT=ORIGIN_($E(DT,1,3)+1700)_DEL_NABP_DEL_THIRD_DEL_SEQNUM
 ;
 ;Get and format BIN number for the electronic payer
 S BIN=$P($G(^BPSF(9002313.92,NRDEFIEN,1)),U,1)
 S BIN=$$NFF^BPSECFM(BIN,6)
 ;
 ;Establish the root for the claim id number
 S ROOT=ORIGIN_$E(DT,2,3)_"-"_BIN_"-" ; 11 characters long
 ;
 ;Get last claim id number with the same root
 S LAST=$O(^BPSC("B",ROOT_"Z"),-1)
 ; Reversal claim ID?  Get rid of the suffix R#
 ; BPS*1.0T7*6    could be #>9, in which case the old logic fails!
 ; BPS*1.0T7*6    replaced the line that strips off the R#
 I $L(LAST)>6,LAST?.E1"R"1.N S $P(LAST,"-",3)=+$P(LAST,"-",3) ;BPS*1.0T7*6
 ;
 ;Set and format sequence number
 S SEQNUM=$S($E(LAST,1,11)=ROOT:(+$P(LAST,"-",3))+1,1:0)
 N SEQLEN
 ;  5 or 6 digit numbers?  Depends on what's there already? 
 ;  Six digits is what we really want, but upgrades will be trickier.
 ; New installs and ANMC 2001 will have 6 digits.
 ;
 I SEQNUM=0 S SEQLEN=6,SEQNUM=100000
 E  S SEQLEN=$L($P(LAST,"-",3))
 I SEQLEN<5 D IMPOSS^BPSOSUE("DB,P","TI",LAST,,"SEQLEN<5",$T(+0)) ; internal error
 I SEQLEN>6 D IMPOSS^BPSOSUE("DB,P","TI",LAST,,"SEQLEN>6",$T(+0)) ; internal error
 I $L(SEQNUM)=SEQLEN,SEQNUM?."9" D
 . D IMPOSS^BPSOSUE("DB,P","T",LAST,,"OVERFLOWED!",$T(+0))
 I SEQLEN=5 S SEQNUM=$TR($J(SEQNUM,SEQLEN)," ","0") ; pad w/leading 0s
 I $L(SEQNUM)'=SEQLEN D  ; internal error
 . D IMPOSS^BPSOSUE("DB,P","TI",LAST,SEQLEN,"length",$T(+0))
 ;
 Q ROOT_SEQNUM
