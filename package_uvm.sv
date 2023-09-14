
//This package includes all the files in the testbench architecture 
//which will be imported in the top module
package package_uvm;
  `include "f_sequence_item.sv"
  `include "f_sequence.sv"
  `include "f_sequencer.sv"
  `include "f_driver.sv"
  `include "f_monitor.sv"
  `include "f_scoreboard.sv"
  `include "f_agent.sv"
  `include "f_environment.sv"
  `include "f_test.sv"
endpackage
