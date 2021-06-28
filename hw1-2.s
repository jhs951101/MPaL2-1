        NAME    main
        
        PUBLIC  __iar_program_start
        
        SECTION .intvec : CODE (2)
        THUMB
        
__iar_program_start
        B       main

        
        SECTION .text : CODE (2)
        THUMB

xfunc:
        MULS R0, R1, R0
        BX LR
        
yfunc:
        PUSH {R7, LR}
        BL xfunc
        POP {R4, PC}

main:
        PUSH {R4, LR}
        MOVS R0, #2
        MOVS R4, #4
        MOVS R1, R4
        BL xfunc
        MOVS R1, R4
        BL yfunc
        MOVS R4, R0
        MOVS R0, #0
        POP {R1, PC}
        END
