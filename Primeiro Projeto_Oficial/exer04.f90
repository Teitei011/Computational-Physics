program bubblesort
implicit none

! Declaracao de variaveis
real(8), dimension(1500) :: vetor 
real(8) :: comparador = 0, contador
integer :: i, j
logical :: trocado
open(1, file="ord_in.dat")
read(1, *)  vetor
close(1)

! Organizar o vetor em ordem crescente 


open(2, file="ord_out.dat")

contador = 0
comparador = vetor(1)

do j = size(vetor) -1 ,1 , -1
    trocado = .false.
    do i = 0, j, 1
        if (vetor(i) .GT. vetor(i + 1)) then  
            comparador = vetor(i)
            vetor(i) = vetor(i + 1)
            vetor(i + 1) = comparador
            trocado = .true.
            contador = contador + 1   ! Somente para saber a quantidade de operacoes que o fortran fez
        end if 
    end do
    if (.not. trocado) exit    ! Quando isso ocorre significa que o vetor ja esta arrumado
end do

! Escrever linha a linha
do i = 1, 1500, 1
    write(2, *) vetor(i)
enddo

close(2)

end program bubblesort
