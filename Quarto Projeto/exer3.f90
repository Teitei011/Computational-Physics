program terceiro
implicit none

! Declaracao de variaveis
integer :: i, j
real(8) :: N, No
real(8) :: lambda
real(8) :: T, dt
real(8) :: decay

! Lendo os arquivos
open(1, file="decai_in")
read(1, *) No
read(1, *) lambda
read(1, *) dt
read(1, *) T

N = No
open(2, file="decai_out.dat")
do i = 0, int(T/dt), 1
  N =  No - No *  lambda * dt   !TODO: Ver se esta forma esta certa
  No = N
  write(2, *) dt * i, N
enddo
close(2)

end program terceiro
