program teste

! O QUE APRENDER:

! 1) Modulos do Fortran (Como utilizar)
! 2) Aprender a usar o modulo rkiss05
! 3) Funcionamento das Funções (Como cria-las e utiliza-las)


! O QUE VERIFICAR:

! 1) Nao estou conseguindo definir a funcao 
implicit none


INTEGER :: num_linh = 281895, seed = 10414866
INTEGER :: random_number, j, crap, a
INTEGER :: nlinhas, M = 1
INTEGER :: data, i
REAL*8 :: Soma, Resultado, som_desv
real*8 :: desvio
REAL :: sm 

real*8, external    :: rkiss05
REAL, dimension(4):: array 

!REAL :: Soma = 0, Resultado = 0
!REAL :: som_desv = 0, desvio = 0

!									        QUESTAO 1 E 3                                           !



! Calculando o desvio padrao  FORMULA = !sm = ((1/k-1) Soma de K (x - X_med)**2 )**0,5



print *, "---------------------------------------------------------------------------------------"
print *, "                   QUESTAO 1"


call media(num_linh)


print *, " " ! Just to clean my screen 



!											QUESTAO 4                                                !

! Variando M de 10 até $10^4$ , mostre que $s_M ≈ σ 0 / M$ para M >> 1. Isso é consequência do teorema central
!do limite.
print *, "-------------------------------------------------------------------------------------------------------"
print *, "QUESTAO 4"

do j = 0, 4, 1
    M = M * 10
    call media(M)
    sm = a / SQRT(real(M))
    array(j) = sm 
end do 

end program teste

SUBROUTINE media(nlinhas)
    INTEGER :: nlinhas
    OPEN (1, file = 'votes.dat')         ! Calculando a média 
    DO i = 1, nlinhas, 1
        READ (1 ,*)  data  
        Soma = Soma + data   !Somando todos os pontos
    END DO 
    CLOSE(1)


    ! Calculando o resultado 
    Resultado = Soma / nlinhas

    OPEN (2, file = 'votes.dat')
	do i = 0, nlinhas - 1, 1
    READ (2 ,*)  data  
        som_desv = som_desv +  (data - Resultado)**2 ! Parte da Somatoria
	end do


    desvio = SQRT(som_desv/(nlinhas - 1)) ! Parte final que envolve a raiz 


	if (Resultado < 0.5) then  ! Caso o valor se maior que 0,5 significa que ouve mais votantes para o 1 
        print *, "O candidato 0 ganhou: " , Resultado, "+/-", desvio
	else 
        print*, "O candidato 1 ganhou: ", Resultado, "+/-", desvio
	end if 

    CLOSE(2)

end SUBROUTINE media
