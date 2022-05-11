;-------------------Delivery project 1: Assignment 1-5 Gruppe 16----------------

;------------- ---- Assignment Part 5 ------------------------------

                   .ORIG x3000                    ; starting at address x3000

Loop               JSR readS
                      ; call function readS
                   JSR isPrime
                    ; call function isPrime
                    
                   JSR resultS
                    ; call function resultS
                    
                   BR Loop  
                   HALT

;----------------- Assignment Part 2---

readS              ST R7,RETURNreadS              ; Saves where readS should return in RETURN
                   LD R5, MULTI                   ; give number 9 to R5
                   LEA R0,Message                 ; Retrieves the address of the message to be written to R0
                   PUTS                           ; Prints the message string

                   GETC                           ; Receives a character in R0
                   OUT                            ; Prints draws again
             
                   LD  R4,fASCII                  ; Sets R4 to -48
                   ADD R0, R0, R4                 ; Subtracts 48 from input, to convert from ASCII to numbers
                   AND R4, R4, #0                 ; Sets R4 to 0
             
                   AND R1,R1,#0                   ; Set R1 til 0
  
                   ADD R1,R0,R1                   ; Set R0 til R1

                   ADD R2,R1,x0                   ; set R1 to R2
loopm              ADD R1,R1,R2                   ; set R1 og R2 i R1
                   ADD R5,R5,x-1                  ; minus 1 fra R5 
                   BRp loopm
             
                   GETC                           ; Receives a character in R0
                   OUT                            ; Prints draws again (echo)


                   LD  R4,fASCII                  ; Sets R4 to -48
                   ADD R0, R0, R4                 ; Subtracts 48 from input, to convert from ASCII to numbers
                   AND R4, R4, #0                 ; Sets R4 to 0

                   AND R2,R2,#0                   ; Set R2 til 0
                   ADD R2,R2,R0                   ; Set R2 til R1
                   ADD R0,R1,R2                   ; put the input til R0
                   LD R7,RETURNreadS              ; Sætter R7 tilbage til det readS skal returnere til
       
                   RET                            ; JMP R7; Returns
;________________________________________

;----------------- Assignment Part 3----

isPrime            ST R7,RETURNisPrime            ; Saves where isPrime should return in RETURN
                   AND R1,R1,#0                   ; clear R1
                   AND R2,R2,#0                   ; clear R2
                   LEA R1,PrimeNumber             ; get the address for first primeNumber in R1
loops              LDR R2,R1,#0                   ; get the value from R1 
                   BRz NOtprime                   ; check if the number in R2 is equal to 0, if it is not jump to NOtprime
            
                   NOT R2,R2                      ; make the value to negative value
                   ADD R2,R2,#1                   ; add 1 to R2
                   ADD R3,R2,R0                   ; put R2 and R0 in R3
                   BRz myPrime                    ; if =0 so skip over to myPrime, if not continue the code 
            
                   ADD R1,R1,#1                   ; go to the next number in our primeNumber
                   BR loops;                      ; go back to the loop

                   AND R0,R0,x0                   ; make R0 =0 

myPrime            AND R0,R0,#0         
                   ADD R0,R0,#1
                   LD R7,RETURNisPrime            ; Sætter R7 tilbage til det isPrime skal returnere til
                   RET                            ; JMP R7; Returns

NOtprime           AND R0,R0,#0
                   ADD R0,R0,#0
                   LD R7,RETURNisPrime            ; Sætter R7 tilbage til det isPrime skal returnere til
                   RET                            ; JMP R7; Returns


;_____________________________________
;--------- --------Assignment Part 4------


resultS             ST R7,RETURNresultS            ; Saves where resultS should return in RETURN RETURNresultS   
                    ADD R1,R0,#0                   ; copy R0 
                    BRp  printPrime                ;

                    LEA R0,MSGNotPrime             ; Retrieves the address of the message to be written to R0
                    PUTS                           ; Prints the message string
                    LD R7,RETURNresultS            ; Sætter R7 tilbage til det resultS skal returnere til
                    RET ;

            
printPrime          LEA R0,MSGPrime                ; Retrieves the address of the message to be written to R0
                    PUTS                           ; Prints the message string
                    LD R7,RETURNresultS            ; Sets R7 back to the resultS should return to
                    RET                            ; JMP R7; Returns 



;_________________________________________
;----------------- Variables ----------------

RETURNreadS        .BLKW #1                        ; Saves the address to which the readS   must return when it is finished.
RETURNisPrime      .BLKW #1                        ; Saves the address to which the isPrime must return when it is finished.

RETURNresultS      .BLKW #1                        ; Saves the address to which the resultS must return when it is finished.



PrimeNumber        .FILL #2                        ; place prime values at code lines
                   .FILL #3
                   .FILL #5
                   .FILL #7
                   .FILL #11
                   .FILL #13
                   .FILL #17
                   .FILL #23
                   .FILL #29
                   .FILL #31
                   .FILL #37
                   .FILL #41
                   .FILL #43
                   .FILL #47
                   .FILL #53
                   .FILL #59
                   .FILL #61
                   .FILL #67
                   .FILL #71
                   .FILL #73
                   .FILL #79
                   .FILL #83
                   .FILL #89
                   .FILL #97

                       
             
Message            .STRINGZ "Write a 2 digit decimal number: " 
fASCII             .FILL #-48
MULTI              .FILL #9
MSGPrime           .STRINGZ "\nthe number is prime.     \n "
MSGNotPrime        .STRINGZ "\nthe number is not prime. \n "

 
                   .END

;----------------  THE END -------------------------------------------------