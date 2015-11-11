TITLE   8086 Code Template (for EXE file)

;       AUTHOR          emu8086
;       DATE            ?
;       VERSION         1.00
;       FILE            ?.ASM

; 8086 Code Template

; Directive to make EXE output:
       #MAKE_EXE#

DSEG    SEGMENT 'DATA'

; TODO: add your data here!!!!


A DB 2,5,1,7,3,6,9,4,0



DSEG    ENDS

SSEG    SEGMENT STACK   'STACK'
        DW      100h    DUP(?)
SSEG    ENDS

CSEG    SEGMENT 'CODE'

;*******************************************

START   PROC    FAR

; Store return address to OS:
    PUSH    DS
    MOV     AX, 0
    PUSH    AX

; set segment registers:
    MOV     AX, DSEG
    MOV     DS, AX
    MOV     ES, AX


; TODO: add your code here!!!!

XOR CX, CX
XOR AX, AX

LEA SI, A


FOR_0:
	LODSB 
	CMP AX, 0
	JE SORT
	INC CX
	JMP FOR_0
	
SORT:
	XOR BX, BX
	XOR SI, SI
		

FOR_1:
	CMP SI, CX
	JE EXIT
	MOV AL, A[SI]
	FOR_2:
		CMP BX, CX
		JE INIT
		CMP AL, A[BX]
		JG SWAP
	CONTINUE:
		INC BX
		JMP FOR_2
		
		
SWAP:
	MOV AH, A[BX]
	MOV A[BX], AL
	MOV A[SI], AH
	MOV AL, AH
	
	JMP CONTINUE
		
		
		
INIT:
	INC SI
	MOV BX, SI 
	INC BX
	JMP FOR_1
	

EXIT:

; return to operating system:
    RET
START   ENDP

;*******************************************

CSEG    ENDS 

        END    START    ; set entry point.

