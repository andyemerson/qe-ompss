#
module purge 
module load autoload intel intelmpi mkl
module use $HOME/my_modules
module load ompss
#
# default
# mpirun -np 4 ./fft_test.x -ecutwfc 80 -alat 13  -nbnd 1 -ntg 1

mpirun -np 8 ./fft_test.x -ecutwfc 80 -alat 20  -nbnd 128 -ntg 8
