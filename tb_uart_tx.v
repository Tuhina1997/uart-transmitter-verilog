
module tb_uart_tx;

reg clk;
reg rst;
reg tx_start;
reg [7:0] tx_data;

wire tx;
wire tx_busy;

uart_tx mod1(
    .clk(clk),
    .rst(rst),
    .tx_start(tx_start),
    .tx_data(tx_data),
    .tx(tx),
    .tx_busy(tx_busy)

);
initial
begin
    clk = 1'b0;
end

always
begin
    #5 clk = ~clk;
end

initial
begin
    rst = 1'b1;
    tx_start = 1'b0;
    tx_data = 8'b00000000;

    #20;

    rst = 1'b0;
    tx_data = 8'b10110010;
    tx_start = 1'b1;
     
     #10;
     tx_start = 1'b0;

    #150;
    $finish;

end 

endmodule