#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "sys/alt_stdio.h"
#include "sys/alt_sys_init.h"
#include "alt_types.h"
#include "io.h"
#include "unistd.h"
#include "stdio.h"
#include "sys/alt_irq.h"

volatile __uint16_t val;

int main(void)
{
	val=0;
	while(1)
	{
		IOWR_ALTERA_AVALON_PIO_DATA(PIO7SEG0_BASE, val);
		usleep(1000000);
		val = val +1;
		if (val == 10)
		{
			val = 0;
		}
	}
}