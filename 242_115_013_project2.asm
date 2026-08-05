.MODEL SMALL
.STACK 100H
.DATA
num1 DB   8
num2 DB   3
result DB ?
d1 DB     ?
d2 DB     ?
choice DB ?

menu1  DB 0DH,0AH,"SIMPLE CALCULATOR$"
menu2  DB 0DH,0AH,"1. Addition$"
menu3  DB 0DH,0AH,"2. Subtraction$"
menu4  DB 0DH,0AH,"3. Multiplication$"
menu5  DB 0DH,0AH,"4. Exit$"
menu6  DB 0DH,0AH,"Enter choice : $"
resmsg DB 0DH,0AH,"Result : $"
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

SHOWMENU:
    MOV AH, 09H
    LEA DX, menu1
    INT 21H
    MOV AH, 09H
    LEA DX, menu2
    INT 21H
    MOV AH, 09H
    LEA DX, menu3
    INT 21H
    MOV AH, 09H
    LEA DX, menu4
    INT 21H
    MOV AH, 09H
    LEA DX, menu5
    INT 21H
    MOV AH, 09H
    LEA DX, menu6
    INT 21H

    MOV AH, 01H
    INT 21H
    MOV choice, AL

    CMP choice, '1'
    JE ADD_OP        ; Jump to ADD_OP if the input is 1
    CMP choice, '2'
    JE SUB_OP        ; Jump to SUB_OP if the input is 2
    CMP choice, '3'
    JE MUL_OP        ; Jump to MUL_OP if the input is 3
    CMP choice, '4'
    JE EXIT_PROG     ; If 1 is the input then exit the program
    JMP SHOWMENU     ; Show the menu for the first menu printing

ADD_OP:
    MOV AL, num1
    MOV BL, num2
    ADD AL, BL
    MOV result, AL
    JMP SHOWRESULT

SUB_OP:
    MOV AL, num1
    MOV BL, num2
    SUB AL, BL
    MOV result, AL
    JMP SHOWRESULT

MUL_OP:
    MOV AL, num1
    MOV BL, num2
    MUL BL
    MOV result, AL
    JMP SHOWRESULT

SHOWRESULT:
    MOV AH, 09H
    LEA DX, resmsg
    INT 21H

    MOV AL, result
    MOV AH, 0
    MOV BL, 10
    DIV BL
    MOV d1, AL
    MOV d2, AH

    CMP d1, 0
    JE ONEDIGIT

    MOV DL, d1
    ADD DL, '0'
    MOV AH, 02H
    INT 21H

ONEDIGIT:
    MOV DL, d2
    ADD DL, '0'
    MOV AH, 02H
    INT 21H

    JMP SHOWMENU

EXIT_PROG:
    MOV AX, 4CH
    INT 21H
MAIN ENDP
END MAIN