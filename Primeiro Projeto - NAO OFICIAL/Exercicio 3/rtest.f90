      PROGRAM rtest
      implicit none
     
      integer,parameter      :: r8b= SELECTED_REAL_KIND(P=14,R=99)   ! 8-byte reals
      integer,parameter      :: i4b= SELECTED_INT_KIND(8)            ! 4-byte integers 

      real(r8b)              :: x, sum, sum2, min, max
      real(r8b), external    :: rkiss05

      call kissinit(1)    

      print *,'Now printing the first 10 random numbers'
      print *,'and the expected values (in brackets).'
      print '(F12.9,A)',  rkiss05(),'  (0.100223257)'
      print '(F12.9,A)',  rkiss05(),'  (0.654553312)'
      print '(F12.9,A)',  rkiss05(),'  (0.533925296)'
      print '(F12.9,A)',  rkiss05(),'  (0.129070464)'
      print '(F12.9,A)',  rkiss05(),'  (0.846589457)'
      print '(F12.9,A)',  rkiss05(),'  (0.938662817)'
      print '(F12.9,A)',  rkiss05(),'  (0.388126970)'
      print '(F12.9,A)',  rkiss05(),'  (0.415468296)'
      print '(F12.9,A)',  rkiss05(),'  (0.321098742)'
      print '(F12.9,A)',  rkiss05(),'  (0.572245760)'



      stop      
      END PROGRAM rtest

