SIM ?= verilator
TOPLEVEL_LANG = verilog
VERILOG_SOURCES = $(PWD)/rtl/user_macro.v
TOPLEVEL = user_macro
MODULE = test_user_macro
export PYTHONPATH := $(PWD)/tb:$(PYTHONPATH)
include $(shell cocotb-config --makefiles)/Makefile.sim
