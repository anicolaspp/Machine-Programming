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

NUM DW 3

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
XOR BX, BX
XOR CX, CX
XOR DX, DX

MOV DX, NUM
MOV CX, 2
MOV AX, 0
MOV BX, 1

FOR:
	CMP CX, DX
	JG EXIT
	MOV SI, AX
	ADD SI, BX
	MOV BX, AX
	MOV AX, SI
	INC CX
	JMP FOR
	

EXIT:


; return to operating system:
    RET
START   ENDP

;*******************************************

CSEG    ENDS 

        END    START    ; set entry point.

