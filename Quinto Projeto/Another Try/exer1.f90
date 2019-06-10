program logistic_map
implicit none

integer :: N, i

real(8) :: r, epsilon, lambda0
real(8) :: x0, x1
real(8) :: x0t, x1t

! Para o calculo de lambda pela equação
real(8) :: lambda
real(8) :: x0d, x1d

 N = 100
 read *, r
 read *, x0
 read *, epsilon

! Inicializando os dois sistemas com valores + |G\epsilon de diferença
 x0t = x0 + epsilon

 open(1, file='dist_out.dat')
 write(1, *) 1, x0, x0t, abs(x0t - x0)

 do i = 1, N, 1
   x1 = r * x0 * (1.0d0 - x0)
   x1t = r * x0t * (1.d0 - x0t)

   x0 = x1
   x0t = x1t

   write(1, *) i, x0, x0t, abs(x0t - x0)

 enddo

 close(1)

 lambda = 1.d0 / (N - 1) * lambda

 print *, "O valor de lambda é: ", lambda0   ! TODO: Como eu obtenho o valor de lambda ?
 print *, "O valor de lambda pelo segundo metodo é:", lambda


call system("gnuplot -p PlotExer1.plt")
end program logistic_map
