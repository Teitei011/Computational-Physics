program bubblesort
implicit none

!     Organize uma lista

!                                           QUESTAO 1                                             !

!Escreva um programa que leia os primeiros N ≤ 10^4 números reais do arquivo Rnumbers.dat e os armazene
!como um vetor. O seu programa deve perguntar e ler qual o valor de N no terminal.

real*8, dimension(100000) :: vetor 
real*8 :: comparador = 0, contador
integer :: i, j
logical :: trocado
open(1, file="Rnumbers.dat")
read(1, *)  vetor


 !O program funciona da seguinte forma: Se o valor do vetor for maior que o comparador troca
 ! o valor do comparador pelo o do vetor, faça isso até o final da lista e vc terá o maior valor
 ! do vetor

vetor(1) = comparador

do i = 1, 100000, 1
    if (vetor(i) .GT. comparador)  then   
        comparador = vetor(i)
    end if

    if (vetor(i) .NE. 0) then 
        contador = contador + 1
	end if 
enddo 

print *, "O maior numero encontrado foi: ", comparador
print *, "O arquivo contem : ", contador, " linhas"

close(1)
!                                           QUESTAO 2                                             !

! Organizar o vetor em ordem crescente 


open(25, file="vetor_arrumado.dat")

contador = 0
vetor(1) = comparador
do j = size(vetor) -1 ,1 , -1
	trocado = .false.
	do i = 0, j
	    if (vetor(i) .GT. vetor(i + 1)) then    ! 
	        comparador = vetor(i)
	        vetor(i) = vetor(i + 1)
	        vetor(i + 1) = comparador
	        trocado = .true.
	        contador = contador + 1   ! Somente para saber a quantidade de operacoes que o fortran fez
	    end if 
	end do
	if (.not. trocado) exit
end do
write(25, *) vetor
write(*, *) "Ele fez: ", contador, "operacoes!!"

close(25)

end program bubblesort