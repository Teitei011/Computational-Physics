program com_resistencia
implicit none

integer :: i

real(8) :: P = 400d0
real(8) :: m = 70d0
real(8) :: rho = 1.2d0
real(8) :: C = 1.d0/2.d0

real(8) :: T, dt
real(8) :: vo
real(8) :: vi
real(8) :: A
real(8) :: D

! read(*, *) vo
! read(*, *) dt
! read(*, *) T
! read(*, *) A
!

vo = 0.1d0 ! m/s
dt = 0.1d0  ! s
T = 3.d0*60.d0*60.d0 ! s
A = 1.d0 / 4.d0! m


D = 0 ! m
vi = 0 ! m/s

open(2, file="velB_out.dat") ! Nao sei se precisa para este caso, só estou fazendo pq dai é mais
!facil graficar

write(2, *) 0, vo
do i = 1, int(T/dt), 1
  vi = vo + (P / (m * vo)) * dt - ((C*rho*A*vo**2) / m) * dt
  vo = vi

  D = D + vi*dt
  write(2, *) dt*i, vi

enddo

print *, "Para diminuir a area de choque, fazendo ele atingir velocidades mais rapidas."
print *," Os ciclistas correm em grupo com o intuito de dividir quem fica na &
&frente para 'quebrar o ar', com isso aumenta a possibilidade de andar distancias maiores dado que não &
%é necessário 'quebrar o ar' constantemente"
print *, "É vantajoso pelo mesmo motivo de andar em grupo, quando vc esta atrás de um ciclista vc nao tem que vencer &
&a resistencia do ar, precisando de menos potencia para manter o movimento."
print *, "Instante de tempo velocidade terminal: ", 350.d0
print *, "Distancia percorrida: ", 149681.21352064642d0
print *, "Velocidade final", 13.867225487012522d0
print *, "Velocidade media: ", 13.859371622282076d0

close(2)

end program com_resistencia
