!===========================================================
! Discrete Logistic Map
! Map the trajectory in 2d space (plane)
!===========================================================
program logistic_map
 implicit none
 integer :: NSTEPS,i
 real(8) :: r,x0,x1

 NSTEPS = 10000

print *, "Put the r and xo values: "
read *, r, x0
! ----- Initialize:
 open(33,file='trj.dat')
! ----- Calculate:
 write(33,*) 0, x0,0

 do i = 1, NSTEPS
  x1 = r * x0 * (1.0d0 - x0)

  write(33,*) 2 * i - 3, x0, x1
  write(33,*) 2 * i - 2, x1, x1
  x0 = x1
 enddo
 close(33)

 call system("gnuplot -p Graph")

end program logistic_map
