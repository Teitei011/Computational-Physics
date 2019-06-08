program optimizacao
implicit none

real(8) :: x3_dir
real(8) :: passos
real(8) :: f

integer :: iteracoes
integer :: i
! Busca direta
! x3

logical :: s 
real(8) :: valor

x3_dir = -1.2d0
passos = 0.01d0


! x3

s = (f(x3_dir) > 0)
do while(x3_dir < 2.5d0)
  valor = f(x3_dir)
  if(abs(valor) < .1d-5) then
    write(*,*) x3_dir
    s = .not. s
  else if ((valor > 0) .NEQV. s) then
    write(*,*) x3_dir
    s = .not. s
  endif
  x3_dir = x3_dir + passos
enddo

end program optimizacao

function f(x) result (resposta)
implicit none
    real(8) :: x, resposta
    resposta = 2.d0*x**3.d0 - 4.d0*x**2.d0 - x + 2.d0
end function f
