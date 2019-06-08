program exercicio2
implicit none

! Declaracao de Variaveis
integer :: i, j, k
real(8) :: tipo_i

integer :: valor = 1,  passos = 0
integer ::  N_lim, N_fat = 1

real(8) :: fat = 1.d0, ln_n, stir
real(8) :: pi = 3.14159265358979323846264338327950

do while(.true.)
    if (valor > 0) then 
        valor = valor * 2
        passos = passos  + 1
    else
        passos = passos - 1
        exit      
    endif
    
enddo

! Calculo de N_lim
N_lim = 2**(passos - 1) - 1

!Calculo de fatorial
do i = 1, passos + 1, 1
    N_fat = N_fat * i
enddo
   
print *, N_lim, passos, N_fat

! Utilizando da aproximacao de Stirling 



do i = 1, passos + 1, 1
    ! Fazendo o fatorial
    fat = 1
    do j = 1, i, 1
        fat = fat * j
    enddo
    
    ! Fazendo agora o ln(n!)
    ln_n = log(fat)
    
    ! Fazendo a aproximacao de Stirling
    tipo_i = i
    stir = i*log(tipo_i) - i  + 0.5*log(2*pi*tipo_i)
    
    !Printando tudo na mesma linha
    
    print *, i, fat, ln_n, stir
    
enddo

end program exercicio2  
