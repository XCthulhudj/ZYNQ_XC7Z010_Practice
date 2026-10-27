`timescale 1ns/1ns

module tb_led();

wire led_out;

led led_inst(
    .led_out(led_out)
);

initial begin
    #100;
    $finish;
end

endmodule
