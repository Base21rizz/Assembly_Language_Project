.MODEL SMALL
.STACK 100H
.DATA
    math DB        78
    physics DB     82
    programming DB 91
    total DW        ?
    average DB      ?
    grade DB        ?
    h DB            ?
    t DB            ?
    o DB            ?
    at DB           ?
    ao DB           ?
    msg1 DB "Student Result$"
    msg2 DB 0DH,0AH,"Total Marks : $"
    msg3 DB 0DH,0AH,"Average : $"
    msg4 DB 0DH,0AH,"Grade : $"
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AL, math
    MOV AH, 0
    MOV BL, physics
    MOV BH, 0
    ADD AX, BX
    MOV BL, programming
    MOV BH, 0
    ADD AX, BX
    MOV total, AX

    MOV AX, total
    MOV BL, 3
    DIV BL
    MOV average, AL

    CMP average, 80
    JAE GRADE_A      ;Jump to GRADE_A if mark is above 80
    CMP average, 70
    JAE GRADE_B      ;Jump to GRADE_B if mark is above 70
    CMP average, 60
    JAE GRADE_C      ;Jump to GRADE_C if mark is above 60
    MOV grade, 'F'
    JMP SPLIT        ;Jump to SPLIT if mark is below 60

GRADE_A:
    MOV grade, 'A'
    JMP SPLIT

GRADE_B:
    MOV grade, 'B'
    JMP SPLIT

GRADE_C:
    MOV grade, 'C'

SPLIT:
    MOV AX, total
    MOV BL, 100
    DIV BL
    MOV h, AL
    MOV AL, AH
    MOV AH, 0
    MOV BL, 10
    DIV BL
    MOV t, AL
    MOV o, AH

    MOV AL, average
    MOV AH, 0
    MOV BL, 10
    DIV BL
    MOV at, AL
    MOV ao, AH

    MOV AH, 09H
    LEA DX, msg1
    INT 21H

    MOV AH, 09H
    LEA DX, msg2
    INT 21H

    MOV DL, h
    ADD DL, '0'
    MOV AH, 02H
    INT 21H

    MOV DL, t
    ADD DL, '0'
    MOV AH, 02H
    INT 21H

    MOV DL, o
    ADD DL, '0'
    MOV AH, 02H
    INT 21H

    MOV AH, 09H
    LEA DX, msg3
    INT 21H

    MOV DL, at
    ADD DL, '0'
    MOV AH, 02H
    INT 21H

    MOV DL, ao
    ADD DL, '0'
    MOV AH, 02H
    INT 21H

    MOV AH, 09H
    LEA DX, msg4
    INT 21H

    MOV DL, grade
    MOV AH, 02H
    INT 21H

    MOV AX, 4CH
    INT 21H
MAIN ENDP
END MAIN