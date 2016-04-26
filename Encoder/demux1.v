module demux(
input [64:1]din,
output reg dout
);

         
always @(din) begin
	integer i ;
	for( i=1; i<65; i=i+1 ) begin 
		  dout <= #1 din(i);
	end
end
endmodule