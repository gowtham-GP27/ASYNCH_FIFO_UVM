interface intf(input bit wclk,rclk)
	logic [7:0] wdata;
	logic winc,wrst_n;
	logic wfull;
	logic rinc,rrst_n;
	logic rempty;
	logic [7:0]rdata;
	clocking wdriver_cb(@posedge wclk)
		default input #0 output #0;
		output wdata;
		output winc;
		output wrst_n;
	endclocking
	clocking wmonitor_cb(@posedge wclk)
		default input #0 output #0;
		input wfull;
		input wdata;
		input wrst_n;
		input winc;
	endclocking
	clocking rdriver_cb(@posedge rclk)
		default input #0 output #0;
		output rinc;
		output rrst_n;
	endclocking
	clocking rmonitor_cb(@posedge rclk)
		default input #0 output #0;
		input rdata;
		input rempty;
		input rinc;
		input rrst_n;
	endclocking
endinterface
