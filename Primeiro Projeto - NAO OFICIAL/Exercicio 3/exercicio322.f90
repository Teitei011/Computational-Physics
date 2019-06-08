program questao
implicit none 

! Declarando as variaveis

integer :: i, j, k, n
real*8, external :: rkiss05

real*8 :: seed = 10
real*8 :: random

real*8 :: garbish, data,  linhas = 281896
real*8 :: somatoria, media, desvio, somatoria_desvio

real*8, dimension(5) :: vet_med, vet_des

print *, "                    QUESTAO 2"

!											QUESTAO 3.b												!

call kissinit(seed)


! O programa vai escolher de forma aleatoria uma linha que vai começar e ler até a 100 casa.
! Ele vai fazer isso 5 vezes para ver qual o desvio apresentado

! O programa vai funcionar da seguinte forma, primeiro ele vai sortear um numero aleatorio equivalente
!ao numero de linhas, depois ele vai percorrer até aquela casa. Depois disso ele vai pegar os 100 dados de
!amostras, calculando a media e o desvio padrao

open(314, file="to_compar.dat")
write(314, *) "Media: ", " Desvio: "
do j = 0, 5, 1
    open(1, file="votes.dat")
    ! Zerando os dados para as iteracoes

    somatoria_desvio = 0
    somatoria = 0

    random = rkiss05()
    random =  1 + floor((linhas - 100 )*random)  ! Ele tem o -100 pra nao ter que fazer um programa circular




    ! Chegando até a linha selecionada

    do n = 0, random, 1
        read(1, *) garbish  ! Just to get to the rigth line
    enddo

    ! Calculando a média 

    do i = 0, 100, 1
        read(1, *) data
        somatoria = somatoria + data
    enddo
    close(1)

    media = somatoria / 100

    ! Calculando o desvio padrao, para isso tenho que chegar na linha correta de novo
    open(1, file="votes.dat")

    do n = 0, random, 1
        read(1, *) garbish  ! Just to get to the rigth line
    enddo

     ! Agora calculando o desvio padrao

    do k = 0, 100, 1
        read(1, *) data
        somatoria_desvio = somatoria_desvio +  (data - media)**2
    enddo

    desvio = SQRT(somatoria_desvio / 99) ! 1 / (M - 1)

    ! Colocando no vetor para depois ser analisado
     
    write(314, *) media, "#", desvio
    print *, "Media: ", media, "Desvio", desvio
    close(1)
enddo

close(314)


stop
end program questao


