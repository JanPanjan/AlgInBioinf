#include <stdio.h>

int main() {
  /*
   * Zapisovanje ACGT v datoteko.
   * Pričakujem velikost 4x8=32-bitov
   */
  FILE *char_file = fopen("datoteke/acgt.txt", "w");
  if (char_file == NULL) {
    perror("napaka pri odpiranju datoteke 'acgt.txt'\n");
    return 1;
  }
  fprintf(char_file, "ACGT");
  fclose(char_file);
  printf("zaporedje 'ACGT' zapisano v datoteko 'acgt.txt'\n");

  /*
   * Zapisovanje 00100111 v datoteko.
   * Pričakujem velikost 8x1=8-bitov
   * Zapisati moramo v binarno datoteko.
   */
  FILE *bit_file = fopen("datoteke/biti.bin", "wb");
  if (bit_file == NULL) {
    perror("napaka pri odpiranju datoteke 'biti.bin'\n");
    return 1;
  }
  /*
   * Zaporedje predstavimo kot en bajt.
   * Spodnje število je binarna predstavitev števila 39 v decimalnem sistemu.
   */
  unsigned char biti = 0b00100111;
  fwrite(&biti, sizeof(unsigned char), 1, bit_file);
  fclose(bit_file);
  printf("zaporedje 00100111 zapisano v datoteko 'biti.bin'\n");

  return 0;
}
