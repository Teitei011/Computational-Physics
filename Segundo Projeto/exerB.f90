program integracao
implicit none

! Resultado esperado: 0.1873368280011384

! Declaracao de variaveis
integer :: i, j, n

real(8) :: valor = 0.1873368280011384 ! Valor esperado
real(8) :: f
real(8) :: trapezio, simpson, bode

integer :: m

real(8) :: x1
real(8), dimension(11) :: h_vector
integer, dimension(11) :: n_vector

open(1, file="tabB_in.dat")
read(1 ,*) n
read(1, *) n_vector

 ! Transformando todo n_vector para h_vector com a relacao h = 1 / n
do i = 1, n, 1
    h_vector(i) = 1.d0 / n_vector(i)
enddo


print *, "#N  ", "h  ", "Regra do trapézio ", "Regra de Simpson  ", " Regra de Bode"
do i = 1, n, 1

    ! Trapezio
    m = int(1.d0 / h_vector(i))
    do j = 1, m, 1
        trapezio = trapezio + (f(h_vector(i)*(j+1.d0)) +f( h_vector(i)*j))
    enddo
    trapezio =  trapezio * (h_vector(i) / 2.d0)



    ! Simpson        ! Nao esta tendendo para o numero esperado
    do j = 1,  m, 1
        simpson = simpson + 4.d0 * f((2.d0* j - 1.d0) *h_vector(i)) + 2.d0*f(2.d0*j*h_vector(i))
    enddo
    simpson = (h_vector(i) / 3.d0) * simpson  
        
    do j = 1, m, 1
        bode = bode + (32.d0*f(h_vector(i)*j) + 12.d0*f&
            &(2.d0 * j* h_vector(i)) + 32.d0*f&
            &(3.d0*h_vector(i) * j) + 7.d0 * f(4.d0*h_vector(i) * j))
    enddo
    bode = bode * (2.d0 * h_vector(i) / 45.d0)
    
    print *, bode
    !print *,n_vector(i), h_vector(i) , abs(trapezio - valor), abs(simpson - valor), abs(bode - valor)
    
enddo


end program integracao

function f(x) result (resposta)
implicit none

    real(8) :: x, resposta
    resposta = dcos(x) * dsin(x/2)

end function f
