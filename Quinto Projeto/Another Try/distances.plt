set grid

set xlabel "x"
set ylabel "y"

set terminal png
set output "teste.png"

plot 'dist_out.dat' using 2:3 t "" lt rgb "red", 'dist_out.dat' using 1:4 t "" lt rgb "blue"
