program achar_maior_autovalor
implicit none

! O programa consiste em achar o maior autovalor de uma matriz
integer :: i, j, k
integer :: m = 3


! Criação das Matrizes
real*8, dimension(3:3) :: matriz

do i = 0, m, 1
	do j = 0, m, 1
        matriz[i][j] = i*j
	enddo
enddo
print *, matriz

end program achar_maior_autovalor