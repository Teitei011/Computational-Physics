set grid
# set ylabel "Number Of Particles"
set xlabel "Time (yrs)"

set xrange[0:]
set yrange[0:]
set terminal png
set output "decai.png"

No = 5000
lambda = 0.4

# plot "decai_out1.dat" lt rgb "blue" t "Monte Carlo", "decai_out2.dat" lt rgb "green", "decai_out3.dat" lt rgb "brown"
plot "decai_out.dat" u 1:2 pt 10 t "Simulation", "decai_out.dat" u 1:3 t "Analytic"
