module uart_tx(
    input clk,
    input rst,
    input tx_start,
    input [7:0] tx_data,

    output reg tx,
    output reg tx_busy
);
parameter IDLE = 2'b00;
parameter START = 2'b01;
parameter DATA = 2'b10;
parameter STOP = 2'b11;

reg [1:0] state ;
reg [7:0] data_reg ;
reg [2:0] bit_counter;


always @(posedge clk)
begin
    if (rst)
    begin
        state <= IDLE;
        tx_busy <= 1'b0;
        tx <= 1'b1;
        bit_counter <= 3'b000;
        
    end
    
    else
    begin
        case(state)
        IDLE:
        begin
            
            tx <= 1'b1;

            if(tx_start)
            begin
                data_reg  <= tx_data;
                tx_busy <= 1'b1;
                bit_counter <= 3'd0;
                state <= START;
            end
            else
            tx_busy <= 1'b0;
         end

        START:
        begin
                tx <= 1'b0;
                state <= DATA ; 
        end
            DATA:
            begin
                tx <= data_reg[bit_counter];
            
                if (bit_counter == 3'b111)
                begin
                state <= STOP;
                bit_counter <= 3'b000;
                end
                else
                bit_counter <= bit_counter+1;
                end

            STOP:
            begin
                tx <= 1'b1;
                state <= IDLE ;
                tx_busy <= 1'b0;
            end

            endcase
        end

end

endmodule
