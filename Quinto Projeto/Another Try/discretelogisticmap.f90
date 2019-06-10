program logistic_map
 implicit none
 integer :: NSTEPS,i
 real(8) :: r,x0,x1
! ----- Input:
 print *,'# Enter NSTEPS, r, x0:'
 read  *,NSTEPS,r,x0


 open(unit=33,file='log.dat')
 write(33,*) 0, x0
! ----- Calculate:
 do i=1,NSTEPS
  x1 = r * x0 * (1.0d0-x0)
  write(33,*)i,x1
  x0 = x1
 enddo
 close(33)
end program logistic_map
