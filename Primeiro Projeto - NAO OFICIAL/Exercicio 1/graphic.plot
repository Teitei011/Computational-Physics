set xlabel "Numero de iterações"
set ylabel "Valor"
set title "Aproximacao de Stirling X LOG(n)"

set terminal png
set output "Aproximacao_de_Stirling_X_LOG(n).png"

plot "Aproximacao_de_Stirling.dat" , "Logaritmo_dos_fatoriais.dat"

