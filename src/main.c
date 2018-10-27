#include <stdio.h>
#include <stdbool.h>
#include "main.h"

int main(void)
{
    int bit_num = 0;

    printf("Hello World!\n");
    /* Little or Big Endian */
    printf("Endian Type: %s Endian\n", (is_little_endian()) ? "Little" : "Big");
    /* 64-bit or 32-bit */
    get_bit_num(&bit_num);
    printf("Bit: %d Bit\n", bit_num);
    /* ARCH */
    return 0;
}

bool is_little_endian()
{
    bool is_little = false;
    int n = 1;
    /* if true, little endian */
    if (*(char *)&n == 1) {
        is_little = true;
    }
    return is_little;
}

/*
 * how to find if the machine is 32bit or 64bit
 * https://stackoverflow.com/questions/2401756
 */
bool get_bit_num(int *bit_num)
{
    bool status = true;
    switch (sizeof(void*)) {
    case 4:
        *bit_num = 4 * 8;
        break;
    case 8:
        *bit_num = 8 * 8;
        break;
    default:
        status = false;
    }
    return status;
}
