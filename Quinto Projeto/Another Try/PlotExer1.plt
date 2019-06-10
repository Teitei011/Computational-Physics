set grid

set ylabel "y"
set xlabel "x"

set logscale y

set terminal png
set output "teste.png"

# plot "dist_out.dat" u 1:2 , "dist_out.dat" using 1:3
plot "dist_out.dat" using 1:4
