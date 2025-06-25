module triggering(
    input clk,
    input trig,
    input [7:0] din,
    output reg [7:0] dout,
    output reg crfm    //confirm
);

    always @(posedge clk) 
    begin
        if (trig) 
        
        begin
            dout <= din;
            //crfm <= 1;
        end
        
        else
        begin
        dout<=0;
        end
  end     
  
  

  
  always @(*)
begin

if (dout==din)
begin
crfm<=1;
end

else
begin
crfm<=0;
end

end 

endmodule


















