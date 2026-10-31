#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "bumperfort.h"
int main() {
  int n = 100000;
  clock_t start = clock();
  for (int i=0;i<n;i++) {
    float a[4]={1,2,3,4}, b[4]={1,0,0,0};
    bumper_cosine(a,b,4);
  }
  double ms = (double)(clock()-start)/CLOCKS_PER_SEC*1000.0;
  printf("Processed %d vectors in %.2f ms (%.0f vec/s)\n", n, ms, n/(ms/1000.0));
  return 0;
}
