program exercicio5
implicit none

! Declaracao de variaveis

! Variaveis que serão coletadas pelo programa
real(8) :: eps
integer :: M

! O programa tem que gerar a matriz simetrica com base no M que foi dado

read *, eps

read *, M

call metodo(eps, M)

end program exercicio5

subroutine metodo(eps, M)
    implicit none

    integer :: i, j, contador = 0

    integer :: M

    real(8) :: eps, soma, lambda, aux_lambda

    real(8), dimension(M,M) :: matrix
    real(8), dimension(M) :: vetor, vetor_soma
    real(8), dimension(M) :: aux


    ! Coletando os valores da matrix

    do i = 1, M, 1
        read *, aux   ! Pegando os dados
        do j = 1, M, 1
            matrix(i, j) = aux(j)
        enddo
    enddo

    ! Criando o vetor normal

    do i = 1, M, 1
        vetor(i) = 1.d0
    enddo

    vetor = vetor / (norm2(vetor)) !Nomarização do vetor x inserido

                             ! Programa principal

                             ! TODO: Explicar o que cada parte faz de forma separada
    do while(.true.)

        aux_lambda = lambda

        ! Parte 1
        do i = 1, M, 1
            soma = 0.0d0
            do j = 1, M, 1
                soma = soma + matrix(i,j) * vetor(j)
            enddo
            vetor_soma(i) = soma
        enddo

        ! Parte 2
        lambda = 0.0d0
        do i = 1, M, 1
            lambda = lambda + vetor(i) * vetor_soma(i)
        enddo

        ! Parte 3
        vetor = vetor_soma / norm2(vetor_soma)
        contador = contador + 1

        if(abs(aux_lambda - lambda) < eps) then  ! Calculo do erro
            exit
        endif

    enddo

      print *, lambda

      do i = 1, M, 1
        print *, vetor(i)
      enddo

end subroutine
