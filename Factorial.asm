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

	PUSH 5
	CALL FACT
	POP BX
	MUL BX
	

; return to operating system:
    RET
START   ENDP


FACT PROC 

	POP DX
	POP BX

	CMP BX, 1
	JE FIN
	PUSH BX
	PUSH DX

NEXT:	DEC BX
	PUSH BX
	CALL FACT
	
MULT:	POP BX
	MUL BX
	RET	



FACT ENDP

FIN:	MOV AX, 1
	RET
	




;*******************************************

CSEG    ENDS 

        END    START    ; set entry point.

