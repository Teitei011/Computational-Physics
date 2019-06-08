program sem_resistencia
implicit none

integer :: i

real(8) :: P = 400d0  ! W
real(8) :: m = 70d0   !kg


real(8) :: T, dt
real(8) :: vo
real(8) :: vi

read(*, *) vo
read(*, *) dt
read(*, *) T

! vo = 0.1d0 ! m/s
! dt = 0.1d0 ! s
! T = 30d0 * 60d0 ! s

vi = 0.d0

open(2, file="velA_out.dat")
write(2, *) 0, vo
do i = 1, int(T/dt), 1
  vi = vo + (P / (m * vo)) * dt
  vo = vi
  write(2, *) dt*i, vi
enddo

close(2)

end program sem_resistencia
