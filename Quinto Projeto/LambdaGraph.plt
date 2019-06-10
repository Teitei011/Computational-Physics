set grid

set title "Diagrama de bifurcação em função de Lambda"

set xlabel "lambda"
set ylabel "G(x)"

#set xrange[3.4:]

set terminal png
set output "teste.png"

#f(a) = a * x * (1 - x)

plot "lambdaVariation.dat" with dots t ""
