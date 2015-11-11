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

LEN DB 2
CAD DB 'AA'

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

	MOV SI,0
	LEA BX, CAD
	XOR AX, AX
	MOV AL, LEN
	DEC AL
	MOV DI, AX
	
	PUSH SI
	PUSH DI
	CALL PALINDROME




; return to operating system:
    RET
START   ENDP


PALINDROME PROC

	;POP DX
	;POP BP
	;POP BX
	PUSH BP
	MOV BP, SP
	MOV DI, [BP]+4
	MOV SI, [BP]+6
	CMP SI, DI
	JG FIN_1

	;PUSH BX
	;PUSH DX
	
NEXT:	MOV CH, [BX][SI]
	MOV CL, DS:[BX][DI]
	CMP CH, CL
	JNE FIN_2
	
	INC SI
	DEC DI
	PUSH SI
	PUSH DI
	CALL PALINDROME
	POP BP
	RET 4
	
	

PALINDROME ENDP


FIN_1:
	MOV AX, 1
	JMP CLEAR_STACK
	
FIN_2:
	XOR AX, AX
	;JMP CLEAR_STACK
	
CLEAR_STACK:
	;POP DX
	;POP BX
	;POP BX
	;PUSH DX
	POP BP
	RET 4


;*******************************************

CSEG    ENDS 

        END    START    ; set entry point.

