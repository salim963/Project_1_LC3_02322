           .ORIG x3000

readS        LD R5, MULTI    ; give number 9 to R5
             LEA R0,Message  ; Retrieves the address of the message to be written to R0
             PUTS            ; Prints the message string

             GETC            ; Receives a character in R0
             OUT             ; Prints draws again
             ;
             
             LD  R4,fASCII   ; Sets R4 to -48
             ADD R0, R0, R4  ; Subtracts 48 from input, to convert from ASCII to numbers
             AND R4, R4, #0  ; Sets R4 to 0
             ;
        

             AND R1,R1,#0    ; Set R1 til 0

             ADD R1,R0,R1    ; Set R0 til R1
             

             ADD R2,R1,x0    ; set R1 til R2
loopm        ADD R1,R1,R2    ; set R1 og R2 i R1
             ADD R5,R5,x-1   ; minus 1 fra R5 
             BRp loopm

             
             GETC            ; Receives a character in R0
             OUT             ; Prints draws again (echo)


             LD  R4,fASCII   ; Sets R4 to -48
             ADD R0, R0, R4  ; Subtracts 48 from input, to convert from ASCII to numbers
             AND R4, R4, #0  ; Sets R4 to 0


             AND R2,R2,#0    ; Set R2 til 0

             ADD R2,R2,R0    ; Set R2 til R1
             
            

             ADD R0,R1,R2    ; put the input til R0
             

Message     .STRINGZ "write a 2 digit decimal number: " 
fASCII      .FILL #-48
MULTI       .FILL #9
            .END