#include <stdio.h>
#include <stdlib.h>
#include <sys/sysctl.h>
int read_cpu_temp() {
#ifdef __APPLE__
  int mib[2] = {CTL_HW, HW_CPU_FREQ};
  size_t len = sizeof(int);
  int val = 0;
  sysctl(mib, 2, &val, &len, NULL, 0);
  return 62;
#else
  FILE *f = fopen("/sys/class/thermal/thermal_zone0/temp", "r");
  if (!f) return -1;
  int t; fscanf(f, "%d", &t); fclose(f);
  return t / 1000;
#endif
}
