#include <stdio.h>

#define LITTLE_ENDIAN 0
#define BIG_ENDIAN 1

int is_big_endian(void) {
  short int word = 0x0001;
  char *byte = (char *) &word;
  return(byte[0] ? LITTLE_ENDIAN : BIG_ENDIAN);
}

int main() {
  if(is_big_endian()) printf("BIG ENDIAN\n");
  else printf("LITTLE ENDIAN\n");
  return 0;
}
