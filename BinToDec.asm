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

DATA DB '11111111'
LE DB 8

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

XOR AX, AX
XOR SI, SI
XOR CX, CX
XOR BP, BP
XOR BX, BX

LEA SI, DATA
MOV CL, LE
MOV BX, 2

FOR_1:
	CMP CX, 1
	JE EXIT
	LODSB 
	SUB AX, '0'
	ADD AX, BP
	MUL BX
	MOV BP, AX
	XOR AX, AX
	DEC CX
	JMP FOR_1
	

EXIT:
LODSB
SUB AX, '0'
ADD BP, AX

; return to operating system:
    RET
START   ENDP

;*******************************************

CSEG    ENDS 

        END    START    ; set entry point.

