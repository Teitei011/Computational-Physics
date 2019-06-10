program lambdaprogram
implicit none


real(8) :: r, dr, x0, x1
real(8) :: r_min, r_max

real(8):: lambda0
real(8), dimension(1000) :: r_vector

integer :: contador, verificador

integer :: i, n_test, n_steps, r_steps

r_min = 1.0d0
r_max = 4.0d0

n_test = 100
n_steps = 1000
r_steps = 1000


contador = 1
verificador = 0

open(1, file='lambdaVariation.dat')

dr = (r_max - r_min) / r_steps ! Incremento em r

r = r_min

do while ( r < r_max)
	x0 = 0.5d0

	do i = 1, n_test, 1
		x1 = r * x0 * (1.d0 - x0)
		x0 = x1
	enddo

	do i = 1, n_steps, 1
		x1 = r * x0 * (1.d0 - x0)
		write(1, *) r, x1


		x0 = x1
	enddo

	r = r + dr
enddo
close(1)


call system("gnuplot -p LambdaGraph.plt")

end program lambdaprogram
