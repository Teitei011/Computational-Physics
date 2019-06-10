set grid

set ylabel "y"
set xlabel "x"

# set yrange[:1]
set logscale y

set terminal png
set output "Chaosr=3_0.png"


e = 0.5772156649
lambda = 0.21639101555475532
f(x) = e**(-lambda * x)
# fit f(x) "dist_out.dat"  using 1:4 via b
# plot "dist_out.dat" u 1:2 , "dist_out.dat" using 1:3
plot "dist_out.dat" using 1:4 t "r = 3.0"#, f(x)
