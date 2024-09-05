module LFSR(
    input clock,
    input reset,
  output [15:0] rnd 
    );

  wire feedback = rnd[15] ^ rnd[3] ^ rnd[2] ^ rnd[0]; 

  reg [15:0] random;

always @ (posedge clock or posedge reset)
begin
    if (reset)
        random <= 16'hF; 
    else
      random <= {random[14:0], feedback}; 
end

assign rnd = random;

endmodule