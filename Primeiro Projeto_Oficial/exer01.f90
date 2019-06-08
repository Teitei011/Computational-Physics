
program exercicio1
implicit none

! 24, 53, 113

! Declaracao de variaveis
integer :: i

! Precisao simples
real(4) ::  a = 1.e0 ,s_buffer = 1.e0 , s_res
real(4), dimension(24) :: s_vector

! Precisao dupla
real(8) :: d_buffer, d_res = 0.d0, d_a = 1.0d0
real(8), dimension(55) :: d_vector

! Precisao Quadrupla
real(16) :: q_buffer, q_res, q_a = 1.0_16
real(16), dimension(115) :: q_vector

!                         PRECISAO SIMPLES

i = 1
do while(.true.)
    if (s_buffer .EQ. s_res) then
        exit
    else
        s_buffer = s_res
        s_res = 1.e0 + a
        a = a / 2.e0
        i = i  + 1

        s_vector(i) = s_res
    endif
enddo

! Dps de s_vector(i-2) o valor fica igual a 1.0000000000000
print *, i - 3,  s_vector(i-2)

!                         PRECISAO DUPLA

i = 1
do while(.true.)

    if (d_buffer .EQ. d_res) then
        exit
    else
        d_buffer = d_res
        d_res = 1.e0 + d_a
        d_a = d_a / 2.e0
        i = i  + 1

        d_vector(i) = d_res
    endif
enddo
print *,  i - 3, d_vector(i-2)


!                         PRECISAO  QUADRUPLA

i = 1
do while(.true.)

    if (q_buffer .EQ. q_res) then
        exit
    else
        q_buffer = q_res
        q_res = 1.e0 + q_a
        q_a = q_a / 2._16
        i = i  + 1

        q_vector(i) = q_res
    endif
enddo
print *,  i - 3, q_vector(i-2)

end program exercicio1
