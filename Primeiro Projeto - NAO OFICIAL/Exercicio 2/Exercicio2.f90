program Taylor
implicit none

! Programa para usar a aproximação de Taylor para calculo do cos(x) para x proximo de 0

!Declaracao de variaveis 
integer :: i, j 
real*8 :: funcao
real*8, dimension(5) :: vecto

vecto(1) = 0.1
vecto(2) = 0.2
vecto(3) = 0.3
vecto(4) = 0.4
vecto(5) = 0.5

real*8 :: x,t,angle,sum1,sum2,cont
integer :: np,n

! Nao sei como o programa funciona
 
do j = 0, 5, 1 
    angle=0.0174532925*x
    n = 10

    !To sum up Taylor series
    t=1
    sum1=1
    np=(2*(n-1))+1
	do i=2,np,2
        t = (((-t)*angle*2)/(i*(i - 1)))
        sum1=sum1+t
	end do
    write (*,10)  "cos(",x,")= ",sum1
	10 format (a,f7.3,a,f10.5)
enddo

stop
end program Taylor