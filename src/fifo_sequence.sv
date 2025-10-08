class write_sequence extends uvm_sequence#(write_item);
	write_item req;
	`uvm_object_utils(write_sequence)
	function new(string name = "write_sequence");
		super.new("write_sequence");
	endfunction
task body();
	req=write_item::type_id::create("req");
	wait_for_grant();
	req.randomize();
	send_request(req);
	wait_for_item_done();
	end
endtask
endclass
class read_sequence extends uvm_sequence;
	`uvm_object_utils(read_sequence)
	read_item ritem;
	function new(string name = "read_sequence")
		super.new(name);
	endfunction
	task body();
		ritem=read_item::type_id::create("ritem");
		wait_for_grant();
		ritem.randomize();
		send_request(ritem);
		wait_for_item_done();
		end
	endtask
endclass
class virtual_seq extends uvm_sequence;
	`uvm_object_utils(virtual_seq)
	`uvm_declare_p_sequencer(virtual_seq);
	read_sequence rseq;
	write_sequence wseq;
	function new(string name = "virtual_seq");
		super.new(name);
	endfunction
	task body();
		rseq=read_sequence::type_id::create("rseq");
		wseq=write

