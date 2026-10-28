// module mux(
//     input wire in1,
//     input wire in2,
//     input wire sel,
//     output reg mux_out
// );

// always@(*)
//     if(sel == 1'b1)
//         mux_out = in1;
//     else
//         mux_out = in2;

// endmodule

module mux(
    input wire in1,
    input wire in2,
    input wire sel,
    output wire mux_out
);

assign mux_out = (sel == 1'b1) ? in1 : in2;

endmodule
