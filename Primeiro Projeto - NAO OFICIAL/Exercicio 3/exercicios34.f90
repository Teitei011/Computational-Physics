program desviosa
implicit none 
    
! Declarando as variaveis
integer :: i, j, k,  M = 10, data 
real*8 :: sm, desvio, somatorio_de_d
real*8 ::  medias, soma
real*8, dimension(5) :: vet_med, vet_desv
!                        COMO FUNCIONA

! O programa percorre o arquivo texto 4, cada vez com uma ordem de tamanho diferente.
! Toda vez que ele percorre o arquivo ele calcula a media e seu desvio padrao

! No final dele, ele vai fazer a comparacao entre os desvios padroes de cada magnitude


do i = 0, 4, 1   ! Desta forma ele vai percorrer a qtd de vezes para observar a diferença
    open(1, file="votes.dat")
    soma = 0
    do j = 0, M, 1
        read(1, *) data
        soma = soma + data
    enddo
    close(1)

    ! Agora calculamos a media
    medias = soma / M

    ! Calculando o desvio padrao
    open(2, file="votes.dat")
    somatorio_de_d = 0
    do k = 0, M, 1
        read(2, *) data 
        somatorio_de_d = somatorio_de_d +  (data - medias)**2 ! Calculando a parte da somatoria
	enddo

    desvio = SQRT(somatorio_de_d/(M - 1)) ! Parte final que envolve a raiz 

    ! Adicionando a media e o desvio para seus respectivos vetores
    vet_med(i + 1) = medias
    vet_desv(i + 1) = desvio

    close(2)
    M = M*10    ! Cada interação a ordem de magnitude aumenta em 10
enddo

	! Agora será feito a comparacao entre os desvios padroes

    ! Primeiro, só vou printar para poder ve-los melhor

    open(1, file="exercicio34.dat")
    write(1, *) "Comparacao entre a precisao do desvio padrao para cada magnitude"
    write(1, *) "Med: # # +/- # # Mag: #  "
    M = 10
    do i = 1, 5, 1
        print *, "Med: ", vet_med(i), "+/-", vet_desv(i), "Mag:", M, " "
        write(1, *)  vet_med(i), "$\pm$", vet_desv(i), "#", M, " "  ! Desta forma eu consigo colocar em um arquivo .csv com mais facilidade
        M = M*10
	enddo
    close(1)


    ! Agora será realizado as operações de comparacao em si
    open(1 , file="variacao_de_sm.dat")
    write(1, *) "Variacao de Sm para valores de magnitude"
    write(1, *) "S_m #  M # "
    M = 10

    do i = 1, 5, 1
        sm  = (vet_desv(i) / SQRT(REAL(M)) ) * 100
		write(1, *) sm, "#", M, " " 
		M = M *10
	enddo


stop
end program desviosa