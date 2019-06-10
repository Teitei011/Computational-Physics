set grid


set xlabel "r"
set ylabel "G(x)"

set xrange[2.8:]

set terminal png
set output "lambdaCloser.png"

f(a) = a * x * (1 - x)

plot "lambdaVariation.dat" with dots t ""
