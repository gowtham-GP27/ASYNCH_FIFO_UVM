class wsequencer extends uvm_sequencer#(write_item);
	`uvm_component_utils(wsequencer);
	function new(string name="wsequencer",uvm_component parent);
		super.new(name,parent);
	endfunction
endclass
class rsequencer extends uvm_sequencer#(read_item);
	`uvm_component_utils(rsequencer);
	function new(string name = "rsequencer",uvm_component parent);
		super.new(name,parent);
	endfunction
endclass
