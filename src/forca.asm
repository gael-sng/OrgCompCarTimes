; ------- TABELA DE CORES -------
; Adicione ao caractere para imprimir com a cor correspondente

; 0 branco							0000 0000
; 256 marrom						0001 0000
; 512 verde							0010 0000
; 768 oliva							0011 0000
; 1024 azul marinho					0100 0000
; 1280 roxo							0101 0000
; 1536 teal							0110 0000
; 1792 prata						0111 0000
; 2048 cinza						1000 0000
; 2304 vermelho						1001 0000
; 2560 lima							1010 0000
; 2816 amarelo						1011 0000
; 3072 azul							1100 0000
; 3328 rosa							1101 0000
; 3584 aqua							1110 0000
; 3840 preto						1111 0000

; r0 should contain the Screen Position
PrintLines:
    push fr
    push r0
    push r1
    push r2
    push r3
    
    loadn r1, #2 ; Screen position inc
    load r2, WordSize ; Amount of chars to print
    loadn r3, #'_' ; Caractere a ser impresso

    PrintLines_Loop:
        outchar r3, r0 ; Imprimindo o caractere r3 na posição r0
        add r0, r0, r1 ; Incrementando a posição da tela 
        dec r2 ; Decrementando tamanho da palavra
    jnz PrintLines_Loop

    pop r3
    pop r2
    pop r1
    pop r0
    pop fr

    rts

; r0 should contain the Screen Position
; r4 should contain the WordSize
UpdateWord:
    push fr
    push r0
    push r1
    push r2
    push r3
    push r5
    push r6

    loadn r1, #Word ; Endereço da palavra
    ; r2 aux
    loadn r3, #'\0' ; Terminador
    ; r4 WordSize
    load r5, Letter ; Letra que o jogador inseriu
    loadn r6, #2 ; Incremento da posição da tela

    UpdateWord_Loop:
        loadi r2, r1 ; Carregando a letra indexada por r1 para r2
        cmp r5, r2 ; Comparando a letra inserida pelo usuário com a letra atual da palavra
        jne UpdateWord_EndIf
            outchar r2, r0 ; Imprimindo o caractere r2 na posição r0
            dec r4 ; Decrementando o contador de letras corretas
        UpdateWord_EndIf:
        inc r1 ; Incrementando o endereço da String
        add r0, r0, r6 ; Incrementando posição da tela
        cmp r3, r2 ; Comparando com o '\0'
    jne UpdateWord_Loop

    pop r6
    pop r5
    pop r3
    pop r2
    pop r1
    pop r0
    pop fr

    rts

; r2 should contain the color
UpdateTryList:
    push fr
    push r0
    push r1
    push r2
    push r3
    push r4
    push r5
    push r6
    push r7

    loadn r0, #1040 ; Screen Position
    loadn r1, #AuxList1 ; String Address
    loadn r3, #'\0' ; Terminador
    load r5, Letter ; Letra inserida
    loadn r7, #32 ; Dif entre maiúsculo e minúsculo
    sub r5, r5, r7

    UpdateTryList_Loop1:
        loadi r4, r1 ; Carregando a letra indexada por r1 para r4
        cmp r5, r4 ; Comparando a letra inserida pelo usuário com a letra atual da String
        jne UpdateTryList_EndIf1
            add r5, r5, r2 ; Adicionando cor
            outchar r5, r0 ; Imprimindo o caractere r2 na posição r0
        UpdateTryList_EndIf1:
        inc r1 ; Incrementando o endereço da String
        inc r0 ; Incrementando posição da tela
        cmp r4, r3 ; Comparando com o '\0'
    jne UpdateTryList_Loop1

    loadn r0, #1120 ; Screen Position
    loadn r1, #AuxList2 ; String Address
    loadn r3, #'\0' ; Terminador

    UpdateTryList_Loop2:
        loadi r4, r1 ; Carregando a letra indexada por r1 para r4
        cmp r5, r4 ; Comparando a letra inserida pelo usuário com a letra atual da String
        jne UpdateTryList_EndIf2
            add r5, r5, r2 ; Adicionando cor
            outchar r5, r0 ; Imprimindo o caractere r2 na posição r0
        UpdateTryList_EndIf2:
        inc r1 ; Incrementando o endereço da String
        inc r0 ; Incrementando posição da tela
        cmp r4, r3 ; Comparando com o '\0'
    jne UpdateTryList_Loop2

    pop r7
    pop r6
    pop r5
    pop r4
    pop r3
    pop r2
    pop r1
    pop r0
    pop fr

    rts

PrintError:
    push fr
    push r1
    push r2
    push r3
    push r6

    jnz Dead
        loadn r1, #Screen_10_Line29 ; String address
        loadn r2, #768 ; Color
        loadn r6, #' ' ; Character to be skipped
        call PrintScreen
    Dead:
    dec r3
    jnz FiveErrors_EndIf
        loadn r1, #Screen_9_Line29 ; String address
        loadn r2, #768 ; Color
        loadn r6, #' ' ; Character to be skipped
        call PrintScreen
    FiveErrors_EndIf:
    dec r3
    jnz FourErrors_EndIf
        loadn r1, #Screen_8_Line29 ; String address
        loadn r2, #768 ; Color
        loadn r6, #' ' ; Character to be skipped
        call PrintScreen
    FourErrors_EndIf:
    dec r3
    jnz ThreeErrors_EndIf
        loadn r1, #Screen_7_Line29 ; String address
        loadn r2, #768 ; Color
        loadn r6, #' ' ; Character to be skipped
        call PrintScreen
    ThreeErrors_EndIf:
    dec r3
    jnz TwoErrors_EndIf
        loadn r1, #Screen_6_Line29 ; String address
        loadn r2, #768 ; Color
        loadn r6, #' ' ; Character to be skipped
        call PrintScreen
    TwoErrors_EndIf:
    dec r3
    jnz OneError_EndIf
        loadn r1, #Screen_5_Line29 ; String address
        loadn r2, #768 ; Color
        loadn r6, #' ' ; Character to be skipped
        call PrintScreen
    OneError_EndIf:

    pop r6
    pop r3
    pop r2
    pop r1
    pop fr

    rts

main:
    call EraseScreen

    ; Mensagem para o usuário
    loadn r0, #40 ; Screen Position
    loadn r1, #TypeInAWord ; String address
    loadn r2, #0 ; Color
    loadn r6, #' ' ; Character to be skipped
    call PrintString

    ; Lendo a palavra
    call ScanString

    ; Limpando a tela
    call EraseScreen

    ; Imprimindo os '_'
    loadn r0, #921
    call PrintLines

    ; Imprimindo a tela do jogo
    loadn r1, #Screen_1_Line29 ; String address
    loadn r2, #0 ; Color
    loadn r6, #' ' ; Character to be skipped
    call PrintScreen

    ; Imprimindo a tela do jogo
    loadn r1, #Screen_2_Line29 ; String address
    loadn r2, #1024 ; Color
    loadn r6, #' ' ; Character to be skipped
    call PrintScreen

    ; Imprimindo a tela do jogo
    loadn r1, #Screen_4_Line29 ; String address
    loadn r2, #0 ; Color
    loadn r6, #' ' ; Character to be skipped
    call PrintScreen

    ; Imprimindo a tela do jogo
    loadn r1, #Screen_12_Line29 ; String address
    loadn r2, #2304 ; Color
    loadn r6, #' ' ; Character to be skipped
    call PrintScreen

    ; Imprimindo TryList
    loadn r0, #1040
    loadn r1, #AuxList1
    loadn r2, #0
    loadn r6, #' ' ; Character to be skipped
    call PrintString
    loadn r0, #1120
    loadn r1, #AuxList2
    loadn r2, #0
    loadn r6, #' ' ; Character to be skipped
    call PrintString

    ; Inicialização para o Loop principal do jogo
    loadn r0, #881 ; Posição que será impressa a palavra
    ;load r3, MaxError ; Erro máximo
    loadn r3, #6
    load r4, WordSize ; Tamanho da palavra
    loadn r7, #0 ; 0 auxiliar

    Forca_Loop:
        call GetChar

        mov r6, r4 ; Copiando WordSize para r6

        call UpdateWord

        loadn r2, #512 ; Green

        cmp r4, r6 ; Comparando novo WordSize com o antigo
        jne Forca_EndIf ; Errou
            loadn r2, #2304 ; Red
            dec r3 ; Decrementando MaxError

            call PrintError

            jnz Forca_EndIf
            ; Seg fault
            jmp Dead2 ; Dead - Game Over
        Forca_EndIf:

        call UpdateTryList

        cmp r4, r7  
    jne Forca_Loop

    loadn r0, #614 ; Position
    loadn r1, #DeuBom ; String
    loadn r2, #512 ; Color
    loadn r6, #' ' ; Character to be skipped
    call PrintString

    jmp End

    Dead2:
    ;loadn r0, #575 ; Position
    ;loadn r1, #GameOver ; String
    ;loadn r2, #2304 ; Color
    ;loadn r6, #' ' ; Character to be skipped
    ;call PrintString

    call EraseScreen

    ; Imprimindo a forca
    loadn r1, #Screen_3_Line29 ; String address
    loadn r2, #1024 ; Color
    loadn r6, #' ' ; Character to be skipped
    call PrintScreen

    ; Imprimindo a corda esticada
    loadn r1, #Screen_13_Line29 ; String address
    loadn r2, #0 ; Color
    loadn r6, #' ' ; Character to be skipped
    call PrintScreen

    ; Imprimindo o fogo
    loadn r1, #Screen_12_Line29 ; String address
    loadn r2, #2304 ; Color
    loadn r6, #' ' ; Character to be skipped
    call PrintScreen

    ; Imprimindo o carinha
    loadn r1, #Screen_11_Line29 ; String address
    loadn r2, #768 ; Color
    loadn r6, #' ' ; Character to be skipped
    call PrintScreen

    End:
    
    halt