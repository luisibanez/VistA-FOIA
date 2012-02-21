PXRM7API ;SLC/JVS Clinical Reminders HL7 API; 03/21/2002 ;4/11/02  15:26
 ;;2.0;CLINICAL REMINDERS;;Feb 04, 2005
 ;This is the beginning of the HL7 API's
 ;
 ;VARIABLE LIST
 ;IEN = IEN OF ENTRY IN EXTRACT FILE 810.3
 Q
 ;======================================================
HL7(IEN,SEE,ID) ;AllRequiredParameters
 ;IEN= The Ien of the entry in file 810.3 (Extract File)
 ;SEE=If you want to view the HL7 message, set to 1
 ;.ID= ID of the message.
 ;MODE=A or I A=from archive I=initial Load
 D EXTRACT^PXRM7XT(IEN,SEE,.ID)
 Q
 ;=======================================================
STATUS(ID) ;
 ;RETURNS THE STATUS OF THE MESSAGE
 ;ID= MESSAGE ID WHICH IS THE IEN IN FILE #772
 N IDD,STATUS,ID1,ID2
 S ID1=$O(^HL(772,"C",ID,0))
 S ID2=$O(^HL(772,"C",ID,ID1))
 D GETS^DIQ(772,ID2,20,"E","STATUS")
 S IDD=ID2_","
 S STATUS=$G(STATUS(772,IDD,20,"E"))
 Q STATUS
 ;======================================================
