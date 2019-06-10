program cobweb
implicit none

real(8) :: G, r, x, xo, x1, Gx
integer :: i, N

N = 1000
print *, "Coloque os valores de xo e r:"
read *, xo, r


open(1, file="exponential.dat")
x = xo
do i = 0, N, 1
    G = r * x * (1.d0 - x)

    x = r * xo * (1.d0 - xo)
    xo = x

    Gx = x
    write(1 , *) x,  G, Gx, i

enddo

call system("gnuplot -p Graph")


end program cobweb
