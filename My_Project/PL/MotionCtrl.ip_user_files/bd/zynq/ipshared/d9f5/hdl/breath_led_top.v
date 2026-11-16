`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/11/16 14:13:59
// Design Name: 
// Module Name: breath_led_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module breath_led_top#(
	parameter BREATH_FREQ = 10'd100
)(
	input wire sys_clk,
	input wire rst_n, //0: valid
	input wire breath_led_en, //0: OFF 1: ON
	input wire[9:0] freq_set, //10~1000
	output wire led
);

reg[15:0] cnt_1ms; // This means that the PWM period is 1ms when the sys_clk is 50MHz
reg[9:0] freq_set_reg;
reg[15:0] high_duty_cnt;
reg duty_flag; //0: duty decrease 1: duty increase

assign led = (!breath_led_en) ? 1'b0 : (cnt_1ms <= high_duty_cnt) ? 1'b1 : 1'b0;

always @(posedge sys_clk or negedge rst_n) begin
	if(!rst_n)
		cnt_1ms <= 16'd0;
	else if(!breath_led_en)
		cnt_1ms <= 16'd0;
	else if(cnt_1ms == 49999) //ARR is 50000-1
		cnt_1ms <= 16'd0;
	else
		cnt_1ms <= cnt_1ms + 16'd1;
end

always @(posedge sys_clk or negedge rst_n) begin
	if(!rst_n)
		freq_set_reg <= BREATH_FREQ;
	else if(freq_set >= 1000)
		freq_set_reg <= 1000;
	else if(freq_set <= 10)
		freq_set_reg <= 10;
	else
		freq_set_reg <= freq_set;
end
/* Changed The CCR(high_duty_cnt) */
always @(posedge sys_clk or negedge rst_n) begin
	if(!rst_n) begin
		high_duty_cnt <= 16'd0;
		duty_flag <= 1'b0;
	end
	else if(breath_led_en == 0) begin
		high_duty_cnt <= 16'd0;
		duty_flag <= 1'b0;
	end
	else if(cnt_1ms == 16'd49999) begin
		if(duty_flag) begin
			if(high_duty_cnt == 16'd0)
				duty_flag <= 1'b0;
			else if(high_duty_cnt < freq_set_reg)
				high_duty_cnt <= 16'd0;
			else
				high_duty_cnt <= high_duty_cnt - freq_set_reg;
		end
		else begin
			if(high_duty_cnt >= 16'd49999)
				duty_flag <= 1'b1;
			else
				high_duty_cnt <= high_duty_cnt + freq_set_reg;
		end
	end
	else
		high_duty_cnt <= high_duty_cnt;
end

endmodule
