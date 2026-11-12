`timescale 1ns/1ns

module tb_pl_led_blink;

    /* ---------------- 信号 ---------------- */
    reg  sys_clk;
    reg  key_stop;
    wire led_out;

    initial sys_clk = 1'b0;
    always #10 sys_clk = ~sys_clk;        // 半周期 10ns → 50 MHz

    /* ---------------- 待测模块 ---------------- */
    pl_led_blink #(
        .CNT_MAX (25'd24)                 // 仿真缩小分频：25 拍翻转一次 = 500ns
    ) u_dut (
        .sys_clk  (sys_clk),
        .key_stop (key_stop),
        .led_out  (led_out)
    );

    /* ---------------- 按键激励 ---------------- */
initial begin
    key_stop = 1'b1;

    #5000;  key_stop = 1'b0;   // 按一次
    #3000;  key_stop = 1'b1;   // 松开继续
    #5000;

    key_stop = 1'b0;   #300;   // 短按 300ns
    key_stop = 1'b1;   #3000;

    key_stop = 1'b0;   #500;   // 按一个翻转周期
    key_stop = 1'b1;   #3000;

    key_stop = 1'b0;   #10000; // 长按 10us
    key_stop = 1'b1;   #5000;

    key_stop = 1'b0;   #300;   // 连按 3 下
    key_stop = 1'b1;   #300;
    key_stop = 1'b0;   #300;
    key_stop = 1'b1;   #300;
    key_stop = 1'b0;   #300;
    key_stop = 1'b1;   #5000;

    $finish;
end

endmodule