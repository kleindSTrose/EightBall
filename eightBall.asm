; Dan Klein
; Magic 8 ball emulator
; Calling a subroutine in 64-bit mode    (eightBall.asm)

 ;Irvine64 Prototypes
 ReadInt64 proto
 ExitProcess proto
 WriteString proto
 Crlf proto
 Random64 proto
 Randomize proto
 ReadString proto



 ;Add appropriate prompts:
.data
	prompt1 byte  "Pick your lucky number:  ", 0
	prompt2 byte  "What is your question?  ", 0
	prompt3 byte  "Magic 8 Ball says:  ", 0
	keyVal QWORD ?
	msg1  byte "Nope.",0
	msg2 byte "Reply hazy, try again",0
	msg3 byte "Very doubtful", 0
	msg4 byte "The odds are in your favor",0
	msg5 byte "When pigs fly",0
.code
 main PROC
	;Output message to ask for lucky number:
	mov RDX, offset prompt1					;rdx=&prompt1
	call WriteString						;cout<<rdx
	call Crlf								;cout<<endl

	; Determine random number:
	mov rax, 0								;rax=0
	call Randomize
	call Random64

	; Convert number to the appropriate range:
	mov rbx, 5								;rbx=5
	mov rdx, 0								;rdx-=0

	div rbx									;rdx:rax=rax/rbx
	mov keyVal, rdx


	;Output message to ask for question:
	mov rdx, offset prompt2					;rdx=&prompt2
	call WriteString						;cout<<rdx
	call Crlf								;cout<<endl
	;Output message to to answer question:
	mov rdx, offset prompt3					;rdx=&prompt3
	call WriteString						;cout<<rdx


	;Determine result:

	cmp keyVal, 0		
	jne ELSE1							;if(keyVal==0)
	mov rdx, offset msg1				;{rdx=&msg1
	jmp ENDIF1							;}
	ELSE1:								;else if(keyVal==1)
	cmp keyVal, 1						
	jne ELSE2
	mov rdx, offset msg2				;{rdx=&msg2
	jmp ENDIF1			
	ELSE2:								;else if(keyVal==2)
	cmp keyVal, 2
	jne ELSE3
	mov rdx, offset msg3				;{rdx=&msg3
	jmp ENDIF1
	ELSE3:								;else if(keyVal==3)
	cmp keyVal, 3						
	jne ELSE4	
	mov  rdx,offset msg4				;{rdx=&msg4
	jmp ENDIF1
	ELSE4:								;else{
	mov rdx, offset msg5				;rdx=msg5}
	ENDIF1:
	




	;Output the message
	call WriteString			;Output message
	call Crlf					;cout<<endl

 mov  ecx,0				; Process return code
 call    ExitProcess

main ENDP
END

comment $
Alex is so cool and totally not going to murder my pet goat in dnd. he is safe and his name is jasper
~~~~~~~~~~~~~~~~~~~~~~
Pick your lucky number:
What is your question?
Magic 8 Ball says:  Reply hazy, try again

Press any key to close this window . . .

Pick your lucky number:
What is your question?
Magic 8 Ball says:  Very doubtful

Press any key to close this window . . .

Pick your lucky number:
What is your question?
Magic 8 Ball says:  The odds are in your favor

Press any key to close this window . . .


Pick your lucky number:
What is your question?
Magic 8 Ball says:  Nope.

Press any key to close this window . . .

Pick your lucky number:
What is your question?
Magic 8 Ball says:  When pigs fly

Press any key to close this window . . .






$
