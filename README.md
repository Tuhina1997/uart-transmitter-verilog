# UART Transmitter using Verilog

The goal of this project was to understand how UART transmission works and to implement a simple UART Transmitter using a Finite State Machine (FSM). 
The design was written in Visual Studio Code and verified through simulation using Xilinx Vivado.

## What the project does

The transmitter converts 8-bit parallel data into serial data by transmitting:

- 1 Start bit
- 8 Data bits (LSB first)
- 1 Stop bit

The design consists of four FSM states:

- IDLE
- START
- DATA
- STOP

## Files

- **uart_tx.v** – UART transmitter RTL
- **tb_uart_tx.v** – Verilog testbench used for simulation

## Inputs

- clk - System clock
- rst - Active high reset
- tx_start - Starts the transmission
- tx_data - 8-bit data to be transmitted

## Outputs

- tx - Serial output
- tx_busy - Indicates whether transmitter is busy

## Tools Used

- VS Code
- Xilinx Vivado

