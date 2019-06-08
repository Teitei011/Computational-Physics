    !Escreva um programa que imprima em um arquivo uma tabela com os fatoriais de todos os inteiros entre 1 e 20

      program fatorial
            implicit none

              !Declarando todas as variaveis

              !As primeiras sao do programa de repeticao 
            real :: i
            integer :: j
            integer :: n

            !Restante das declaracoes

            integer :: number
            real*8 :: result
            real*8, parameter :: PI = 3.141592653589793238462643383279502884197969399

            ! Declarando os vetores que estao guardando os dados para o calculo do ultimo resultado

            real*8, dimension(30) :: ln_de_n
            real*8, dimension(30) ::  S

              !Parte do programa que vai fazer somente um numero do fatorial, só para saber como eu estou entendendo o fortran 
            

            !                               EXERCICIO 1                             !


              ! Abrindo arquivo que será registrado
              open(12,file='fatorial.dat')      

              print *, "Fatorial usando n:"
              
              write(12, *) "Fatorial usando n:"
              do n=1, 30, 1 ! Percorrendo as 20 vezes
                  result = 1
                  do j=1, n, 1
                        result = result * j
                  end do
                        write(12,*) n, "#", result ! Tem o # só para facilitar a retirada de dados
                        print *, "Numero: ", n, "-->", result
            end do 

            !                               EXERCICIO 2                             !

            ! Calculo do logaritmo dos fatoriais

            print *, " "
            open(13, file='Logaritmo_dos_fatoriais.dat')
            print *, "Logaritmo dos fatoriais"
            write(13, *) "Logaritmo dos fatoriais: "
            write(13, *) " "

              do n=2, 30, 1 ! Percorrendo
                  result = 1
                  do j=1, n, 1
                        result = result * j
                  end do
                        result = LOG(result)  ! Aplicando o LOG
                        write(13,*)  n, ",", result
                        print *, "Numero: ", n, "-->", result
                        ln_de_n(n) = result ! Colocando os dados no vetor
            end do 


            !                               EXERCICIO 3                             !

            ! Agora com a aproximacao de Stirling

            print *, " "
            open(14, file='Aproximacao_de_Stirling.dat')
            print *, "Aproximacao_de_Stirling"
            write(14, *) "Aproximacao_de_Stirling: "
            write(14, *) " "

              do n=2, 30, 1 ! Calculando usando a aproximacao de Stirling
                 i = n 
                  result = i * LOG(i) - i + 0.5 * LOG(2*PI*i) ! Formula de Stirling

                  write(14,*) i, "#", result   ! Utilizando # como separador por preguiça
                  print *, "Numero: ", i, "-->", result
                  S(n) = result ! Colocando os dados em outro vetor

            end do 


            ! Nesta parte ele vai pegar os dados das simulações passadas e calcular seguindo esta equacao 
            ![ln n! − S] / ln n!

            open(15, file="Relacao_de_equivalencia.dat") 
            write(15, *) "Relacao de equivalencia: "
            write(15, *) " "
            print *, "" ! Pulando uma linha para ficar mais facil de visualizar
            print *, "Relacao de equivalencia: "
            ! Caculando a relacao de  [ln n! − S] / ln n!

            do n=1 , 30, 1              
              
              result = ( ln_de_n(n) - S(n))
                                          
              write(15, *)  n, "#", result  ! Estou usando # como separador para colocar na tabela de forma mais facil
              print *, "Numero: ", n, "-->", result
            end do


      end program fatorial
