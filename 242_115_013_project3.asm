.MODEL SMALL
.STACK 100H
.DATA
applePrice DB  40
orangePrice DB 30
mangoPrice DB  60

appleQty DB  0
orangeQty DB 0
mangoQty DB  0

choice DB ?
d1 DB     ?
d2 DB     ?
d3 DB     ?

total DW 0

menu1 DB 0DH,0AH,"SHOP MENU$"
menu2 DB 0DH,0AH,"1. Apple$"
menu3 DB 0DH,0AH,"2. Orange$"
menu4 DB 0DH,0AH,"3. Mango$"
menu5 DB 0DH,0AH,"4. Checkout$"
menu6 DB 0DH,0AH,"5. Exit$"
menu7 DB 0DH,0AH,"Enter choice : $"

msgApple DB 0DH,0AH,"Apple Quantity : $"
msgOrange DB 0DH,0AH,"Orange Quantity : $"
msgMango DB 0DH,0AH,"Mango Quantity : $"
msgTotal DB 0DH,0AH,"Total Bill : $"
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
    MOV AH, 09H
    LEA DX, menu7
    INT 21H

    MOV AH, 01H
    INT 21H
    MOV choice, AL

    CMP choice, '1'
    JE BUY_APPLE    ; Jump to BUY_APPLE if the input is 1
    CMP choice, '2'
    JE BUY_ORANGE   ; Jump to BUY_ORANGE if the input is 2
    CMP choice, '3'
    JE BUY_MANGO    ; Jump to BUY_MANGO if the input is 2
    CMP choice, '4'
    JE CHECKOUT     ; Jump to CHECKOUT if the input is 4
    CMP choice, '5'
    JE EXIT_PROG    ; Jump to EXIT_PROGRAM if the input is 5
    JMP SHOWMENU    ; For the first print of show meny without any condition

BUY_APPLE:
    INC appleQty
    JMP SHOWMENU

BUY_ORANGE:
    INC orangeQty
    JMP SHOWMENU

BUY_MANGO:
    INC mangoQty
    JMP SHOWMENU

CHECKOUT:
    MOV AL, appleQty
    MOV BL, applePrice
    MUL BL
    MOV total, AX

    MOV AL, orangeQty
    MOV BL, orangePrice
    MUL BL
    ADD total, AX

    MOV AL, mangoQty
    MOV BL, mangoPrice
    MUL BL
    ADD total, AX

    MOV AH, 09H
    LEA DX, msgApple
    INT 21H
    MOV AL, appleQty
    MOV AH, 0
    MOV BL, 10
    DIV BL
    MOV d1, AL
    MOV d2, AH
    CMP d1, 0
    JE APRINT2
    MOV DL, d1
    ADD DL, '0'
    MOV AH, 02H
    INT 21H
APRINT2:
    MOV DL, d2
    ADD DL, '0'
    MOV AH, 02H
    INT 21H

    MOV AH, 09H
    LEA DX, msgOrange
    INT 21H
    MOV AL, orangeQty
    MOV AH, 0
    MOV BL, 10
    DIV BL
    MOV d1, AL
    MOV d2, AH
    CMP d1, 0
    JE OPRINT2
    MOV DL, d1
    ADD DL, '0'
    MOV AH, 02H
    INT 21H
OPRINT2:
    MOV DL, d2
    ADD DL, '0'
    MOV AH, 02H
    INT 21H

    MOV AH, 09H
    LEA DX, msgMango
    INT 21H
    MOV AL, mangoQty
    MOV AH, 0
    MOV BL, 10
    DIV BL
    MOV d1, AL
    MOV d2, AH
    CMP d1, 0
    JE MPRINT2
    MOV DL, d1
    ADD DL, '0'
    MOV AH, 02H
    INT 21H
MPRINT2:
    MOV DL, d2
    ADD DL, '0'
    MOV AH, 02H
    INT 21H

    MOV AH, 09H
    LEA DX, msgTotal
    INT 21H

    MOV AX, total
    MOV BL, 100
    DIV BL
    MOV d1, AL
    MOV AL, AH
    MOV AH, 0
    MOV BL, 10
    DIV BL
    MOV d2, AL
    MOV d3, AH

    CMP d1, 0
    JE TPRINT2
    MOV DL, d1
    ADD DL, '0'
    MOV AH, 02H
    INT 21H
TPRINT2:
    MOV DL, d2
    ADD DL, '0'
    MOV AH, 02H
    INT 21H
    MOV DL, d3
    ADD DL, '0'
    MOV AH, 02H
    INT 21H

    JMP SHOWMENU

EXIT_PROG:
    MOV AX, 4CH
    INT 21H
MAIN ENDP
END MAIN