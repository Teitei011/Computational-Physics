program calculate_pi
implicit none

integer :: i, iteration
real(8) :: r, x, y, distance
real(8) :: pi, soma

iteration = 500000000
soma = 0
r = 1d0

do i = 0, iteration, 1
  x = rand()
  y = rand()

  distance = (x**2d0 + y**2d0)**0.5d0
  if (distance < r) then
      soma = soma + 1
  endif
  ! print *, i, pi
enddo

pi = 4.d0 * (soma / iteration)
print *, "Valor final de pi", pi

end program calculate_pi
