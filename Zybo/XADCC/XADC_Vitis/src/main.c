#include "xsysmon.h"
#include "xparameters.h"
#include "xstatus.h"
#include "xil_exception.h"
#include "xil_printf.h"
#include "sleep.h"



#define C_BASEADDR 0x43C00000

int main(){
	u16 data = 1;
	u16 data6 = 0;
	u16 data7 = 0;
	u16 data14 = 0;
	u16 data15 = 0;


	while(1){
		//data6 = Xil_In32(C_BASEADDR + 0x258);
		//data7 = Xil_In32(C_BASEADDR + 0x25C);
		data14 = Xil_In32(C_BASEADDR + 0x278);
		data15 = Xil_In32(C_BASEADDR + 0x27C);
		data = Xil_In32(C_BASEADDR + 0x20C); // VP/VN register

		//conversion a mV
		data = (data*0.0152588);
		//data6 = (data6*0.0152588);
		//data7 = (data7*0.0152588);
		data14 = (data14*0.0152588);
		data15 = (data15*0.0152588);

		//serial print
		//xil_printf("data6 = %03dmv\n\r", data6);
		//xil_printf("data7 = %03dmv\n\r", data7);
		xil_printf("data14 = %03dmv\n\r", data14);
		xil_printf("data15 = %03dmv\n\r", data15);

		usleep(100000);

	}

}
