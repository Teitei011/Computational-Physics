program exercicio3
implicit none

! Declaracao de variaveis
integer :: i, n, j
integer(8) :: fatorial

! Para precisao simples
real(4) :: s_sin = 1.d0, s_buffer, x = 0.1, s_conta
real(4), dimension(4) :: s_eps

! Para precisao dupla
real(8) :: d_sin = 1.d0, d_buffer = 1.d0, d_conta
real(8), dimension(4) :: d_eps

! Vetor que contem os dados a ser analisado
real(8), dimension(4) :: vetor_x = (/0.1d0, 0.2d0, 0.3d0, 0.4d0/)


!print *, "Precisão Simples:"


!                           PRECISAO SIMPLES 
do i = 1, 4, 1

    x = vetor_x(i)   ! Pegando os 4 valores do vetor um de cada vez
    
    s_sin = x  ! Inicializando com 1
    n = 1
    
    do while(.true.)
        if (s_buffer .eq. s_sin) then              ! Quando ele fica igual é pq nao da mais
            exit                                   ! para continuar. 
        
        else
            s_buffer = s_sin                           ! Atualizando o s_buffer
            
            s_sin = s_sin + (-1)**n * x**(2 * n  + 1)/ fatorial(2 *n + 1)
            n = n + 1   ! Atualizando o n
        endif
    enddo
    n = n + 1
    s_conta =  ((x**(2 * n  + 1)) / fatorial(2*n + 1)) / s_sin
    print *,  s_sin, s_conta

enddo

!print *, " "
!print *, "Precisão Dupla:"


!                           PRECISAO DUPLA 
do i = 1, 4, 1
    x = vetor_x(i)   ! Pegando os 4 valores do vetor um de cada vez
    
    d_sin = x  ! Inicializando com 1
    n = 1
    
    do while(.true.)
        if (d_buffer .eq. d_sin) then              ! Quando ele fica igual é pq nao da mais
            exit                                   ! para continuar. 
        
        else
            d_buffer = d_sin                           ! Atualizando o s_buffer
            
            d_sin = d_sin + (-1)**n * x**(2 * n  + 1)/ fatorial(2 *n + 1)
            n = n + 1   ! Atualizando o n
        endif
    enddo
     n = n + 1
     d_conta =  (x**(2 * n  + 1)/ fatorial(2 *n + 1)) / d_sin
    print *,  d_sin, d_conta

enddo
end program exercicio3


integer(8) function fatorial(n)
        implicit none
        integer :: j
        integer, intent(in) :: n

        fatorial = 1  ! Calculando o fatorial
        do j = 1, n, 1                     
            fatorial = fatorial * j
        enddo
end function fatorial

