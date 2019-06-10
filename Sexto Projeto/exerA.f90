program planet_movement
implicit none


integer :: i, N

real(8) :: G, Ms, pi
real(8) :: r, dt
real(8) :: y1, y0, y, x, x0, x1
real(8) :: ay, voy, ax, vox

N = 10
pi = atan(1.d0) * 4.d0
Ms = 2.d30

! TODO: Tirar os print's statments

print *, "Coloque o valor de r: "
read *, r ! AU
print *, "Coloque a velocidade inicial Vo: "
read *, voy !
print *, "Coloque o intevalo de tempo: "
read *, dt



G = (4.d0 * pi**2.d0) / Ms ! TODO: Ver se esta certo isso

print *, ""
print *, "------------------------------------------"
print *, "| ", 'Valor de G: ', G, "|"
print *, "------------------------------------------"

x0 = r ! AU
x = r

y1 = voy * dt
y = y1

print *, "|", "Valor de y1: ", y1, "|"
print *, "------------------------------------------"

print *, ""
print *,  " x "," | ", " y ", " | "," ax ", " | "," ay "

open(1, file="trajA1_out.dat")
do i = 2, int(1.d0 / dt) , 1              ! TODO:Qual o valor que tenho que colocar aqui?

    r = dsqrt(x**2.d0 + y**2.d0)

    ! Updating the aceleration
    ay = - (G * Ms * y) / (r**3.d0)
    ax = - (G * Ms * x) / (r**3.d0)


    ! Now updating the planet position
    y = 2.d0 * y1 - y0 + ay * dt**2.d0
    x = 2.d0 * x1 - x0 + ax * dt**2.d0

    y0 = y1
    y1 = y

    x0 = x1
    x1 = x

    ! print *, " | ", x, " | ", y, " | ",  ax, " | ", ay, " | "
    print *, i * dt, x, ax


    write(1 , *) i * dt, x, y
enddo

close(1)
call system("gnuplot -p Plot")


end program planet_movement
