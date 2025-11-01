# Sample testbench for a Tiny Tapeout project

This is a sample testbench for a Tiny Tapeout project. It uses [cocotb](https://docs.cocotb.org/en/stable/) to drive the DUT and check the outputs.
See below to get started or for more information, check the [website](https://tinytapeout.com/hdl/testing/).

## Setting up

1. Edit [Makefile](Makefile) and modify `PROJECT_SOURCES` to point to your Verilog files.
2. Edit [tb.v](tb.v) and replace `tt_um_example` with your module name.


## Setup for Mac OS

1. Download `oss-cad-suite`: https://github.com/YosysHQ/oss-cad-suite-build
2. Unpack and copy the folder to `~/Documents/Tools` or wherever you like
3. In a terminal, run: `source ~/Documents/Tools/oss-cad-suite/environment`
    - You can do a quick test to ensure it's working by running: `python3 -m pip install --user pytest`
4. Then run `make -B` to build
5. Plot waveforms: `gtkwave tb.vcd tb.gtkw`

## How to run

To run the RTL simulation:

```sh
make -B
```

To run gatelevel simulation, first harden your project and copy `../runs/wokwi/results/final/verilog/gl/{your_module_name}.v` to `gate_level_netlist.v`.

Then run:

```sh
make -B GATES=yes
```

## How to view the VCD file

Using GTKWave
```sh
gtkwave tb.vcd tb.gtkw
```

Using Surfer
```sh
surfer tb.vcd
```
