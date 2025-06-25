`timescale 1ns / 1ps

module tb_triggering;

    reg clk = 0;
    reg trig = 0;
    reg [7:0] din = 8'b0;
    wire [7:0] dout;
    wire crfm;

    triggering uut (.clk(clk), .trig(trig), .din(din), .dout(dout), .crfm(crfm) );

    always #5 clk = ~clk;

    initial begin
        $display("Time\t clk\t trig\t din\t dout\t crfm");
        $monitor("%0t\t %b\t %b\t %h\t %h\t %b", $time, clk, trig, din, dout, crfm);

        #10 din = 8'hA1; trig = 1;  
        #10 trig = 0;

        #10 din = 8'h3C; trig = 0;  
        #10;

        #10 trig = 1;               
        #10 trig = 0;

        #10 din = 8'hFF;
        #10 trig = 1;               
        #10;

        #20 $finish;
    end

endmodule
