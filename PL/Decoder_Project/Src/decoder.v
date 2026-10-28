// module decoder(
//     input wire in1,
//     input wire in2,
//     input wire in3,
//     output reg [7:0] decoder_out
// );

// always@(*)
//     if(in1 == 1'b0 && in2 == 1'b0 && in3 == 1'b0)
//         decoder_out = 8'b0000_0001;
//     else if(in1 == 1'b0 && in2 == 1'b0 && in3 == 1'b1)
//         decoder_out = 8'b0000_0010;
//     else if(in1 == 1'b0 && in2 == 1'b1 && in3 == 1'b0)
//         decoder_out = 8'b0000_0100;
//     else if(in1 == 1'b0 && in2 == 1'b1 && in3 == 1'b1)
//         decoder_out = 8'b0000_1000;
//     else if(in1 == 1'b1 && in2 == 1'b0 && in3 == 1'b0)
//         decoder_out = 8'b0001_0000;
//     else if(in1 == 1'b1 && in2 == 1'b0 && in3 == 1'b1)
//         decoder_out = 8'b0010_0000;
//     else if(in1 == 1'b1 && in2 == 1'b1 && in3 == 1'b0)
//         decoder_out = 8'b0100_0000;
//     else if(in1 == 1'b1 && in2 == 1'b1 && in3 == 1'b1)
//         decoder_out = 8'b1000_0000;
//     else
//         decoder_out = 8'b0000_0000;

// endmodule

module decoder(
    input wire in1,
    input wire in2,
    input wire in3,
    output reg [7:0] decoder_out
);

always @(*) begin
    case ({in1, in2, in3}) //{}拼接
        3'b000: decoder_out = 8'b0000_0001;
        3'b001: decoder_out = 8'b0000_0010;
        3'b010: decoder_out = 8'b0000_0100;
        3'b011: decoder_out = 8'b0000_1000;
        3'b100: decoder_out = 8'b0001_0000;
        3'b101: decoder_out = 8'b0010_0000;
        3'b110: decoder_out = 8'b0100_0000;
        3'b111: decoder_out = 8'b1000_0000;
        default: decoder_out = 8'b0000_0000;
    endcase
end

endmodule

