program exercicio3
implicit none

! Declaracao de variaveis

integer :: i, n, j, fatorial

! Para precisao simples
real(4) :: s_sin = 1.d0, s_buffer, x = 0.1

! Para precisao dupla
real(8) :: d_sin = 1.d0, d_buffer = 1.d0

! Vetor declarado
real(8), dimension(4) :: vetor_x = (/0.1d0, 0.2d0, 0.3d0, 0.4d0/)

do i = 1, 1, 1

    x = vetor_x(i)   ! Pegando os 4 valores do vetor

    s_sin = 1.d0
    fatorial = 1
    n = 1

    do while(.true.)
        if (s_buffer .eq. s_sin) then              ! Quando ele fica igual é pq nao da mais
            exit                                   ! para continuar 
        endif

        s_buffer = s_sin                           ! Atualizando o s_buffer

        fatorial = 1  ! Calculando o fatorial
        do j = 1, (2*n), 1                     ! Tem isso pq tem que ser fatorial(2*n)!
            fatorial = fatorial * j
        enddo

         ! Aproximacao de Taylor
        if (mod(n,2) .NE. 0) then                    ! Para n impar
            s_sin = s_sin - ((x**(2.d0*n))/(fatorial))                    
        else                                         ! Para n par
            s_sin = s_sin + ((x**(2.d0*n))/(fatorial))
        endif
        n = n + 1   ! Atualizando o n

    enddo
    print *, "Valor de n: ",vetor_x(i) ,"Valor encontrado: " ,  s_sin
enddo

end program exercicio3
