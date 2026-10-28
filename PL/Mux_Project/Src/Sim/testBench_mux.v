`timescale 1ns/1ns

module tb_mux();

reg in1;
reg in2;
reg sel;

wire out; //TestBench中待测试RTL模块的输出永远是wire型变量

initial
    begin
        in1 <= 1'b0;
        in2 <= 1'b0;
        sel <= 1'b0;
    end

always #10 in1 <= {$random} % 2;
always #10 in2 <= {$random} % 2;
always #10 sel <= {$random} % 2;

initial
    begin
        $timeformat(-9, 0, "ns", 6);
        $monitor("@time %t: in1=%b in2=%b sel=%b out=%b", $time, in1, in2, sel, out);
    end

mux mux_inst(
    .in1(in1),
    .in2(in2),
    .sel(sel),
    .mux_out(out)
);

endmodule
