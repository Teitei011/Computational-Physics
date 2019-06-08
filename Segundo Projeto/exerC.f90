! Resposta aos exercicios
! a = 2
! b = -1/(2)**0.5 = -0.7
! c = 1/(2)**0.5 = 0.7

program polinomio
implicit none

! Declaracao de variaveis
integer :: i
integer :: iteracoes
real(8) :: f, df

! Busca direta
real(8) :: x3_dir
real(8) :: passos
logical :: s 
real(8) :: valor


! Newton
real(8) :: x, x1, x2, x3
real(8) :: b_x1, b_x2, b_x3

! Secante
real(8) :: x_1, x_11, x_2, x_21,  x_3, x_31
real(8) :: sb_x1, sb_x2, sb_x3

open(1, file="find_the_x.dat")

! Pegando o valor da iteracao
iteracoes = 15

!                               Chutes utilizados

! Busca direta
x3_dir = -1.2d0
passos = 0.01d0
! Newton
b_x1 = -0.5d0
b_x2 = 0.5d0
b_x3 = 2.4d0


! Método da secante
x_1 = -0.9d0
x_11 = -0.6d0

x_2 = 0.6d0
x_21 = 0.8d0

x_3 = 1.8d0
x_31 = 2.2d0

!print *, "iter", " dir1 ", "dir2 ", "dir3 ", "NR1 ", "NR2 ", "NR3 ", "sec1 ", "sec2 ", "sec3 "

write(1, *) "iter", " dir1 ", "dir2 ", "dir3 ", "NR1 ", "NR2 ", "NR3 ", "sec1 ", "sec2 ", "sec3 "

do i = 1, iteracoes, 1

!                                          Newton-Raphson
  ! x1
  x1 = b_x1 - f(b_x1) / df(b_x1)
  b_x1 = x1

   ! x2
   x2 = b_x2 - f(b_x2) / df(b_x2)
   b_x2 = x2

   ! x3
   x3 = b_x3 - f(b_x3) / df(b_x3)
   b_x3 = x3

   !                                        Metodo da Secante


       !x1
    sb_x1 = x_11 - f(x_11) * (x_11 - x_1) / (f(x_11) - f(x_1))
    x_1 = x_11
    x_11 = sb_x1


    !x2
    sb_x2 = x_21 - f(x_21) * (x_21 - x_2) / (f(x_21) - f(x_2))
    x_2 = x_21
    x_21 = sb_x2

     !x3
    sb_x3 = x_31 - f(x_31) * (x_31 - x_3) / (f(x_31) - f(x_3))
    x_3 = x_31
    x_31 = sb_x3

   !print *, i, x1, x2, x3, sb_x1, sb_x2, sb_x3
   write(1, *) i, x1, x2, x3, sb_x1, sb_x2, sb_x3 ! TODO: Remover tudo que escreve os arquivos
enddo

close(1)

s = (f(x3_dir) > 0)
do while(x3_dir < 2.5d0)
  valor = f(x3_dir)
  if(abs(valor) < .1d-5) then
    print *, x3_dir
    s = .not. s
  else if ((valor > 0) .NEQV. s) then
    print *, x3_dir
    s = .not. s
  endif
  x3_dir = x3_dir + passos
enddo


end program polinomio

function f(x) result (resposta)
implicit none
    real(8) :: x, resposta
    resposta = 2.d0*x**3.d0 - 4.d0*x**2.d0 - x + 2.d0
end function f

function df(x) result (resposta)
implicit none
    real(8) :: x, resposta
    resposta = 6.d0*x**2.d0 - 8.d0*x - 1.d0
end function df
