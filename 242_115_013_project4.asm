.MODEL SMALL
.STACK 100H
.DATA
password DB '7'
input    DB  ?
attempts DB  3

msg1 DB 0DH,0AH,"Enter Password: $"
msg2 DB 0DH,0AH,"Access Granted$"
msg3 DB 0DH,0AH,"Wrong Password$"
msg4 DB 0DH,0AH,"Attempts Left: $"
msg5 DB 0DH,0AH,"Access Denied$"
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

TRYAGAIN:
    MOV AH, 09H
    LEA DX, msg1
    INT 21H

    MOV AH, 01H
    INT 21H
    MOV input, AL

    CMP input, password
    JE CORRECT           ; If input is correct

    DEC attempts
    MOV AH, 09H
    LEA DX, msg3
    INT 21H

    CMP attempts, 0
    JE DENIED           ; If input is wrong

    MOV AH, 09H
    LEA DX, msg4
    INT 21H

    MOV DL, attempts
    ADD DL, '0'
    MOV AH, 02H
    INT 21H

    JMP TRYAGAIN       ; Try attemptin at password again

CORRECT:
    MOV AH, 09H
    LEA DX, msg2
    INT 21H
    JMP DONE

DENIED:
    MOV AH, 09H
    LEA DX, msg5
    INT 21H

    DONE:
    MOV AX, 4CH
    INT 21H
MAIN ENDP
END MAIN