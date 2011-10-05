DDGFHBK ;SFISC/MKO-ADD, EDIT, DELETE HEADER BLOCK ;01:48 PM  22 Nov 1994
 ;;22.0;VA FileMan;;Mar 30, 1999
 ;Per VHA Directive 10-93-142, this routine should not be modified.
 ;
ADD ;Add a header block
 ;Check to see if a header block already exists for this page
 S DDGFBH=$P(^DIST(.403,+DDGFFM,40,DDGFPG,0),U,2)
 I DDGFBH D MSG^DDGF($C(7)_"This page already has a header block.") H 2 D MSG^DDGF() K DDGFBH Q
 ;
 N B
 S DDGFDY=DY,DDGFDX=DX
 ;
 ;Invoke form to enter block name
 K DDGFBNUM,DDGFBNAM
 D DDS(.404,"[DDGF HEADER BLOCK SELECT]")
 G:$G(DDGFBNUM)=DDGFBH!'$G(DDGFBNUM) ADDQ
 ;
 I $D(^DIST(.403,+DDGFFM,40,DDGFPG,40,"B",DDGFBNUM)) D DDS(.404,"[DDGF BLOCK ADD]","",21) G ADDQ
 ;
 S $P(^DIST(.403,+DDGFFM,40,DDGFPG,0),U,2)=DDGFBNUM
 ;
 ;If this looks like a brand new block, stuff in DD number
 I $L(^DIST(.404,DDGFBNUM,0),U)=1,'$O(^(0)) D
 . S DIE="^DIST(.404,",DA=DDGFBNUM
 . S DR="1////"_$P(^DIST(.403,+DDGFFM,0),U,8)
 . D ^DIE K DIE,DA,DR
 ;
 D:DDGFBH DELETE^DDGFBK(DDGFBH,1)
 D BK^DDGFLOAD(DDGFPG,DDGFBNUM,$P(DDGFLIM,U),$P(DDGFLIM,U,2),0,0,1,1)
 ;
 S DY=DDGFDY,DX=DDGFDX
 S B=DDGFBNUM,C=$P(@DDGFREF@("F",DDGFPG,B),U,4)
 S DDGFADD=1
 K DDGFBNUM,DDGFBNAM
 G EDIT
 ;
ADDQ ;Abort adding a header block
 D REFRESH^DDGF,RC(DDGFDY,DDGFDX)
 K DDGFANS,DDGFBH,DDGFBNUM,DDGFBNAM,DDGFDY,DDGFDX
 Q
 ;
EDIT ;Edit/Delete header block
 ;In: B,C
 N C1,C2,C3
 S DDGFDY=DY,DDGFDX=DX,DDGFBH=B
 S (DDGFBKNN,DDGFBKNO)=C
 S DDSFILE=.403,DDSFILE(1)=.4031,DA(1)=+DDGFFM,DA=DDGFPG
 S DR="[DDGF HEADER BLOCK EDIT]",DDSPARM="KTW"
 D ^DDS K DDSFILE,DA,DR,DDSPARM
 S DDGFBHN=$P(^DIST(.403,+DDGFFM,40,DDGFPG,0),U,2)
 ;
 I DDGFBHN'=DDGFBH D
 . D DELETE^DDGFBK(DDGFBH,DDGFBHN)
 . D:DDGFBHN BK^DDGFLOAD(DDGFPG,DDGFBHN,$P(DDGFLIM,U),$P(DDGFLIM,U,2),0,0,1,1)
 ;
 S C=DDGFBKNN,B=DDGFBHN
 ;
 ;Update TMP if coordinates or name changed, or new block
 I DDGFBKNN'=DDGFBKNO!$G(DDGFADD) D
 . D WRITE^DDGLIBW(DDGFWIDB,$J("",$L(DDGFBKNO)),$P(DDGFLIM,U),$P(DDGFLIM,U,2),"",1)
 . D WRITE^DDGLIBW(DDGFWIDB,C,$P(DDGFLIM,U),$P(DDGFLIM,U,2),"",1)
 ;
 D REFRESH^DDGF,RC(DDGFDY,DDGFDX)
 S:'$G(DDGFADD) DDGFE=1
 K DDGFADD,DDGFBH,DDGFBHN,DDGFBKNN,DDGFBKNO,DDGFDY,DDGFDX
 Q
 ;
DDS(DDSFILE,DR,DA,DDSPAGE) ;
 ;Call DDS
 S DDSPARM="KTW" D ^DDS K DDSPARM
 Q
 ;
RC(DDGFY,DDGFX) ;Update status line, reset DX and DY, move cursor
 N S
 I DDGFR D
 . S DY=IOSL-6,DX=IOM-9,S="R"_(DDGFY+1)_",C"_(DDGFX+1)
 . X IOXY W S_$J("",7-$L(S))
 S DY=DDGFY,DX=DDGFX X IOXY
 Q