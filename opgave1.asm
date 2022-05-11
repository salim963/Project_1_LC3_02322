.ORIG x3000                             ;Start from  the address x3000

                 LD R0,A                    ;Loads the value A in to R0
                 LD R1,B                    ;Loads the value B in to R1
             X  NOT R2,R0            ; Finds the inverse value of R0 and stores it in R2       (a)
                 ADD R2,R2,#1         ; add 1 to R2  and save it in R2                                   (b)
                 ADD R2,R2,R1         ; add R2 to R1 and stores in R2 R1)
                 BRz DONE               ; If the previous instruction gave 0: pass on to DONE (c)
                 ADD R1,R1,#-1        ; subtract 1 from B
                 ADD R0,R0,#1         ;   Add  1 to A                                                               (d)
                 BRnzp X              ; If the previous instruction gave something negative, 0 or positive: give to X
            DONE ST R1,C             ;Save the value in R1 in C
                 TRAP x25                 ;Stop the program
               A .BLKW 1                  ;Reserve 1 location in memory and call it
               B .BLKW 1                  ;Reserve 1 location in memory and call it
               C .BLKW 1                 ;Reserve 1 location in memory and call it
                 .END 

