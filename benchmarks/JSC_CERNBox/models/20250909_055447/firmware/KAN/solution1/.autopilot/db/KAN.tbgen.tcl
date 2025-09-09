set moduleName KAN
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type function
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {KAN}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ input_0 int 6 regular {pointer 0}  }
	{ input_1 int 6 regular {pointer 0}  }
	{ input_2 int 6 regular {pointer 0}  }
	{ input_3 int 6 regular {pointer 0}  }
	{ input_4 int 6 regular {pointer 0}  }
	{ input_5 int 6 regular {pointer 0}  }
	{ input_6 int 6 regular {pointer 0}  }
	{ input_7 int 6 regular {pointer 0}  }
	{ input_8 int 6 regular {pointer 0}  }
	{ input_9 int 6 regular {pointer 0}  }
	{ input_10 int 6 regular {pointer 0}  }
	{ input_11 int 6 regular {pointer 0}  }
	{ input_12 int 6 regular {pointer 0}  }
	{ input_13 int 6 regular {pointer 0}  }
	{ input_14 int 6 regular {pointer 0}  }
	{ input_15 int 6 regular {pointer 0}  }
	{ output_0 int 8 regular {pointer 1}  }
	{ output_1 int 8 regular {pointer 1}  }
	{ output_2 int 8 regular {pointer 1}  }
	{ output_3 int 8 regular {pointer 1}  }
	{ output_4 int 8 regular {pointer 1}  }
}
set hasAXIMCache 0
set hasAXIML2Cache 0
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "input_0", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "input_1", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "input_2", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "input_3", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "input_4", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "input_5", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "input_6", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "input_7", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "input_8", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "input_9", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "input_10", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "input_11", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "input_12", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "input_13", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "input_14", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "input_15", "interface" : "wire", "bitwidth" : 6, "direction" : "READONLY"} , 
 	{ "Name" : "output_0", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "output_1", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "output_2", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "output_3", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "output_4", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 27
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ input_0 sc_in sc_lv 6 signal 0 } 
	{ input_1 sc_in sc_lv 6 signal 1 } 
	{ input_2 sc_in sc_lv 6 signal 2 } 
	{ input_3 sc_in sc_lv 6 signal 3 } 
	{ input_4 sc_in sc_lv 6 signal 4 } 
	{ input_5 sc_in sc_lv 6 signal 5 } 
	{ input_6 sc_in sc_lv 6 signal 6 } 
	{ input_7 sc_in sc_lv 6 signal 7 } 
	{ input_8 sc_in sc_lv 6 signal 8 } 
	{ input_9 sc_in sc_lv 6 signal 9 } 
	{ input_10 sc_in sc_lv 6 signal 10 } 
	{ input_11 sc_in sc_lv 6 signal 11 } 
	{ input_12 sc_in sc_lv 6 signal 12 } 
	{ input_13 sc_in sc_lv 6 signal 13 } 
	{ input_14 sc_in sc_lv 6 signal 14 } 
	{ input_15 sc_in sc_lv 6 signal 15 } 
	{ output_0 sc_out sc_lv 8 signal 16 } 
	{ output_1 sc_out sc_lv 8 signal 17 } 
	{ output_2 sc_out sc_lv 8 signal 18 } 
	{ output_3 sc_out sc_lv 8 signal 19 } 
	{ output_4 sc_out sc_lv 8 signal 20 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "input_0", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "input_0", "role": "default" }} , 
 	{ "name": "input_1", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "input_1", "role": "default" }} , 
 	{ "name": "input_2", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "input_2", "role": "default" }} , 
 	{ "name": "input_3", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "input_3", "role": "default" }} , 
 	{ "name": "input_4", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "input_4", "role": "default" }} , 
 	{ "name": "input_5", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "input_5", "role": "default" }} , 
 	{ "name": "input_6", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "input_6", "role": "default" }} , 
 	{ "name": "input_7", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "input_7", "role": "default" }} , 
 	{ "name": "input_8", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "input_8", "role": "default" }} , 
 	{ "name": "input_9", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "input_9", "role": "default" }} , 
 	{ "name": "input_10", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "input_10", "role": "default" }} , 
 	{ "name": "input_11", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "input_11", "role": "default" }} , 
 	{ "name": "input_12", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "input_12", "role": "default" }} , 
 	{ "name": "input_13", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "input_13", "role": "default" }} , 
 	{ "name": "input_14", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "input_14", "role": "default" }} , 
 	{ "name": "input_15", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "input_15", "role": "default" }} , 
 	{ "name": "output_0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "output_0", "role": "default" }} , 
 	{ "name": "output_1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "output_1", "role": "default" }} , 
 	{ "name": "output_2", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "output_2", "role": "default" }} , 
 	{ "name": "output_3", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "output_3", "role": "default" }} , 
 	{ "name": "output_4", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "output_4", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84"],
		"CDFG" : "KAN",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "8", "EstimateLatencyMin" : "8", "EstimateLatencyMax" : "8",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_0", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_5", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_6", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_7", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_8", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_9", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_10", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_11", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_12", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_13", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_14", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_15", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_0", "Type" : "None", "Direction" : "O"},
			{"Name" : "output_1", "Type" : "None", "Direction" : "O"},
			{"Name" : "output_2", "Type" : "None", "Direction" : "O"},
			{"Name" : "output_3", "Type" : "None", "Direction" : "O"},
			{"Name" : "output_4", "Type" : "None", "Direction" : "O"},
			{"Name" : "lut_0_0_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_1_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_2_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_3_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_4_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_5_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_6_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_7_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_8_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_9_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_10_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_11_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_12_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_13_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_14_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_15_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_0_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_1_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_2_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_3_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_4_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_5_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_6_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_7_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_8_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_9_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_10_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_11_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_12_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_13_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_14_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_15_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_0_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_1_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_2_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_3_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_4_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_5_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_6_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_7_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_8_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_9_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_10_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_11_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_12_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_13_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_14_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_15_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_0_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_1_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_2_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_3_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_4_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_5_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_6_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_7_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_8_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_9_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_10_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_11_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_12_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_13_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_14_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_0_15_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_1_0_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_1_1_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_1_2_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_1_3_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_1_0_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_1_1_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_1_2_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_1_3_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_1_0_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_1_1_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_1_2_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_1_3_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_1_0_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_1_1_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_1_2_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_1_3_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_1_0_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_1_1_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_1_2_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "lut_1_3_4", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_0_0_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_1_0_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_2_0_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_3_0_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_4_0_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_5_0_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_6_0_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_7_0_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_8_0_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_9_0_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_10_0_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_11_0_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_12_0_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_13_0_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_14_0_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_15_0_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_0_1_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_1_1_U", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_2_1_U", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_3_1_U", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_4_1_U", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_5_1_U", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_6_1_U", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_7_1_U", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_8_1_U", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_9_1_U", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_10_1_U", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_11_1_U", "Parent" : "0"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_12_1_U", "Parent" : "0"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_13_1_U", "Parent" : "0"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_14_1_U", "Parent" : "0"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_15_1_U", "Parent" : "0"},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_0_2_U", "Parent" : "0"},
	{"ID" : "34", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_1_2_U", "Parent" : "0"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_2_2_U", "Parent" : "0"},
	{"ID" : "36", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_3_2_U", "Parent" : "0"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_4_2_U", "Parent" : "0"},
	{"ID" : "38", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_5_2_U", "Parent" : "0"},
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_6_2_U", "Parent" : "0"},
	{"ID" : "40", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_7_2_U", "Parent" : "0"},
	{"ID" : "41", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_8_2_U", "Parent" : "0"},
	{"ID" : "42", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_9_2_U", "Parent" : "0"},
	{"ID" : "43", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_10_2_U", "Parent" : "0"},
	{"ID" : "44", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_11_2_U", "Parent" : "0"},
	{"ID" : "45", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_12_2_U", "Parent" : "0"},
	{"ID" : "46", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_13_2_U", "Parent" : "0"},
	{"ID" : "47", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_14_2_U", "Parent" : "0"},
	{"ID" : "48", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_15_2_U", "Parent" : "0"},
	{"ID" : "49", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_0_3_U", "Parent" : "0"},
	{"ID" : "50", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_1_3_U", "Parent" : "0"},
	{"ID" : "51", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_2_3_U", "Parent" : "0"},
	{"ID" : "52", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_3_3_U", "Parent" : "0"},
	{"ID" : "53", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_4_3_U", "Parent" : "0"},
	{"ID" : "54", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_5_3_U", "Parent" : "0"},
	{"ID" : "55", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_6_3_U", "Parent" : "0"},
	{"ID" : "56", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_7_3_U", "Parent" : "0"},
	{"ID" : "57", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_8_3_U", "Parent" : "0"},
	{"ID" : "58", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_9_3_U", "Parent" : "0"},
	{"ID" : "59", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_10_3_U", "Parent" : "0"},
	{"ID" : "60", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_11_3_U", "Parent" : "0"},
	{"ID" : "61", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_12_3_U", "Parent" : "0"},
	{"ID" : "62", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_13_3_U", "Parent" : "0"},
	{"ID" : "63", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_14_3_U", "Parent" : "0"},
	{"ID" : "64", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_0_15_3_U", "Parent" : "0"},
	{"ID" : "65", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_1_0_0_U", "Parent" : "0"},
	{"ID" : "66", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_1_1_0_U", "Parent" : "0"},
	{"ID" : "67", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_1_2_0_U", "Parent" : "0"},
	{"ID" : "68", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_1_3_0_U", "Parent" : "0"},
	{"ID" : "69", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_1_0_1_U", "Parent" : "0"},
	{"ID" : "70", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_1_1_1_U", "Parent" : "0"},
	{"ID" : "71", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_1_2_1_U", "Parent" : "0"},
	{"ID" : "72", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_1_3_1_U", "Parent" : "0"},
	{"ID" : "73", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_1_0_2_U", "Parent" : "0"},
	{"ID" : "74", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_1_1_2_U", "Parent" : "0"},
	{"ID" : "75", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_1_2_2_U", "Parent" : "0"},
	{"ID" : "76", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_1_3_2_U", "Parent" : "0"},
	{"ID" : "77", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_1_0_3_U", "Parent" : "0"},
	{"ID" : "78", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_1_1_3_U", "Parent" : "0"},
	{"ID" : "79", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_1_2_3_U", "Parent" : "0"},
	{"ID" : "80", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_1_3_3_U", "Parent" : "0"},
	{"ID" : "81", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_1_0_4_U", "Parent" : "0"},
	{"ID" : "82", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_1_1_4_U", "Parent" : "0"},
	{"ID" : "83", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_1_2_4_U", "Parent" : "0"},
	{"ID" : "84", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lut_1_3_4_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	KAN {
		input_0 {Type I LastRead 0 FirstWrite -1}
		input_1 {Type I LastRead 0 FirstWrite -1}
		input_2 {Type I LastRead 0 FirstWrite -1}
		input_3 {Type I LastRead 0 FirstWrite -1}
		input_4 {Type I LastRead 0 FirstWrite -1}
		input_5 {Type I LastRead 0 FirstWrite -1}
		input_6 {Type I LastRead 0 FirstWrite -1}
		input_7 {Type I LastRead 0 FirstWrite -1}
		input_8 {Type I LastRead 0 FirstWrite -1}
		input_9 {Type I LastRead 0 FirstWrite -1}
		input_10 {Type I LastRead 0 FirstWrite -1}
		input_11 {Type I LastRead 0 FirstWrite -1}
		input_12 {Type I LastRead 0 FirstWrite -1}
		input_13 {Type I LastRead 0 FirstWrite -1}
		input_14 {Type I LastRead 0 FirstWrite -1}
		input_15 {Type I LastRead 0 FirstWrite -1}
		output_0 {Type O LastRead -1 FirstWrite 8}
		output_1 {Type O LastRead -1 FirstWrite 8}
		output_2 {Type O LastRead -1 FirstWrite 8}
		output_3 {Type O LastRead -1 FirstWrite 8}
		output_4 {Type O LastRead -1 FirstWrite 8}
		lut_0_0_0 {Type I LastRead -1 FirstWrite -1}
		lut_0_1_0 {Type I LastRead -1 FirstWrite -1}
		lut_0_2_0 {Type I LastRead -1 FirstWrite -1}
		lut_0_3_0 {Type I LastRead -1 FirstWrite -1}
		lut_0_4_0 {Type I LastRead -1 FirstWrite -1}
		lut_0_5_0 {Type I LastRead -1 FirstWrite -1}
		lut_0_6_0 {Type I LastRead -1 FirstWrite -1}
		lut_0_7_0 {Type I LastRead -1 FirstWrite -1}
		lut_0_8_0 {Type I LastRead -1 FirstWrite -1}
		lut_0_9_0 {Type I LastRead -1 FirstWrite -1}
		lut_0_10_0 {Type I LastRead -1 FirstWrite -1}
		lut_0_11_0 {Type I LastRead -1 FirstWrite -1}
		lut_0_12_0 {Type I LastRead -1 FirstWrite -1}
		lut_0_13_0 {Type I LastRead -1 FirstWrite -1}
		lut_0_14_0 {Type I LastRead -1 FirstWrite -1}
		lut_0_15_0 {Type I LastRead -1 FirstWrite -1}
		lut_0_0_1 {Type I LastRead -1 FirstWrite -1}
		lut_0_1_1 {Type I LastRead -1 FirstWrite -1}
		lut_0_2_1 {Type I LastRead -1 FirstWrite -1}
		lut_0_3_1 {Type I LastRead -1 FirstWrite -1}
		lut_0_4_1 {Type I LastRead -1 FirstWrite -1}
		lut_0_5_1 {Type I LastRead -1 FirstWrite -1}
		lut_0_6_1 {Type I LastRead -1 FirstWrite -1}
		lut_0_7_1 {Type I LastRead -1 FirstWrite -1}
		lut_0_8_1 {Type I LastRead -1 FirstWrite -1}
		lut_0_9_1 {Type I LastRead -1 FirstWrite -1}
		lut_0_10_1 {Type I LastRead -1 FirstWrite -1}
		lut_0_11_1 {Type I LastRead -1 FirstWrite -1}
		lut_0_12_1 {Type I LastRead -1 FirstWrite -1}
		lut_0_13_1 {Type I LastRead -1 FirstWrite -1}
		lut_0_14_1 {Type I LastRead -1 FirstWrite -1}
		lut_0_15_1 {Type I LastRead -1 FirstWrite -1}
		lut_0_0_2 {Type I LastRead -1 FirstWrite -1}
		lut_0_1_2 {Type I LastRead -1 FirstWrite -1}
		lut_0_2_2 {Type I LastRead -1 FirstWrite -1}
		lut_0_3_2 {Type I LastRead -1 FirstWrite -1}
		lut_0_4_2 {Type I LastRead -1 FirstWrite -1}
		lut_0_5_2 {Type I LastRead -1 FirstWrite -1}
		lut_0_6_2 {Type I LastRead -1 FirstWrite -1}
		lut_0_7_2 {Type I LastRead -1 FirstWrite -1}
		lut_0_8_2 {Type I LastRead -1 FirstWrite -1}
		lut_0_9_2 {Type I LastRead -1 FirstWrite -1}
		lut_0_10_2 {Type I LastRead -1 FirstWrite -1}
		lut_0_11_2 {Type I LastRead -1 FirstWrite -1}
		lut_0_12_2 {Type I LastRead -1 FirstWrite -1}
		lut_0_13_2 {Type I LastRead -1 FirstWrite -1}
		lut_0_14_2 {Type I LastRead -1 FirstWrite -1}
		lut_0_15_2 {Type I LastRead -1 FirstWrite -1}
		lut_0_0_3 {Type I LastRead -1 FirstWrite -1}
		lut_0_1_3 {Type I LastRead -1 FirstWrite -1}
		lut_0_2_3 {Type I LastRead -1 FirstWrite -1}
		lut_0_3_3 {Type I LastRead -1 FirstWrite -1}
		lut_0_4_3 {Type I LastRead -1 FirstWrite -1}
		lut_0_5_3 {Type I LastRead -1 FirstWrite -1}
		lut_0_6_3 {Type I LastRead -1 FirstWrite -1}
		lut_0_7_3 {Type I LastRead -1 FirstWrite -1}
		lut_0_8_3 {Type I LastRead -1 FirstWrite -1}
		lut_0_9_3 {Type I LastRead -1 FirstWrite -1}
		lut_0_10_3 {Type I LastRead -1 FirstWrite -1}
		lut_0_11_3 {Type I LastRead -1 FirstWrite -1}
		lut_0_12_3 {Type I LastRead -1 FirstWrite -1}
		lut_0_13_3 {Type I LastRead -1 FirstWrite -1}
		lut_0_14_3 {Type I LastRead -1 FirstWrite -1}
		lut_0_15_3 {Type I LastRead -1 FirstWrite -1}
		lut_1_0_0 {Type I LastRead -1 FirstWrite -1}
		lut_1_1_0 {Type I LastRead -1 FirstWrite -1}
		lut_1_2_0 {Type I LastRead -1 FirstWrite -1}
		lut_1_3_0 {Type I LastRead -1 FirstWrite -1}
		lut_1_0_1 {Type I LastRead -1 FirstWrite -1}
		lut_1_1_1 {Type I LastRead -1 FirstWrite -1}
		lut_1_2_1 {Type I LastRead -1 FirstWrite -1}
		lut_1_3_1 {Type I LastRead -1 FirstWrite -1}
		lut_1_0_2 {Type I LastRead -1 FirstWrite -1}
		lut_1_1_2 {Type I LastRead -1 FirstWrite -1}
		lut_1_2_2 {Type I LastRead -1 FirstWrite -1}
		lut_1_3_2 {Type I LastRead -1 FirstWrite -1}
		lut_1_0_3 {Type I LastRead -1 FirstWrite -1}
		lut_1_1_3 {Type I LastRead -1 FirstWrite -1}
		lut_1_2_3 {Type I LastRead -1 FirstWrite -1}
		lut_1_3_3 {Type I LastRead -1 FirstWrite -1}
		lut_1_0_4 {Type I LastRead -1 FirstWrite -1}
		lut_1_1_4 {Type I LastRead -1 FirstWrite -1}
		lut_1_2_4 {Type I LastRead -1 FirstWrite -1}
		lut_1_3_4 {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "8", "Max" : "8"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	input_0 { ap_none {  { input_0 in_data 0 6 } } }
	input_1 { ap_none {  { input_1 in_data 0 6 } } }
	input_2 { ap_none {  { input_2 in_data 0 6 } } }
	input_3 { ap_none {  { input_3 in_data 0 6 } } }
	input_4 { ap_none {  { input_4 in_data 0 6 } } }
	input_5 { ap_none {  { input_5 in_data 0 6 } } }
	input_6 { ap_none {  { input_6 in_data 0 6 } } }
	input_7 { ap_none {  { input_7 in_data 0 6 } } }
	input_8 { ap_none {  { input_8 in_data 0 6 } } }
	input_9 { ap_none {  { input_9 in_data 0 6 } } }
	input_10 { ap_none {  { input_10 in_data 0 6 } } }
	input_11 { ap_none {  { input_11 in_data 0 6 } } }
	input_12 { ap_none {  { input_12 in_data 0 6 } } }
	input_13 { ap_none {  { input_13 in_data 0 6 } } }
	input_14 { ap_none {  { input_14 in_data 0 6 } } }
	input_15 { ap_none {  { input_15 in_data 0 6 } } }
	output_0 { ap_none {  { output_0 out_data 1 8 } } }
	output_1 { ap_none {  { output_1 out_data 1 8 } } }
	output_2 { ap_none {  { output_2 out_data 1 8 } } }
	output_3 { ap_none {  { output_3 out_data 1 8 } } }
	output_4 { ap_none {  { output_4 out_data 1 8 } } }
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
