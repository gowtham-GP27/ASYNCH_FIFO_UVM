class environment extends uvm_env;
	`uvm_component_utils(environment)
	wagent wa;
	ragent ra;
  fifo_scoreboard sc;
	fifo_sequencer vsqr;
	function new(string name = "environment",uvm_component parent = null);
		super.new(name,parent);
	endfunction
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		wa=wagent::type_id::create("wa");
		ra=ragent::type_id::create("ra");
		sc=fifo_scoreboard::type_id::create("sc");
		vsqr=fifo_sequencer::type_id::create("vsqr");
	endfunction
	function void connect_phase(uvm_phase phase);
		wa.wmon.wmon_port.connect(sc.swport.analysis_export);
	  ra.rmon.rmon_port.connect(sc.srport.analysis_export);
	endfunction
endclass
