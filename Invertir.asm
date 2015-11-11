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

CAD DB 1,2,3,4,5,6
LEN DB 6

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

LEA SI, CAD
LEA DI, CAD + LEN
DEC DI

FOR:
	CMP SI, DI
	JGE EXIT
SWAP:
	MOV AL, [SI]
	MOV BL, [DI]
	MOV [DI], AL
	MOV [SI], BL
	
	INC SI
	DEC DI
	
	JMP FOR
	

EXIT:


; return to operating system:
    RET
START   ENDP

;*******************************************

CSEG    ENDS 

        END    START    ; set entry point.

