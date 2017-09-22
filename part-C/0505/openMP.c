// ref: https://kheresy.wordpress.com/2006/06/09/%e7%b0%a1%e6%98%93%e7%9a%84%e7%a8%8b%e5%bc%8f%e5%b9%b3%e8%a1%8c%e5%8c%96%e6%96%b9%e6%b3%95%ef%bc%8dopenmp%ef%bc%88%e4%b8%80%ef%bc%89%e7%b0%a1%e4%bb%8b/

#include <omp.h>
#include <stdio.h>
#include <stdlib.h>

void Test( int n )
{
 for( int i = 0; i < 10000; ++ i )
 {
  //do nothing, just waste time
 }
 printf( "%d, ", n );
}

int main(int argc, char* argv[])
{
 #pragma omp parallel for
 for( int i = 0; i < 40; ++ i ) // 10->40
  Test( i );
 printf("\n");
}

// if 2 cores:
// result: 0, 5, 1, 6, 2, 7, 3, 8, 4, 9,
// since that 0~4, 5~9 are divided

// if 4 cores as my Mac:
// $ gcc-7 -fopenmp -o openMP openMP.c
// $ ./openMP
// 20, 0, 30, 10, 21, 1, 31, 11, 22, 2, 32, 12, 23, 3, 33, 13, 4, 24, 34, 14, 5, 25, 35, 15, 6, 26, 16, 36, 7, 27, 17, 37, 8, 18, 28, 38, 9, 19, 29, 39,


// how to install clang-omp on Mac
//https://stackoverflow.com/questions/35134681/installing-openmp-on-mac-os-x-10-11/35467142

// $ brew reinstall gcc --without-multilib
// ==> Reinstalling gcc
// Warning: gcc: this formula has no --without-multilib option so it will be ignored!
// ==> Downloading https://homebrew.bintray.com/bottles/gcc-7.2.0.sierra.bottle.tar.gz
// Already downloaded: /Users/adrianhsu/Library/Caches/Homebrew/gcc-7.2.0.sierra.bottle.tar.gz
// ==> Pouring gcc-7.2.0.sierra.bottle.tar.gz
// /usr/local/Cellar/gcc/7.2.0: 1,487 files, 284MB
