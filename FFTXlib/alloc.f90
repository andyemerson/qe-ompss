module alloc
! allocate with errors
! A.Emerson 5-Nov-2020

implicit none
integer, parameter :: sp = kind(1.0), dp = kind(1.0d0)

interface array_allocate

   module procedure int_allocate,real_allocate,double_allocate,complex_allocate

end interface array_allocate

contains

   subroutine int_allocate(arr)
      integer, allocatable, intent(inout) :: arr
      integer :: alloc_stat,ierr,errcode

      ALLOCATE(arr,stat=alloc_stat)

      if (alloc_stat /= 0) then
        WRITE(*,*) "**Memory allocation error for integer arrays**"
        !CALL MPI_Abort(MPI_COMM_WORLD,errcode,ierr)
      endif

    end subroutine int_allocate

    subroutine real_allocate(arr)
      real(kind=sp), allocatable, intent(inout) :: arr
      integer :: alloc_stat,ierr,errcode

      ALLOCATE(arr,stat=alloc_stat)

      if (alloc_stat /= 0) then
        WRITE(*,*) "**Memory allocation error for real arrays**"
        !CALL MPI_Abort(MPI_COMM_WORLD,errcode,ierr)
      endif

    end subroutine real_allocate

    subroutine double_allocate(arr)
      real(kind=dp), allocatable, intent(inout) :: arr
      integer :: alloc_stat,ierr,errcode

      ALLOCATE(arr,stat=alloc_stat)

      if (alloc_stat /= 0) then
        WRITE(*,*) "**Memory allocation error for double arrays**"
        !CALL MPI_Abort(MPI_COMM_WORLD,errcode,ierr)
      endif

    end subroutine double_allocate

    subroutine complex_allocate(arr)
      complex, allocatable, intent(inout) :: arr
      integer :: alloc_stat,ierr,errcode

      ALLOCATE(arr,stat=alloc_stat)

      if (alloc_stat /= 0) then
        WRITE(*,*) "**Memory allocation error for complex arrays**"
        !CALL MPI_Abort(MPI_COMM_WORLD,errcode,ierr)
      endif

    end subroutine complex_allocate


end module alloc
