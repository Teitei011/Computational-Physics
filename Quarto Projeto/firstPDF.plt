set grid
set ylabel "Number Of Particles"
set xlabel "Time (yrs)"

set xrange[0:]

# set terminal png
# set output "decai.png"

set terminal pdf
set output "decai.pdf"

plot "decai_out1.dat" with points lt rgb "black" t "Monte Carlo", "decai_out2.dat" with lines lt rgb "blue" linewidth 3 t "dt = 0.01", "decai_out22.dat" w points lt  rgb "red" t "dt = 0.2"
