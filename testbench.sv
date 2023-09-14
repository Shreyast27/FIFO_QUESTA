import uvm_pkg::*;
`include "uvm_macros.svh"
`include "f_interface.sv"
`include "f_test.sv"
//'include "package_uvm.sv"
module tb;
  bit clk;
  bit rstn;
  
  always #5 clk = ~clk;
  
  initial begin
    clk = 1;
   rstn = 1;
    #5;
    rstn = 0;
  end
  
  f_interface tif(clk, rstn);
  
  SYN_FIFO dut(.clk(tif.clk),
               .reset(tif.rstn),
               .data_in(tif.i_wrdata),
               .wr(tif.i_wren),
               .rd(tif.i_rden),
               .full(tif.o_full),
               .empty(tif.o_empty),
//                .almost_full(tif.o_alm_full),
//                .almost_empty(tif.o_alm_empty),
               .data_out(tif.o_rddata));
  
  initial begin
    uvm_config_db#(virtual f_interface)::set(null, "", "vif", tif);
    $dumpfile("dump.vcd"); 
    $dumpvars;
    run_test("f_test");
  end
  
endmodule