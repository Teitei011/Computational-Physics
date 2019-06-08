program exerA
implicit none

! funcao usada
! f (x) = exp(x) cos^2 (x/2)
! x = 1 / 5

! df = - (exp(x) * (sin(x) -cos(x) - 1)) / 2
! resultado = 0.16412441736905167

! d2f = - (exp(x)*(2*sin(x) - 1)) / 2
! resultado = -2.2296178440113725

! Declaracao de Variaveis
integer :: i, j
integer :: n

real(8), dimension(14) :: h_vector
real(8) :: x = 0.2d0

real(8) :: valor = 0.16412441736905167d0
real(8) :: valor_derivada = -2.2296178440113725 ! Recalcular
real(8) :: valor_terceira = -1.4514745842155805

real(8) :: f, resultado

! Declaracao dos nomes
real(8) :: ds_3pts, df_2pts, dt_2pts, ds_5pts, dss_5pts, dta_5pts

open(1, file="tabA_in.dat")
read(1, *) n
read(1, *) h_vector
close(1)

open(2, file="tabA_out.dat")
write(2 ,*) "# h" , "ds 3pts", "df 2pts", "dt 2 pts", "ds 5 pts",&
& "dss 5pts", "dta 5"

write(* ,*) "h" , "ds 3pts", "df 2pts", "dt 2 pts", "ds 5 pts",&
& "dss 5pts", "dta 5"


i = 1
do j = 1, n, 1
    df_2pts = df_2pts + () / h_vector(i)
enddo

close(2)


end program exerA

function f(x)
implicit none
    real(8) :: f, x
    f = exp(x)*cos(x/2)*cos(x/2)
end function
