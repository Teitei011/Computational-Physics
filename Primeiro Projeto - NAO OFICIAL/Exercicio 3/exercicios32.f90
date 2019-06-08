Wprogram questao
implicit none 

! Declarando as variaveis

integer :: i, j 
real*8, external :: rkiss05
real*8 :: somatoria, numeros, media, seed = 15560
print *, "------------------------------------------------------------------------------------"
print *, "                    QUESTAO 2"

!											QUESTAO 2													!

call kissinit(seed)


! O programa vai escolher de forma aleatoria uma linha que vai começar e ler até a 100 casa.
! Ele vai fazer isso 5 vezes para ver qual o desvio apresentado

do j = 0, 5, 1 ! Desta forma vou ter 5 amostras de randomicas do resultado 
    ! pegando o numero aleatorio
    somatoria = 0
    do i = 0, 100, 1
        numeros = rkiss05()  ! Gerando os numeros aleatorios

        if (numeros .GT. 0.5) then    ! Caso for maior que 0,5 ele soma, 
           somatoria =  somatoria + 1
    	end if
    end do

    ! Parte que verifica quem ganhou 
    
    if((somatoria/100) .GT. 0.5) then
        print *, "O candidato 1 ganhou"
    else if((somatoria/100) .EQ. 0.5)then
        print *, "Houve um impate tecnico"
	else
        print *, "O candidato 0 ganhou" 
    end if 
end do

stop
end program questao


