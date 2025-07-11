/*Copyright 2019-2021 T-Head Semiconductor Co., Ltd.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/
// #include "stdio.h"

// int main (void)
// {

// //Section 1: Hello World!
//   printf("\nHello Southeast University!?\n");
//   printf("Welcome to 10000x CPU Verification!\n");

// //Section 2: Embeded ASM in C 
//   int a;
//   int b;
//   int c;
//   a=1;
//   b=2;
//   c=0;
//   printf("\na is %d!\n",a);
//   printf("b is %d!\n",b);
//   printf("c is %d!\n",c);

// asm(
//     "mv  x5,%[a]\n"
//     "mv  x6,%[b]\n"
//     "label_add:"
//     "add  %[c],x5,x6\n"
//     :[c]"=r"(c)
//     :[a]"r"(a),[b]"r"(b)
//     :"x5","x6"
//     );

// if(c == 3)
//   printf("!!! PASS !!!");
// else
//   printf("!!! FAIL !!!");
//   printf("after ASM c is changed to %d!\n",c);

//   return 0;
// }

// Using UART to print

#include "datatype.h"
#include "uart.h"
#include "config.h"

/* UART device instance */
t_ck_uart_device uart0 = {0xFFFF};

/* helper: output a string */
static void uart_puts(const char *s) {
    while (*s) {
        ck_uart_putc(&uart0, (uint8_t)*s++);
    }
}

/* helper: output an integer (simple decimal) */
static void uart_putint(int val) {
    char buf[12];
    int i = 0;
    if (val == 0) {
        ck_uart_putc(&uart0, '0');
        return;
    }
    if (val < 0) {
        ck_uart_putc(&uart0, '-');
        val = -val;
    }
    while (val && i < (int)sizeof(buf)) {
        buf[i++] = (char)('0' + (val % 10));
        val /= 10;
    }
    while (i) {
        ck_uart_putc(&uart0, (uint8_t)buf[--i]);
    }
}

int main (void)
{
  /* UART init */
  t_ck_uart_cfig uart_cfig;
  uart_cfig.baudrate = BAUD;      /* from config.h (19200) */
  uart_cfig.parity   = PARITY_NONE;
  uart_cfig.stopbit  = STOPBIT_1;
  uart_cfig.wordsize = WORDSIZE_8;
  uart_cfig.rxmode   = ENABLE;
  uart_cfig.txmode   = ENABLE;

  ck_uart_open(&uart0, 0);
  ck_uart_init(&uart0, &uart_cfig);

//Section 1: Hello World!
  uart_puts("\nHello Southeast University!?\n");
  uart_puts("Welcome to 10000x CPU Verification!\n");

//Section 2: Embeded ASM in C 
  int a;
  int b;
  int c;
  a=1;
  b=2;
  c=0;
  uart_puts("\na is "); uart_putint(a); uart_puts("!\n");
  uart_puts("b is ");  uart_putint(b); uart_puts("!\n");
  uart_puts("c is ");  uart_putint(c); uart_puts("!\n");

asm(
    "mv  x5,%[a]\n"
    "mv  x6,%[b]\n"
    "label_add:"
    "add  %[c],x5,x6\n"
    :[c]"=r"(c)
    :[a]"r"(a),[b]"r"(b)
    :"x5","x6"
    );

if(c == 3)
  uart_puts("!!! PASS !!!");
else
  uart_puts("!!! FAIL !!!");
  uart_puts("after ASM c is changed to "); uart_putint(c); uart_puts("!\n");

  /* wait for TX complete */
  while (ck_uart_status(&uart0));

  ck_uart_close(&uart0);

  return 0;
}
