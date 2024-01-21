#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "altera_avalon_timer_regs.h"
#include "altera_avalon_timer.h"
#include "sys/alt_stdio.h"
#include "sys/alt_sys_init.h"
#include "alt_types.h"
#include "io.h"
#include "unistd.h"
#include "stdio.h"
#include "sys/alt_irq.h"

volatile __uint16_t valu;
volatile __uint16_t vald;
volatile __uint16_t valc;

static void irqhandler_timer(void* context, alt_u32 id)
{
	valu = valu +1;
	if (valu == 10)
	{
		valu = 0;
		vald = vald + 1;
		if (vald == 10)
		{
			vald = 0;
			valc = valc + 1;
			if (valc == 10)
			{
				valc = 0;
			}
		}
	}
	IOWR_ALTERA_AVALON_PIO_DATA(PIO7SEG0_BASE, valu);
	IOWR_ALTERA_AVALON_PIO_DATA(PIO7SEG1_BASE, vald);
	IOWR_ALTERA_AVALON_PIO_DATA(PIO7SEG2_BASE, valc);
	IOWR_ALTERA_AVALON_TIMER_STATUS(TIMER_0_BASE, 0x01);
}
	
	

int main(void)
{
	valu=0;
	vald=0;
	valc=0;
	IOWR_ALTERA_AVALON_PIO_DATA(PIO7SEG0_BASE, valu);
	IOWR_ALTERA_AVALON_PIO_DATA(PIO7SEG1_BASE, vald);
	IOWR_ALTERA_AVALON_PIO_DATA(PIO7SEG2_BASE, valc);
	IORD_ALTERA_AVALON_TIMER_CONTROL(TIMER_0_BASE);
	alt_irq_register(TIMER_0_IRQ, NULL, irqhandler_timer);
	while(1)
	{
	}
}

