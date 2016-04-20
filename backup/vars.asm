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
GameOver: string "Dead!"