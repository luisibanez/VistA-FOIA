PXRMVSIT ; SLC/PKR - Visit related info for reminders. ;08/31/2004
 ;;2.0;CLINICAL REMINDERS;;Feb 04, 2005
 ;
 ;======================================================
GETDATA(DA,FIEVT) ;Return data for a specific Visit file entry.
 ;DBIA #2028
 N TEMP
 S TEMP=^AUPNVSIT(DA,0)
 S FIEVT("VISIT")=DA
 S FIEVT("DATE VISIT CREATED")=$P(TEMP,U,2)
 S FIEVT("DFN")=$P(TEMP,U,5)
 S FIEVT("LOC. OF ENCOUNTER")=$P(TEMP,U,6)
 S (FIEVT("SERVICE CATEGORY"),FIEVT("VALUE"))=$P(TEMP,U,7)
 S FIEVT("DSS ID")=$P(TEMP,U,8)
 S FIEVT("HOSPITAL LOCATION")=$P(TEMP,U,22)
 S FIEVT("OUTSIDE LOCATION")=$G(^AUPNVSIT(DA,21))
 S FIEVT("COMMENTS")=$G(^AUPNVSIT(DA,811))
 Q
 ;
 ;======================================================
HENC(VIEN,INDENT,NLINES,TEXT) ;Display location and comment for historical
 ;encounters associated with the V files.
 N COMMENT,HLOC,LOCATION,OLOC,NIN,TEXTIN,VDATA
 D GETDATA(VIEN,.VDATA) I VDATA("SERVICE CATEGORY")'="E" Q
 S NIN=0
 S LOCATION=VDATA("LOC. OF ENCOUNTER")
 I LOCATION'="" D
 . S LOCATION=$$GET1^DIQ(4,LOCATION,.01)_" "_$$GET1^DIQ(4,LOCATION,99)
 . S NIN=NIN+1,TEXTIN(NIN)="Location of Encounter: "_LOCATION_"\\"
 S HLOC=VDATA("HOSPITAL LOCATION")
 I HLOC'="" D
 . S HLOC=$$GET1^DIQ(44,HLOC,.01)
 . S NIN=NIN+1,TEXTIN(NIN)="Hospital Location: "_HLOC_"\\"
 S OLOC=VDATA("OUTSIDE LOCATION")
 I OLOC'="" D
 . S NIN=NIN+1,TEXTIN(NIN)="Outside Location: "_OLOC_"\\"
 S COMMENT=VDATA("COMMENT")
 I COMMENT'="" D
 . S NIN=NIN+1,TEXTIN(NIN)="Comment: "_COMMENT
 I NIN>0 D
 . N JND,NOUT,TEXTOUT
 . S NLINES=NLINES+1
 . S TEXT(NLINES)=$$INSCHR^PXRMEXLC(INDENT," ")_"Historical Encounter Information:"
 . D FORMAT^PXRMTEXT(INDENT+2,PXRMRM,NIN,.TEXTIN,.NOUT,.TEXTOUT)
 . F JND=1:1:NOUT S NLINES=NLINES+1,TEXT(NLINES)=TEXTOUT(JND)
 Q
 ;
 ;======================================================
ISHIST(VIEN) ;Return true if the encounter was historical.
 I $P($G(^AUPNVSIT(VIEN,0)),U,7)="E" Q 1
 Q 0
 ;
