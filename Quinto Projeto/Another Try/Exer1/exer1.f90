program exer1
  implicit none

  ! Declaracao de variaveis
  integer :: i, N

  real(8) :: r, epsilon
  real(8) :: x0, x1, x0t, x1t

  real(8) :: lambda, x0d, x1d


  read *, r
  read *, x0
  read *, epsilon


  N = 1000
  x0t = x0 + epsilon
  x0d = x0

open(1, file="dist_out.dat")
write(1, *) 0, x1, x1t, abs(x1 - x1t)

  do i = 1, N, 1

    ! Parte A
    x1 = r * x0 * (1.d0 - x0)
    x1t = r * x0t * (1.d0 - x0t)

    write(1, *) i, x1, x1t, abs(x1 - x1t)

    ! Parte B
    x1d = r * x0d * (1.d0 - x0d)

    lambda = lambda + dlog(abs(r * (1.d0 - 2.d0 * x1d)))


    x0 = x1
    x0t = x1t
    x0d = x1d

  enddo
close(1)


! Calculo de  lambda
lambda = 1.d0 / (N - 1.d0) * lambda
print *, "O valor de lambda é : ", lambda

end program exer1
