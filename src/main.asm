jmp main

Letter: var #1 ; Aloca espaço para uma letra (Input Purposes)
Word: var #20 ; Aloca espaço para a palavra (19 chars e um '\0')
WordSize: var #1 ; Aloca espaço para o tamanho da palavra
;TryList: var #26 ; Aloca espaço para as letras que o usuário já tentou
MaxError: var #1 ; Aloca espaço para o número máximo de erros (constante)

; Atribuindo 6 para o erro máximo
loadn r0, #6
store MaxError, r0

; Mensagem para o usuário
TypeInAWord: string "Escreva uma palavra e pressione ENTER:"
TryList: string "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
AuxList1: string "  A B C D E F G H I J K L M  0 1 2 3 4  " ; 1040
AuxList2: string "  N O P Q R S T U V W X Y Z  5 6 7 8 9  " ; 1120
DeuBom: string "Deu bom!"
GameOver: string "Dead!"; Tela inteira 30x40
; Interface
Screen_1_Line0 : string " ______________________________________ " ; 0
Screen_1_Line1 : string "|                                      |" ; 40
Screen_1_Line2 : string "|                                      |" ; 80
Screen_1_Line3 : string "|                                      |" ; 120
Screen_1_Line4 : string "|                                      |" ; 160
Screen_1_Line5 : string "|                                      |" ; 200
Screen_1_Line6 : string "|                                      |" ; 240
Screen_1_Line7 : string "|                                      |" ; 280
Screen_1_Line8 : string "|                                      |" ; 320
Screen_1_Line9 : string "|                                      |" ; 360
Screen_1_Line10: string "|                                      |" ; 400
Screen_1_Line11: string "|                                      |" ; 440
Screen_1_Line12: string "|                                      |" ; 480
Screen_1_Line13: string "|                                      |" ; 520
Screen_1_Line14: string "|                                      |" ; 560
Screen_1_Line15: string "|                                      |" ; 600
Screen_1_Line16: string "|                                      |" ; 640
Screen_1_Line17: string "|                                      |" ; 680
Screen_1_Line18: string "|                                      |" ; 720
Screen_1_Line19: string "|                                      |" ; 760
Screen_1_Line20: string "|______________________________________|" ; 800
Screen_1_Line21: string "                                        " ; 840
Screen_1_Line22: string "                                        " ; 880
Screen_1_Line23: string "                                        " ; 920
Screen_1_Line24: string " ______________________________________ " ; 960
Screen_1_Line25: string "|                                      |" ; 1000
Screen_1_Line26: string "|                                      |" ; 1040
Screen_1_Line27: string "|                                      |" ; 1080
Screen_1_Line28: string "|                                      |" ; 1120
Screen_1_Line29: string "|______________________________________|" ; 1160

; Forca inicial
Screen_2_Line0 : string "                                        "
Screen_2_Line1 : string "                                        "
Screen_2_Line2 : string "                                        "
Screen_2_Line3 : string "   ______________________               "
Screen_2_Line4 : string "   HH####################               "
Screen_2_Line5 : string "   HH                                   "
Screen_2_Line6 : string "   HH                                   "
Screen_2_Line7 : string "   HH                                   "
Screen_2_Line8 : string "   HH                                   "
Screen_2_Line9 : string "   HH                                   "
Screen_2_Line10: string "   HH                                   "
Screen_2_Line11: string "   HH                                   "
Screen_2_Line12: string "   HH                                   "
Screen_2_Line13: string "   HH____________________________       "
Screen_2_Line14: string "   HH#######0          0#########       "
Screen_2_Line15: string "   HH\\\\  //HH          HH\\\\  //HH       "
Screen_2_Line16: string "   HH \\\\// HH          HH \\\\// HH       "
Screen_2_Line17: string "   HH  HH  HH          HH  HH  HH       "
Screen_2_Line18: string "   HH //\\\\ HH          HH //\\\\ HH       "
Screen_2_Line19: string "   HH//  \\\\HH          HH//  \\\\HH       "
Screen_2_Line21: string "                                        "
Screen_2_Line20: string "                                        "
Screen_2_Line22: string "                                        "
Screen_2_Line23: string "                                        "
Screen_2_Line24: string "                                        "
Screen_2_Line25: string "                                        "
Screen_2_Line26: string "                                        "
Screen_2_Line27: string "                                        "
Screen_2_Line28: string "                                        "
Screen_2_Line29: string "                                        "
; Forca inteira aberta
Screen_3_Line0 : string "                                        "
Screen_3_Line1 : string "                                        "
Screen_3_Line2 : string "                                        "
Screen_3_Line3 : string "   ______________________               "
Screen_3_Line4 : string "   HH####################               "
Screen_3_Line5 : string "   HH                                   "
Screen_3_Line6 : string "   HH                                   "
Screen_3_Line7 : string "   HH                                   "
Screen_3_Line8 : string "   HH                                   "
Screen_3_Line9 : string "   HH                                   "
Screen_3_Line10: string "   HH                                   "
Screen_3_Line11: string "   HH                                   "
Screen_3_Line12: string "   HH                                   "
Screen_3_Line13: string "   HH________          __________       "
Screen_3_Line14: string "   HH#######0|        |0#########       "
Screen_3_Line15: string "   HH\\\\  //HH|        |HH\\\\  //HH       "
Screen_3_Line16: string "   HH \\\\// HH|        |HH \\\\// HH       "
Screen_3_Line17: string "   HH  HH  HH|        |HH  HH  HH       "
Screen_3_Line18: string "   HH //\\\\ HH|        |HH //\\\\ HH       "
Screen_3_Line19: string "   HH//  \\\\HH          HH//  \\\\HH       "
Screen_3_Line21: string "                                        "
Screen_3_Line20: string "                                        "
Screen_3_Line22: string "                                        "
Screen_3_Line23: string "                                        "
Screen_3_Line24: string "                                        "
Screen_3_Line25: string "                                        "
Screen_3_Line26: string "                                        "
Screen_3_Line27: string "                                        "
Screen_3_Line28: string "                                        "
Screen_3_Line29: string "                                        "
; pessoa nao enforcada
Screen_4_Line0 : string "                                        "
Screen_4_Line1 : string "                                        "
Screen_4_Line2 : string "                                        "
Screen_4_Line3 : string "                                        "
Screen_4_Line4 : string "                                        "
Screen_4_Line5 : string "                 (                      "
Screen_4_Line6 : string "                 )                      "
Screen_4_Line7 : string "                 (                      "
Screen_4_Line8 : string "                 )                      "
Screen_4_Line9 : string "                                        "
Screen_4_Line10: string "                                        "
Screen_4_Line11: string "                                        "
Screen_4_Line12: string "                                        "
Screen_4_Line13: string "                                        "
Screen_4_Line14: string "                                        "
Screen_4_Line15: string "                                        "
Screen_4_Line16: string "                                        "
Screen_4_Line17: string "                                        "
Screen_4_Line18: string "                                        "
Screen_4_Line19: string "                                        "
Screen_4_Line20: string "                                        "
Screen_4_Line21: string "                                        "
Screen_4_Line22: string "                                        "
Screen_4_Line23: string "                                        "
Screen_4_Line24: string "                                        "
Screen_4_Line25: string "                                        "
Screen_4_Line26: string "                                        "
Screen_4_Line27: string "                                        "
Screen_4_Line28: string "                                        "
Screen_4_Line29: string "                                        "

; pessoa
Screen_5_Line0 : string "                                        "
Screen_5_Line1 : string "                                        "
Screen_5_Line2 : string "                                        "
Screen_5_Line3 : string "                                        "
Screen_5_Line4 : string "                                        "
Screen_5_Line5 : string "                                        "
Screen_5_Line6 : string "                                        "
Screen_5_Line7 : string "                                        "
Screen_5_Line8 : string "                                        "
Screen_5_Line9 : string "                ( )                     "
Screen_5_Line10: string "                                        "
Screen_5_Line11: string "                                        "
Screen_5_Line12: string "                                        "
Screen_5_Line13: string "                                        "
Screen_5_Line14: string "                                        "
Screen_5_Line15: string "                                        "
Screen_5_Line16: string "                                        "
Screen_5_Line17: string "                                        "
Screen_5_Line18: string "                                        "
Screen_5_Line19: string "                                        "
Screen_5_Line20: string "                                        "
Screen_5_Line21: string "                                        "
Screen_5_Line22: string "                                        "
Screen_5_Line23: string "                                        "
Screen_5_Line24: string "                                        "
Screen_5_Line25: string "                                        "
Screen_5_Line26: string "                                        "
Screen_5_Line27: string "                                        "
Screen_5_Line28: string "                                        "
Screen_5_Line29: string "                                        "

; pessoa
Screen_6_Line0 : string "                                        "
Screen_6_Line1 : string "                                        "
Screen_6_Line2 : string "                                        "
Screen_6_Line3 : string "                                        "
Screen_6_Line4 : string "                                        "
Screen_3_Line5 : string "                                        "
Screen_6_Line6 : string "                                        "
Screen_6_Line7 : string "                                        "
Screen_6_Line8 : string "                                        "
Screen_6_Line9 : string "                ( )                     "
Screen_6_Line10: string "                 W                      "
Screen_6_Line11: string "                 A                      "
Screen_6_Line12: string "                                        "
Screen_6_Line13: string "                                        "
Screen_6_Line14: string "                                        "
Screen_6_Line15: string "                                        "
Screen_6_Line16: string "                                        "
Screen_6_Line17: string "                                        "
Screen_6_Line18: string "                                        "
Screen_6_Line19: string "                                        "
Screen_6_Line20: string "                                        "
Screen_6_Line21: string "                                        "
Screen_6_Line22: string "                                        "
Screen_6_Line23: string "                                        "
Screen_6_Line24: string "                                        "
Screen_6_Line25: string "                                        "
Screen_6_Line26: string "                                        "
Screen_6_Line27: string "                                        "
Screen_6_Line28: string "                                        "
Screen_6_Line29: string "                                        "

; pessoa
Screen_7_Line0 : string "                                        "
Screen_7_Line1 : string "                                        "
Screen_7_Line2 : string "                                        "
Screen_7_Line3 : string "                                        "
Screen_7_Line4 : string "                                        "
Screen_7_Line5 : string "                                        "
Screen_7_Line6 : string "                                        "
Screen_7_Line7 : string "                                        "
Screen_7_Line8 : string "                                        "
Screen_7_Line9 : string "                ( )                     "
Screen_7_Line10: string "                 W                      "
Screen_7_Line11: string "                 A                      "
Screen_7_Line12: string "                  \\                     "
Screen_7_Line13: string "                   L                    "
Screen_7_Line14: string "                                        "
Screen_7_Line15: string "                                        "
Screen_7_Line16: string "                                        "
Screen_7_Line17: string "                                        "
Screen_7_Line18: string "                                        "
Screen_7_Line19: string "                                        "
Screen_7_Line20: string "                                        "
Screen_7_Line21: string "                                        "
Screen_7_Line22: string "                                        "
Screen_7_Line23: string "                                        "
Screen_7_Line24: string "                                        "
Screen_7_Line25: string "                                        "
Screen_7_Line26: string "                                        "
Screen_7_Line27: string "                                        "
Screen_7_Line28: string "                                        "
Screen_7_Line29: string "                                        "

; pessoa
Screen_8_Line0 : string "                                        "
Screen_8_Line1 : string "                                        "
Screen_8_Line2 : string "                                        "
Screen_8_Line3 : string "                                        "
Screen_8_Line4 : string "                                        "
Screen_8_Line5 : string "                                        "
Screen_8_Line6 : string "                                        "
Screen_8_Line7 : string "                                        "
Screen_8_Line8 : string "                                        "
Screen_8_Line9 : string "                ( )                     "
Screen_8_Line10: string "                 W                      "
Screen_8_Line11: string "                 A                      "
Screen_8_Line12: string "                / \\                     "
Screen_8_Line13: string "               J   L                    "
Screen_8_Line14: string "                                        "
Screen_8_Line15: string "                                        "
Screen_8_Line16: string "                                        "
Screen_8_Line17: string "                                        "
Screen_8_Line18: string "                                        "
Screen_8_Line19: string "                                        "
Screen_8_Line20: string "                                        "
Screen_8_Line21: string "                                        "
Screen_8_Line22: string "                                        "
Screen_8_Line23: string "                                        "
Screen_8_Line24: string "                                        "
Screen_8_Line25: string "                                        "
Screen_8_Line26: string "                                        "
Screen_8_Line27: string "                                        "
Screen_8_Line28: string "                                        "
Screen_8_Line29: string "                                        "

; pessoa
Screen_9_Line0 : string "                                        "
Screen_9_Line1 : string "                                        "
Screen_9_Line2 : string "                                        "
Screen_9_Line3 : string "                                        "
Screen_9_Line4 : string "                                        "
Screen_9_Line5 : string "                                        "
Screen_9_Line6 : string "                                        "
Screen_9_Line7 : string "                                        "
Screen_9_Line8 : string "                                        "
Screen_9_Line9 : string "                ( )                     "
Screen_9_Line10: string "                 W\\                     "
Screen_9_Line11: string "                 A                      "
Screen_9_Line12: string "                / \\                     "
Screen_9_Line13: string "               J   L                    "
Screen_9_Line14: string "                                        "
Screen_9_Line15: string "                                        "
Screen_9_Line16: string "                                        "
Screen_9_Line17: string "                                        "
Screen_9_Line18: string "                                        "
Screen_9_Line19: string "                                        "
Screen_9_Line20: string "                                        "
Screen_9_Line21: string "                                        "
Screen_9_Line22: string "                                        "
Screen_9_Line23: string "                                        "
Screen_9_Line24: string "                                        "
Screen_9_Line25: string "                                        "
Screen_9_Line26: string "                                        "
Screen_9_Line27: string "                                        "
Screen_9_Line28: string "                                        "
Screen_9_Line29: string "                                        "

; pessoa
Screen_10_Line0 : string "                                        "
Screen_10_Line1 : string "                                        "
Screen_10_Line2 : string "                                        "
Screen_10_Line3 : string "                                        "
Screen_10_Line4 : string "                                        "
Screen_10_Line5 : string "                                        "
Screen_10_Line6 : string "                                        "
Screen_10_Line7 : string "                                        "
Screen_10_Line8 : string "                                        "
Screen_10_Line9 : string "                ( )                     "
Screen_10_Line10: string "                /W\\                     "
Screen_10_Line11: string "                 A                      "
Screen_10_Line12: string "                / \\                     "
Screen_10_Line13: string "               J   L                    "
Screen_10_Line14: string "                                        "
Screen_10_Line15: string "                                        "
Screen_10_Line16: string "                                        "
Screen_10_Line17: string "                                        "
Screen_10_Line18: string "                                        "
Screen_10_Line19: string "                                        "
Screen_10_Line20: string "                                        "
Screen_10_Line21: string "                                        "
Screen_10_Line22: string "                                        "
Screen_10_Line23: string "                                        "
Screen_10_Line24: string "                                        "
Screen_10_Line25: string "                                        "
Screen_10_Line26: string "                                        "
Screen_10_Line27: string "                                        "
Screen_10_Line28: string "                                        "
Screen_10_Line29: string "                                        "

; pessoa enforcada
Screen_11_Line0 : string "                                        "
Screen_11_Line1 : string "                                        "
Screen_11_Line2 : string "                                        "
Screen_11_Line3 : string "                                        "
Screen_11_Line4 : string "                                        "
Screen_11_Line5 : string "                                        "
Screen_11_Line6 : string "                                        "
Screen_11_Line7 : string "                                        "
Screen_11_Line8 : string "                                        "
Screen_11_Line9 : string "                                        "
Screen_11_Line10: string "                                        "
Screen_11_Line11: string "                                        "
Screen_11_Line12: string "                ( )                     "
Screen_11_Line13: string "                /W\\                     "
Screen_11_Line14: string "                 A                      "
Screen_11_Line15: string "                / \\                     "
Screen_11_Line16: string "               J   L                    "
Screen_11_Line17: string "                                        "
Screen_11_Line18: string "                                        "
Screen_11_Line19: string "                                        "
Screen_11_Line20: string "                                        "
Screen_11_Line21: string "                                        "
Screen_11_Line22: string "                                        "
Screen_11_Line23: string "                                        "
Screen_11_Line24: string "                                        "
Screen_11_Line25: string "                                        "
Screen_11_Line26: string "                                        "
Screen_11_Line27: string "                                        "
Screen_11_Line28: string "                                        "
Screen_11_Line29: string "                                        "

; fogo
Screen_12_Line0 : string "                                        "
Screen_12_Line1 : string "                                        "
Screen_12_Line2 : string "                                        "
Screen_12_Line3 : string "                                        "
Screen_12_Line4 : string "                                        "
Screen_12_Line5 : string "                                        "
Screen_12_Line6 : string "                                        "
Screen_12_Line7 : string "                                        "
Screen_12_Line8 : string "                                        "
Screen_12_Line9 : string "                                        "
Screen_12_Line10: string "                                        "
Screen_12_Line11: string "                                        "
Screen_12_Line12: string "                                        "
Screen_12_Line13: string "                                        "
Screen_12_Line14: string "                                        "
Screen_12_Line15: string "                                        "
Screen_12_Line16: string "                                        "
Screen_12_Line17: string "                 A                      "
Screen_12_Line18: string "              /\\/A\\A                    "
Screen_12_Line19: string "              A/AXHX\\A                  "
Screen_12_Line21: string "                                        "
Screen_12_Line20: string "                                        "
Screen_12_Line22: string "                                        "
Screen_12_Line23: string "                                        "
Screen_12_Line24: string "                                        "
Screen_12_Line25: string "                                        "
Screen_12_Line26: string "                                        "
Screen_12_Line27: string "                                        "
Screen_12_Line28: string "                                        "
Screen_12_Line29: string "                                        "

Screen_13_Line0 : string "                                        "
Screen_13_Line1 : string "                                        "
Screen_13_Line2 : string "                                        "
Screen_13_Line3 : string "                                        "
Screen_13_Line4 : string "                                        "
Screen_13_Line5 : string "                 (                      "
Screen_13_Line6 : string "                 )                      "
Screen_13_Line7 : string "                 (                      "
Screen_13_Line8 : string "                 (                      "
Screen_13_Line9 : string "                 )                      "
Screen_13_Line10: string "                 (                      "
Screen_13_Line11: string "                 )                      "
Screen_13_Line12: string "                                        "
Screen_13_Line13: string "                                        "
Screen_13_Line14: string "                                        "
Screen_13_Line15: string "                                        "
Screen_13_Line16: string "                                        "
Screen_13_Line17: string "                                        "
Screen_13_Line18: string "                                        "
Screen_13_Line19: string "                                        "
Screen_13_Line21: string "                                        "
Screen_13_Line20: string "                                        "
Screen_13_Line22: string "                                        "
Screen_13_Line23: string "                                        "
Screen_13_Line24: string "                                        "
Screen_13_Line25: string "                                        "
Screen_13_Line26: string "                                        "
Screen_13_Line27: string "                                        "
Screen_13_Line28: string "                                        "
Screen_13_Line29: string "                                        "; Prints the entire Screen
; r1 should contain last string's address
; r2 should contain a color code
; r6 should contain the character to be skipped
PrintScreen:
    push fr
    push r0
    push r1
    push r2
    push r3
    push r4
    push r5
    push r6

    loadn r0, #1200 ; Initial screen position
    loadn r3, #40 ; Screen position decrement
    loadn r4, #41 ; Address decrement

    add r1, r1, r4 ; Initializing r1

    PrintScreen_Loop:
        sub r1, r1, r4 ; Dec Address
        sub r0, r0, r3 ; Dec Screen Positon
        call PrintString
    jnz PrintScreen_Loop

    pop r6
    pop r5
    pop r4
    pop r3
    pop r2
    pop r1
    pop r0
    pop fr

    rts

; Erases the entire Screen
EraseScreen:
    push fr
    push r0
    push r1

    loadn r0, #1200
    loadn r1, #' '

    EraseScreen_Loop:
        dec r0
        outchar r1, r0
    jnz EraseScreen_Loop

    pop r1
    pop r0
    pop fr
    rts

; r0 should contain the Screen Position
; r1 should contain the String Address
; r2 should contain a color
; r6 should contain the character to be skipped
PrintString:
    push fr
    push r0
    push r1
    push r2
    push r3
    push r4
    
    loadn r3, #'\0' ; Definindo terminador
    loadi r4, r1 ; Carregando um caractere da string para a r4
    cmp r4, r3 ; Comparando com o '\0'
    jeq PrintString_EndIf1
        PrintString_Loop:
            cmp r4, r6 ; Comparando com o caractere a ser pulado
            jeq PrintString_EndIf2
                add r4, r2, r4 ; Adicionando cor ao caractere
                outchar r4, r0 ; Imprimindo o caractere
            PrintString_EndIf2:
            inc r0 ; Inc Screen Position
            inc r1 ; Inc String Address
            loadi r4, r1 ; Carregando um caractere da string para a r4
            cmp r4, r3 ; Comparando com o '\0'
        jne PrintString_Loop
    PrintString_EndIf1:

    pop r4
    pop r3
    pop r2
    pop r1
    pop r0
    pop fr

    rts

Delay:
    push fr
    push r0
    push r1

    loadn r0, #1000

    Delay_Loop1:
        loadn r1, #1000

        Delay_Loop2:
            dec r1
        jnz Delay_Loop2

        dec r0
    jnz Delay_Loop1

    pop r1
    pop r0
    pop fr

    rts

GetChar:
    push fr
    push r0
    push r1
    push r2

    loadn r1, #255
    loadn r2, #0

    ; Esperando apertar a tecla
    GetChar_Loop1:
        inchar r0
        cmp r0, r2
        jeq GetChar_Loop1
        cmp r0, r1
        jeq GetChar_Loop1

    store Letter, r0 ; Gravando a letra lida na memória

    ; Esperando soltar a tecla
    GetChar_Loop2:
        inchar r0
        cmp r0, r1
        jne GetChar_Loop2

    pop r2
    pop r1
    pop r0
    pop fr
    rts

ScanString:
    push fr
    push r0
    push r1
    push r2
    push r3
    push r4
    push r5

    loadn r1, #13 ; Colocando o '\n' no r1 (13 == '\n')
    loadn r2, #0 ; int i
    loadn r3, #Word ; Endereço da palavra
    loadn r5, #19 ; Tamanho máximo da palavra

    ScanString_Loop:
        call GetChar
        load r0, Letter ; Carregando r0 com a letra

        cmp r0, r1 ; Se for enter
        jeq ScanString_End

        add r4, r3, r2 ; r4 = r3 + i, tal que r4 é o endereço da string
        storei r4, r0 ; String[r4] = r0
        inc r2 ; i++
        store WordSize, r2 ; Atualiza o tamanho da palavra

        cmp r2, r5 ; verifica se r2 = 40
        jne ScanString_Loop

    ScanString_End:

    ; Colocando o '\0'
    loadn r0, #'\0' 
    add r4, r3, r2
    storei r4, r0

    pop r5
    pop r4
    pop r3
    pop r2
    pop r1
    pop r0
    pop fr

    rts
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

    loadn r0, #1040 ; Screen Position
    loadn r1, #AuxList1 ; String Address
    loadn r3, #'\0' ; Terminador
    load r5, Letter ; Letra inserida

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