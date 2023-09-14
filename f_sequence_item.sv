class f_sequence_item extends uvm_sequence_item;
rand bit i_wren;
rand bit i_rden;
rand bit[127:0]i_wrdata;
bit[127:0]o_rddata;
bit o_full;
bit o_empty;
bit o_alm_full;
bit o_alm_empty;

`uvm_object_utils_begin(f_sequence_item)
`uvm_field_int(i_wren, UVM_ALL_ON)
 `uvm_field_int(i_rden, UVM_ALL_ON)
`uvm_field_int(i_wrdata, UVM_ALL_ON)
`uvm_field_int(o_rddata, UVM_ALL_ON)
`uvm_field_int(o_full, UVM_ALL_ON)
`uvm_field_int(o_empty, UVM_ALL_ON)
`uvm_field_int(o_alm_full, UVM_ALL_ON)
`uvm_field_int(o_alm_empty, UVM_ALL_ON)
`uvm_object_utils_end

function new(string name="f_sequence_item");
super.new(name);
endfunction
  function void pre_randomize();
    if(i_rden)
      i_wrdata.rand_mode(0);
  endfunction
  
function string convert2string();
  return $psprintf("i_wren=%0d,i_rden=%0d,i_wrdata=%0d,o_rddata=%0d,o_full=%od,o_empty=%0d,o_alm_full=%od,o_alm_empty=%0d",i_wren,i_rden,i_wrdata,o_rddata,o_full,o_empty,o_alm_full,o_alm_empty);
  endfunction
  
constraint c1 {
  i_wren!=i_rden;
  }
endclass