module half_adder(
    input wire in1,
    input wire in2,
    output wire sum,
    output wire cout
);

assign sum = in1 ^ in2;
assign cout = in1 & in2;

endmodule
