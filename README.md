# C910 CPU Verification Environment

A comprehensive verification framework for the C910 RISC-V processor core supporting both software simulation and FPGA-based verification.

## Overview

The C910 is a high-performance RISC-V processor core developed by T-Head (Alibaba). This verification environment provides:

- **VCS-based simulation** - Software simulation using Synopsys VCS
- **P2E FPGA-based verification** - Hardware acceleration using FPGA platforms
- Comprehensive test suite (ISA, MMU, cache, system-level tests)
- Automated build and run workflows for both environments
- RISC-V Xuantie toolchain integration

## Prerequisites

### For VCS Simulation
- **VCS** (Synopsys Verilog Compiler Simulator) v2018.09+
- **C910 RTL sources** (T-Head C910 RTL factory)
- **Unix/Linux environment** with bash/csh support

### For P2E FPGA Verification
- **P2E FPGA platform** with proper hardware setup
- **P2E toolchain** and environment
- **TCsh shell** for P2E environment setup
- **Xwave** waveform viewer for results analysis

## Simulation Environments

### VCS Software Simulation

#### Setup VCS Environment (**NOT INCLUDED IN THIS REPO**)
```bash
# Setup VCS environment
source ./env_vcs.sh
```

#### Setup C910 Environment 
```bash
cd 10000x-CPU-Verif/c910

# Setup RTL Factory
cd ./vcs/C910_RTL_FACTORY/
source ./setup/setup.sh

# Setup Smart Run environment
cd ../smart_run/
source ./setup/setup.sh
```

#### Build and Run Tests

```bash
# Build a test case
make buildcase CASE=hello_world

# Run VCS simulation
make runcase CASE=hello_world SIM=vcs
```

Expected output: "Hello Southeast University! Welcome to 10000x CPU Verif!" message with PASS status.

#### Prepare data/inst.pats and binaries for FPGA emulation

```bash
# Copy generated test patterns from VCS to P2E folder
# (Run VCS build first to generate patterns)
cp ./vcs/smart_run/work/data.pat /p2e/rtl_tb
cp ./vcs/smart_run/work/inst.pat /p2e/rtl_tb  
```
```bash
# Navigate to P2E folder
cd p2e/

# Compile and deploy design on P2E FPGA
./vcs.csh # Generated 16 dut_ram[x].txt files
```


### P2E FPGA Verification (BELOW OPERATIONS SHOULD BE DONE ON THE SEVER WITH P2E FPGAs)

#### *** NOTE: Above 16 dut_ram[x] should be updated to the server with P2E FPGAs (if a different server is used) ***

#### Setup Environment
```bash
cd 10000x-CPU-Verif/c910

# Switch to tcsh shell (required for P2E)
tcsh

# Source P2E environment
cd c910
source ./setup.csh
```

#### Run Emulation
```bash
./p2e.csh
```



#### View Results (Option 1: Waveform)

```bash
# View waveforms after P2E run completion
cd c910.xvcf
xwave -wdb c910.xvcf
```

#### View Results (Option 2: Logs)
```bash
# Since the UART is not currently added, a script can be executed for black-hack. 
./show_uart
```

## Available Test Cases

### Core Tests
- `hello_world` - Basic C program execution
- `smoke` - Minimal functionality tests
- `ISA` - Instruction Set Architecture compliance
- `sleep` - Power management tests

### System Tests
- `MMU` - Memory Management Unit tests
- `cache` - Cache coherency tests
- `csr` - Control and Status Register tests
- `exception` - Exception handling
- `interrupt` - Interrupt controller tests

### Benchmarks
- `coremark` - Industry-standard benchmark
- `debug` - Debug interface verification

*Note: All test cases can be run on both VCS and P2E environments*

## Directory Structure

```
10000x-CPU-Verif/c910/
├── vcs/                         # VCS Simulation Environment
│   ├── C910_RTL_FACTORY/        # RTL Generation and Setup
│   ├── smart_run/               # Main Simulation Framework
│   │   ├── Makefile             # Build system
│   │   ├── setup/               # Environment setup
│   │   ├── tests/cases/         # Test source code
│   │   └── work/                # Generated files (*.pat, *.elf, logs)
│   └── riscv_xuantie/           # RISC-V Xuantie Toolchain
├── p2e/                         # P2E FPGA Verification Environment
│   ├── setup.csh               # P2E environment setup
│   ├── vcs.csh                 # P2E build and deployment script
│   └── [FPGA-specific files]   # P2E configuration and runtime files
├── doc/                         # Documentation
└── README.md                    # This file
```

## Verification Workflow

### Typical Flow for Comprehensive Verification

1. **Develop/Modify Tests**: Create or update test cases in `vcs/smart_run/tests/cases/`

2. **VCS Simulation**: 
   ```bash
   make buildcase CASE=test_name
   make runcase CASE=test_name SIM=vcs
   ```

3. **P2E FPGA Verification**:
   ```bash
   # Copy generated patterns
   cp ./vcs/smart_run/work/data.pat ./p2e/rtl_tb
   cp ./vcs/smart_run/work/inst.pat ./p2e/rtl_tb
   
   # Run on FPGA
   cd p2e/ && ./p2e.csh
   
   # Analyze results
   xwave -wdb c910.xvcf
   ```

4. **Results Comparison**: Compare VCS and P2E results for validation

## Advanced Usage

### Custom Test Development

1. Create test directory:
   ```bash
   mkdir ./vcs/smart_run/tests/cases/my_test
   ```

2. Write test code (`my_test.c`) in the directory

3. Build and run on both environments:
   ```bash
   # VCS simulation
   make buildcase CASE=my_test
   make runcase CASE=my_test SIM=vcs
   
   # P2E FPGA verification
   cp ./vcs/smart_run/work/data.pat /p2e/
   cd p2e/ && ./vcs.csh
   ```

### Performance Comparison

- **VCS**: Detailed debugging, full controllability, slower execution
- **P2E**: Hardware-speed execution, real-time performance, limited visibility

## Troubleshooting

### VCS-Specific Issues

- **VCS License**: Check license server connectivity
- **Environment**: Ensure all setup scripts are sourced correctly
- **Build Errors**: Verify RISC-V toolchain installation
- **Simulation**: Check logs in `work/` directory for details

### P2E-Specific Issues

- **FPGA Connection**: Verify P2E hardware connectivity
- **Environment Setup**: Ensure tcsh shell and proper environment sourcing
- **Pattern Files**: Verify data.pat and inst.pat are correctly generated and copied
- **Waveform Issues**: Check if c910.xvcf is generated and accessible

### Debug Tips

- Use `VERBOSE=1` for detailed VCS build output
- Check `work/*.log` files for VCS simulation details
- For P2E, monitor FPGA status and logs during deployment
- Compare results between VCS and P2E for validation
- Verify test completion status and return codes in both environments

## License

See `vcs/LICENSE` for licensing information.

## TO DO: ADDING THE METHOD OF UPDATING THE BINARIES OF CPUS.
