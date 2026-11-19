import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, Timer

@cocotb.test()
async def test_oeb_and_io(dut):
    cocotb.start_soon(Clock(dut.wb_clk_i, 10, units="ns").start())
    dut.wb_rst_i.value = 1; dut.io_in.value = 0x5A
    for _ in range(3): await RisingEdge(dut.wb_clk_i)
    dut.wb_rst_i.value = 0; await RisingEdge(dut.wb_clk_i); await Timer(1, units="ns")
    assert int(dut.io_oeb.value) == 0 and int(dut.io_out.value) == 0xA5
