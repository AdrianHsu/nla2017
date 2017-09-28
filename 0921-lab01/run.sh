g++ lab01_ex.cpp -c  -m64 -I${MKLROOT}/include -I${CUDADIR}/include -std=c++11
g++ lab01.o -o lab01  -L${MKLROOT}/lib/intel64 -Wl,--no-as-needed \
-lmkl_intel_lp64 -lmkl_gnu_thread -lmkl_core -lgomp -lpthread -lm -ldl \
-L${CUDADIR}/lib64 -lcudart -lcublas
./lab01
