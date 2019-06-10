program monte_carlo
implicit none

! Declaracao de variaveis
integer :: i, j
real(8) :: N, No
real(8) :: lambda
real(8) :: T, dt
real(8) :: random, seed = 1
real(8) :: decay

  ! TODO: Descobrir como colocar uma seed
 ! TODO : VER A MUDANÇA DE DECLARACAO QUE O PROFESSOR FEZ NAS VARIAVEIS


t = 10 ! anos

! read(* ,*) No
! read(* ,*) lambda
! read(* ,*) dt


No = 5000
lambda = 0.4
dt = 0.01 ! s

N = No
open(1, file="decai_out.dat")
do i = 0, int(T/dt), 1
  do j = 0, int(N), 1
    if (rand() < lambda*dt) then
        N = N - 1
    endif
  enddo
  write(1, *) dt * i, N
enddo
close(1)


end program monte_carlo
