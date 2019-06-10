program lambda
implicit none


real(8) :: G, r, x, xo, passos
integer :: i, N

N = 0.10d0
passos = 0.1d0
xo = 0.2d0
r = 1.0d0

! Constante de  Feigenbaum: 4.6689

open(1, file="lambdaVariation.dat")
x = xo

do i = 0, floor(4.d0 / passos), 1

    r = r + passos
    G = r * x * (1.d0 - x)
    print *, i * passos, G
    write(1 , *) i * passos, G
enddo

call system("gnuplot -p LambdaGraph.plt")



end program lambda
