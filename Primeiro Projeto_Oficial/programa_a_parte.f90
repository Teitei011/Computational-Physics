program deixar_menor_o_arquivo
implicit none

! O professor quer um program com menos numeros do que o arquivo que eu tenho

real(8) :: number
integer :: i, iteracoes = 1500


open(1, file="ord_in.dat")
open(2,file='ord_updated.dat')

do i = 0, iteracoes, 1
	read(1, *) number
	write(2, *) number
enddo    


close(1)
close(2)
end program deixar_menor_o_arquivo