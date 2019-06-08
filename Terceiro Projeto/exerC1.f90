program pendulo_euler
implicit none

! Declaracao de variaveis
integer :: i

real(8) :: g, l, m
real(8) :: E

real(8) :: T, dt
real(8) :: w, wo
real(8) :: theta, theta0

real(8) :: PI = datan(1.d0)*4.d0


! Input
read(*,*) T
read(*,*) dt
read(*,*) m
read(*,*) l
read(*,*) theta0

! !
! T = 10.d0 ! s
! dt = 0.04d0 ! s
! m = 1.d0 ! kg
! l = 1.d0 ! m
! theta0 = 10d0  ! degress

! Constantes
wo = 0.d0 ! rad/s
w = 0.d0 ! rad/s
g = 10d0 ! m/s**2
E = 0.d0 ! J

! Converting to radians
theta0 = (theta0)*PI/180.d0
theta = theta0

! print *, theta

open(2, file="exerC1_out.dat")
! For loop

do i = 1, int(T/dt), 1
  w = wo - g*(theta0)*dt / l

  theta = theta0 + wo * dt

  ! theta <= PI
  if (theta > PI) then
    theta = theta  - 2.d0*PI
  endif

  if (theta < - PI) then
    theta = theta + 2.d0*PI
  endif

    ! E = E + (0.5d0 * w**2.d0 + g*(1.d0 - dcos(theta)))
    E = E + (0.5d0 * m * l**2.d0* w**2.d0 + m * g * l * (1.d0 - dcos(theta)))

    wo = w
    theta0 = theta
    write(2, *) dt*i, w
enddo



end program pendulo_euler
