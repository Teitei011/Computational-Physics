program crescimento
implicit none

real(8) :: G, r, x1, x0
integer :: i, N

N = 1000

print *, "Valor de x_o: "
read *, x0
print *, "Valor de r: "
read *,  r


open(1, file="exponential.dat")
x = xo
do i = 0, N, 1
    x1 = r * x0 * (1.0d0 - x0)
    xo = x

    write(1 , *) i, x0, x1
enddo

end program crescimento
