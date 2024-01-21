
module lacheze_lab2_qsys (
	clk_clk,
	pio7seg0_external_connection_export,
	pio7seg1_external_connection_export,
	pio7seg2_external_connection_export,
	reset_reset_n);	

	input		clk_clk;
	output	[3:0]	pio7seg0_external_connection_export;
	output	[3:0]	pio7seg1_external_connection_export;
	output	[3:0]	pio7seg2_external_connection_export;
	input		reset_reset_n;
endmodule
