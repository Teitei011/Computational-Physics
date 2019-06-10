program segundo
implicit none

! Declaracao de variaveis
integer :: i, j
real(8) :: N, No
real(8) :: lambda
real(8) :: t, dt
real(8) :: decay
real(8) :: probabilidade, tau, tau2


T = 10 ! anos

read(* ,*) No
read(* ,*) lambda
read(* ,*) dt

! No = 5000
! lambda = 0.4
! dt = 0.01 ! s

N = No
open(1, file="decai_out.dat")

do i = 0, int(T/dt), 1
  do j = 0, int(N), 1
    if (rand() < lambda*dt) then
        N = N - 1
    endif
  enddo

  probabilidade = lambda * (N / No) * dt * 100d0
  tau = tau + dt * i * probabilidade * dt

  tau2 = tau2 + (dt * i) * lambda * dexp(-lambda * dt * i) * dt
  write(1, *)  tau, tau2  
enddo
close(1)

end program segundo
