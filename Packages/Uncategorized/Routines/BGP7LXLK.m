BGP7LXLK ; IHS/CMI/LAB -CREATED BY ^ATXSTX ON AUG 29, 2006 ;
 ;;7.0;IHS CLINICAL REPORTING;;JAN 24, 2007
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;9002226.02101,"629,49999-0046-14 ",.01)
 ;;49999-0046-14
 ;;9002226.02101,"629,49999-0046-14 ",.02)
 ;;49999-0046-14
 ;;9002226.02101,"629,49999-0046-20 ",.01)
 ;;49999-0046-20
 ;;9002226.02101,"629,49999-0046-20 ",.02)
 ;;49999-0046-20
 ;;9002226.02101,"629,49999-0064-00 ",.01)
 ;;49999-0064-00
 ;;9002226.02101,"629,49999-0064-00 ",.02)
 ;;49999-0064-00
 ;;9002226.02101,"629,49999-0064-01 ",.01)
 ;;49999-0064-01
 ;;9002226.02101,"629,49999-0064-01 ",.02)
 ;;49999-0064-01
 ;;9002226.02101,"629,49999-0064-07 ",.01)
 ;;49999-0064-07
 ;;9002226.02101,"629,49999-0064-07 ",.02)
 ;;49999-0064-07
 ;;9002226.02101,"629,49999-0064-10 ",.01)
 ;;49999-0064-10
 ;;9002226.02101,"629,49999-0064-10 ",.02)
 ;;49999-0064-10
 ;;9002226.02101,"629,49999-0064-14 ",.01)
 ;;49999-0064-14
 ;;9002226.02101,"629,49999-0064-14 ",.02)
 ;;49999-0064-14
 ;;9002226.02101,"629,49999-0064-15 ",.01)
 ;;49999-0064-15
 ;;9002226.02101,"629,49999-0064-15 ",.02)
 ;;49999-0064-15
 ;;9002226.02101,"629,49999-0064-20 ",.01)
 ;;49999-0064-20
 ;;9002226.02101,"629,49999-0064-20 ",.02)
 ;;49999-0064-20
 ;;9002226.02101,"629,49999-0064-30 ",.01)
 ;;49999-0064-30
 ;;9002226.02101,"629,49999-0064-30 ",.02)
 ;;49999-0064-30
 ;;9002226.02101,"629,49999-0064-40 ",.01)
 ;;49999-0064-40
 ;;9002226.02101,"629,49999-0064-40 ",.02)
 ;;49999-0064-40
 ;;9002226.02101,"629,49999-0064-50 ",.01)
 ;;49999-0064-50
 ;;9002226.02101,"629,49999-0064-50 ",.02)
 ;;49999-0064-50
 ;;9002226.02101,"629,49999-0064-60 ",.01)
 ;;49999-0064-60
 ;;9002226.02101,"629,49999-0064-60 ",.02)
 ;;49999-0064-60
 ;;9002226.02101,"629,49999-0064-90 ",.01)
 ;;49999-0064-90
 ;;9002226.02101,"629,49999-0064-90 ",.02)
 ;;49999-0064-90
 ;;9002226.02101,"629,49999-0070-20 ",.01)
 ;;49999-0070-20
 ;;9002226.02101,"629,49999-0070-20 ",.02)
 ;;49999-0070-20
 ;;9002226.02101,"629,49999-0070-30 ",.01)
 ;;49999-0070-30
 ;;9002226.02101,"629,49999-0070-30 ",.02)
 ;;49999-0070-30
 ;;9002226.02101,"629,49999-0070-40 ",.01)
 ;;49999-0070-40
 ;;9002226.02101,"629,49999-0070-40 ",.02)
 ;;49999-0070-40
 ;;9002226.02101,"629,49999-0070-42 ",.01)
 ;;49999-0070-42
 ;;9002226.02101,"629,49999-0070-42 ",.02)
 ;;49999-0070-42
 ;;9002226.02101,"629,49999-0070-60 ",.01)
 ;;49999-0070-60
 ;;9002226.02101,"629,49999-0070-60 ",.02)
 ;;49999-0070-60
 ;;9002226.02101,"629,49999-0084-60 ",.01)
 ;;49999-0084-60
 ;;9002226.02101,"629,49999-0084-60 ",.02)
 ;;49999-0084-60
 ;;9002226.02101,"629,49999-0088-60 ",.01)
 ;;49999-0088-60
 ;;9002226.02101,"629,49999-0088-60 ",.02)
 ;;49999-0088-60
 ;;9002226.02101,"629,49999-0274-21 ",.01)
 ;;49999-0274-21
 ;;9002226.02101,"629,49999-0274-21 ",.02)
 ;;49999-0274-21
 ;;9002226.02101,"629,49999-0281-00 ",.01)
 ;;49999-0281-00
 ;;9002226.02101,"629,49999-0281-00 ",.02)
 ;;49999-0281-00
 ;;9002226.02101,"629,49999-0282-00 ",.01)
 ;;49999-0282-00
 ;;9002226.02101,"629,49999-0282-00 ",.02)
 ;;49999-0282-00
 ;;9002226.02101,"629,49999-0282-60 ",.01)
 ;;49999-0282-60
 ;;9002226.02101,"629,49999-0282-60 ",.02)
 ;;49999-0282-60
 ;;9002226.02101,"629,49999-0288-00 ",.01)
 ;;49999-0288-00
 ;;9002226.02101,"629,49999-0288-00 ",.02)
 ;;49999-0288-00
 ;;9002226.02101,"629,49999-0288-30 ",.01)
 ;;49999-0288-30
 ;;9002226.02101,"629,49999-0288-30 ",.02)
 ;;49999-0288-30
 ;;9002226.02101,"629,49999-0288-60 ",.01)
 ;;49999-0288-60
 ;;9002226.02101,"629,49999-0288-60 ",.02)
 ;;49999-0288-60
 ;;9002226.02101,"629,49999-0289-60 ",.01)
 ;;49999-0289-60
 ;;9002226.02101,"629,49999-0289-60 ",.02)
 ;;49999-0289-60
 ;;9002226.02101,"629,49999-0363-01 ",.01)
 ;;49999-0363-01
 ;;9002226.02101,"629,49999-0363-01 ",.02)
 ;;49999-0363-01
 ;;9002226.02101,"629,49999-0363-15 ",.01)
 ;;49999-0363-15
 ;;9002226.02101,"629,49999-0363-15 ",.02)
 ;;49999-0363-15
 ;;9002226.02101,"629,49999-0363-18 ",.01)
 ;;49999-0363-18
 ;;9002226.02101,"629,49999-0363-18 ",.02)
 ;;49999-0363-18
 ;;9002226.02101,"629,49999-0363-30 ",.01)
 ;;49999-0363-30
 ;;9002226.02101,"629,49999-0363-30 ",.02)
 ;;49999-0363-30
 ;;9002226.02101,"629,49999-0363-60 ",.01)
 ;;49999-0363-60
 ;;9002226.02101,"629,49999-0363-60 ",.02)
 ;;49999-0363-60
 ;;9002226.02101,"629,49999-0363-90 ",.01)
 ;;49999-0363-90
 ;;9002226.02101,"629,49999-0363-90 ",.02)
 ;;49999-0363-90
 ;;9002226.02101,"629,50111-0563-01 ",.01)
 ;;50111-0563-01
 ;;9002226.02101,"629,50111-0563-01 ",.02)
 ;;50111-0563-01
 ;;9002226.02101,"629,50111-0563-02 ",.01)
 ;;50111-0563-02
 ;;9002226.02101,"629,50111-0563-02 ",.02)
 ;;50111-0563-02
 ;;9002226.02101,"629,50111-0563-03 ",.01)
 ;;50111-0563-03
 ;;9002226.02101,"629,50111-0563-03 ",.02)
 ;;50111-0563-03
 ;;9002226.02101,"629,50580-0280-10 ",.01)
 ;;50580-0280-10
 ;;9002226.02101,"629,50580-0280-10 ",.02)
 ;;50580-0280-10
 ;;9002226.02101,"629,50580-0874-11 ",.01)
 ;;50580-0874-11
 ;;9002226.02101,"629,50580-0874-11 ",.02)
 ;;50580-0874-11
 ;;9002226.02101,"629,50752-0285-05 ",.01)
 ;;50752-0285-05
 ;;9002226.02101,"629,50752-0285-05 ",.02)
 ;;50752-0285-05
 ;;9002226.02101,"629,50752-0285-08 ",.01)
 ;;50752-0285-08
 ;;9002226.02101,"629,50752-0285-08 ",.02)
 ;;50752-0285-08
 ;;9002226.02101,"629,50752-0285-09 ",.01)
 ;;50752-0285-09
 ;;9002226.02101,"629,50752-0285-09 ",.02)
 ;;50752-0285-09
 ;;9002226.02101,"629,51079-0055-20 ",.01)
 ;;51079-0055-20
 ;;9002226.02101,"629,51079-0055-20 ",.02)
 ;;51079-0055-20
 ;;9002226.02101,"629,51079-0476-20 ",.01)
 ;;51079-0476-20
 ;;9002226.02101,"629,51079-0476-20 ",.02)
 ;;51079-0476-20
 ;;9002226.02101,"629,51079-0644-17 ",.01)
 ;;51079-0644-17
 ;;9002226.02101,"629,51079-0644-17 ",.02)
 ;;51079-0644-17
 ;;9002226.02101,"629,51079-0644-19 ",.01)
 ;;51079-0644-19
 ;;9002226.02101,"629,51079-0644-19 ",.02)
 ;;51079-0644-19
 ;;9002226.02101,"629,51079-0644-20 ",.01)
 ;;51079-0644-20
 ;;9002226.02101,"629,51079-0644-20 ",.02)
 ;;51079-0644-20
 ;;9002226.02101,"629,51079-0644-93 ",.01)
 ;;51079-0644-93
 ;;9002226.02101,"629,51079-0644-93 ",.02)
 ;;51079-0644-93
 ;;9002226.02101,"629,51079-0644-97 ",.01)
 ;;51079-0644-97
 ;;9002226.02101,"629,51079-0644-97 ",.02)
 ;;51079-0644-97
 ;;9002226.02101,"629,51234-0514-02 ",.01)
 ;;51234-0514-02
 ;;9002226.02101,"629,51234-0514-02 ",.02)
 ;;51234-0514-02
 ;;9002226.02101,"629,51285-0852-04 ",.01)
 ;;51285-0852-04
 ;;9002226.02101,"629,51285-0852-04 ",.02)
 ;;51285-0852-04
 ;;9002226.02101,"629,51285-0873-02 ",.01)
 ;;51285-0873-02
 ;;9002226.02101,"629,51285-0873-02 ",.02)
 ;;51285-0873-02
 ;;9002226.02101,"629,51285-0873-04 ",.01)
 ;;51285-0873-04
 ;;9002226.02101,"629,51285-0873-04 ",.02)
 ;;51285-0873-04
 ;;9002226.02101,"629,51285-0873-05 ",.01)
 ;;51285-0873-05
 ;;9002226.02101,"629,51285-0873-05 ",.02)
 ;;51285-0873-05
 ;;9002226.02101,"629,51285-0874-02 ",.01)
 ;;51285-0874-02
 ;;9002226.02101,"629,51285-0874-02 ",.02)
 ;;51285-0874-02
 ;;9002226.02101,"629,51285-0874-04 ",.01)
 ;;51285-0874-04
 ;;9002226.02101,"629,51285-0874-04 ",.02)
 ;;51285-0874-04
 ;;9002226.02101,"629,51285-0874-05 ",.01)
 ;;51285-0874-05
 ;;9002226.02101,"629,51285-0874-05 ",.02)
 ;;51285-0874-05
 ;;9002226.02101,"629,51432-0058-03 ",.01)
 ;;51432-0058-03
 ;;9002226.02101,"629,51432-0058-03 ",.02)
 ;;51432-0058-03
 ;;9002226.02101,"629,51432-0060-03 ",.01)
 ;;51432-0060-03
 ;;9002226.02101,"629,51432-0060-03 ",.02)
 ;;51432-0060-03
 ;;9002226.02101,"629,51432-0249-03 ",.01)
 ;;51432-0249-03
 ;;9002226.02101,"629,51432-0249-03 ",.02)
 ;;51432-0249-03
 ;;9002226.02101,"629,51432-0297-03 ",.01)
 ;;51432-0297-03
 ;;9002226.02101,"629,51432-0297-03 ",.02)
 ;;51432-0297-03
 ;;9002226.02101,"629,51432-0367-03 ",.01)
 ;;51432-0367-03
 ;;9002226.02101,"629,51432-0367-03 ",.02)
 ;;51432-0367-03
 ;;9002226.02101,"629,51432-0458-03 ",.01)
 ;;51432-0458-03
 ;;9002226.02101,"629,51432-0458-03 ",.02)
 ;;51432-0458-03
 ;;9002226.02101,"629,51432-0458-06 ",.01)
 ;;51432-0458-06
 ;;9002226.02101,"629,51432-0458-06 ",.02)
 ;;51432-0458-06
 ;;9002226.02101,"629,51432-0460-03 ",.01)
 ;;51432-0460-03
 ;;9002226.02101,"629,51432-0460-03 ",.02)
 ;;51432-0460-03
 ;;9002226.02101,"629,51432-0460-06 ",.01)
 ;;51432-0460-06
 ;;9002226.02101,"629,51432-0460-06 ",.02)
 ;;51432-0460-06
 ;;9002226.02101,"629,51432-0824-03 ",.01)
 ;;51432-0824-03
 ;;9002226.02101,"629,51432-0824-03 ",.02)
 ;;51432-0824-03
 ;;9002226.02101,"629,51432-0882-03 ",.01)
 ;;51432-0882-03
 ;;9002226.02101,"629,51432-0882-03 ",.02)
 ;;51432-0882-03
 ;;9002226.02101,"629,51655-0141-50 ",.01)
 ;;51655-0141-50
 ;;9002226.02101,"629,51655-0141-50 ",.02)
 ;;51655-0141-50
 ;;9002226.02101,"629,51655-0170-24 ",.01)
 ;;51655-0170-24
 ;;9002226.02101,"629,51655-0170-24 ",.02)
 ;;51655-0170-24
 ;;9002226.02101,"629,51655-0283-29 ",.01)
 ;;51655-0283-29
 ;;9002226.02101,"629,51655-0283-29 ",.02)
 ;;51655-0283-29
 ;;9002226.02101,"629,51655-0376-52 ",.01)
 ;;51655-0376-52
 ;;9002226.02101,"629,51655-0376-52 ",.02)
 ;;51655-0376-52
 ;;9002226.02101,"629,51655-0440-24 ",.01)
 ;;51655-0440-24
 ;;9002226.02101,"629,51655-0440-24 ",.02)
 ;;51655-0440-24
 ;;9002226.02101,"629,51655-0440-25 ",.01)
 ;;51655-0440-25
 ;;9002226.02101,"629,51655-0440-25 ",.02)
 ;;51655-0440-25
 ;;9002226.02101,"629,51655-0440-54 ",.01)
 ;;51655-0440-54
 ;;9002226.02101,"629,51655-0440-54 ",.02)
 ;;51655-0440-54
 ;;9002226.02101,"629,51655-0440-85 ",.01)
 ;;51655-0440-85
 ;;9002226.02101,"629,51655-0440-85 ",.02)
 ;;51655-0440-85
 ;;9002226.02101,"629,51655-0576-25 ",.01)
 ;;51655-0576-25
 ;;9002226.02101,"629,51655-0576-25 ",.02)
 ;;51655-0576-25
 ;;9002226.02101,"629,51655-0576-51 ",.01)
 ;;51655-0576-51
 ;;9002226.02101,"629,51655-0576-51 ",.02)
 ;;51655-0576-51
 ;;9002226.02101,"629,52152-0025-02 ",.01)
 ;;52152-0025-02
 ;;9002226.02101,"629,52152-0025-02 ",.02)
 ;;52152-0025-02
 ;;9002226.02101,"629,52152-0025-04 ",.01)
 ;;52152-0025-04
 ;;9002226.02101,"629,52152-0025-04 ",.02)
 ;;52152-0025-04
 ;;9002226.02101,"629,52152-0053-02 ",.01)
 ;;52152-0053-02
 ;;9002226.02101,"629,52152-0053-02 ",.02)
 ;;52152-0053-02
 ;;9002226.02101,"629,52152-0053-05 ",.01)
 ;;52152-0053-05
 ;;9002226.02101,"629,52152-0053-05 ",.02)
 ;;52152-0053-05
 ;;9002226.02101,"629,52152-0136-02 ",.01)
 ;;52152-0136-02
 ;;9002226.02101,"629,52152-0136-02 ",.02)
 ;;52152-0136-02
 ;;9002226.02101,"629,52152-0136-04 ",.01)
 ;;52152-0136-04
 ;;9002226.02101,"629,52152-0136-04 ",.02)
 ;;52152-0136-04
 ;;9002226.02101,"629,52152-0136-05 ",.01)
 ;;52152-0136-05
 ;;9002226.02101,"629,52152-0136-05 ",.02)
 ;;52152-0136-05
 ;;9002226.02101,"629,52152-0137-02 ",.01)
 ;;52152-0137-02
 ;;9002226.02101,"629,52152-0137-02 ",.02)
 ;;52152-0137-02
 ;;9002226.02101,"629,52152-0137-04 ",.01)
 ;;52152-0137-04
 ;;9002226.02101,"629,52152-0137-04 ",.02)
 ;;52152-0137-04
 ;;9002226.02101,"629,52152-0138-02 ",.01)
 ;;52152-0138-02
 ;;9002226.02101,"629,52152-0138-02 ",.02)
 ;;52152-0138-02
 ;;9002226.02101,"629,52152-0340-02 ",.01)
 ;;52152-0340-02
 ;;9002226.02101,"629,52152-0340-02 ",.02)
 ;;52152-0340-02
 ;;9002226.02101,"629,52406-0129-10 ",.01)
 ;;52406-0129-10
 ;;9002226.02101,"629,52406-0129-10 ",.02)
 ;;52406-0129-10
 ;;9002226.02101,"629,52406-0131-10 ",.01)
 ;;52406-0131-10
 ;;9002226.02101,"629,52406-0131-10 ",.02)
 ;;52406-0131-10
 ;;9002226.02101,"629,52406-0354-82 ",.01)
 ;;52406-0354-82
 ;;9002226.02101,"629,52406-0354-82 ",.02)
 ;;52406-0354-82
 ;;9002226.02101,"629,52544-0418-01 ",.01)
 ;;52544-0418-01
 ;;9002226.02101,"629,52544-0418-01 ",.02)
 ;;52544-0418-01
 ;;9002226.02101,"629,52544-0418-05 ",.01)
 ;;52544-0418-05
 ;;9002226.02101,"629,52544-0418-05 ",.02)
 ;;52544-0418-05
 ;;9002226.02101,"629,52544-0418-10 ",.01)
 ;;52544-0418-10
 ;;9002226.02101,"629,52544-0418-10 ",.02)
 ;;52544-0418-10
 ;;9002226.02101,"629,52544-0692-01 ",.01)
 ;;52544-0692-01
 ;;9002226.02101,"629,52544-0692-01 ",.02)
 ;;52544-0692-01
 ;;9002226.02101,"629,52544-0692-10 ",.01)
 ;;52544-0692-10
 ;;9002226.02101,"629,52544-0692-10 ",.02)
 ;;52544-0692-10
 ;;9002226.02101,"629,52544-0693-01 ",.01)
 ;;52544-0693-01
 ;;9002226.02101,"629,52544-0693-01 ",.02)
 ;;52544-0693-01
 ;;9002226.02101,"629,52544-0693-05 ",.01)
 ;;52544-0693-05
 ;;9002226.02101,"629,52544-0693-05 ",.02)
 ;;52544-0693-05
 ;;9002226.02101,"629,52544-0784-01 ",.01)
 ;;52544-0784-01
 ;;9002226.02101,"629,52544-0784-01 ",.02)
 ;;52544-0784-01
 ;;9002226.02101,"629,52544-0784-05 ",.01)
 ;;52544-0784-05
 ;;9002226.02101,"629,52544-0784-05 ",.02)
 ;;52544-0784-05
 ;;9002226.02101,"629,52544-0784-10 ",.01)
 ;;52544-0784-10
 ;;9002226.02101,"629,52544-0784-10 ",.02)
 ;;52544-0784-10
 ;;9002226.02101,"629,52544-0806-01 ",.01)
 ;;52544-0806-01
 ;;9002226.02101,"629,52544-0806-01 ",.02)
 ;;52544-0806-01
 ;;9002226.02101,"629,52544-0806-05 ",.01)
 ;;52544-0806-05
 ;;9002226.02101,"629,52544-0806-05 ",.02)
 ;;52544-0806-05
 ;;9002226.02101,"629,52544-0807-01 ",.01)
 ;;52544-0807-01
 ;;9002226.02101,"629,52544-0807-01 ",.02)
 ;;52544-0807-01
 ;;9002226.02101,"629,52544-0807-05 ",.01)
 ;;52544-0807-05
 ;;9002226.02101,"629,52544-0807-05 ",.02)
 ;;52544-0807-05
 ;;9002226.02101,"629,52555-0441-10 ",.01)
 ;;52555-0441-10
 ;;9002226.02101,"629,52555-0441-10 ",.02)
 ;;52555-0441-10
 ;;9002226.02101,"629,52604-3204-01 ",.01)
 ;;52604-3204-01
 ;;9002226.02101,"629,52604-3204-01 ",.02)
 ;;52604-3204-01
 ;;9002226.02101,"629,52604-3300-08 ",.01)
 ;;52604-3300-08
 ;;9002226.02101,"629,52604-3300-08 ",.02)
 ;;52604-3300-08
 ;;9002226.02101,"629,52604-3304-01 ",.01)
 ;;52604-3304-01
 ;;9002226.02101,"629,52604-3304-01 ",.02)
 ;;52604-3304-01
