## UETRV-ECORE  
UETRV-ECORE is a RISC-V based SoC integrating 3-stage pipelined core with multiple peripherals for embedded applications. Currently, the core implements RV32I ISA based on User-level ISA Version 2.0 and Privileged Architecture Version 1.11 supporting machine mode only. The core does not have any structural hazards, while data hazards are resolved using forwarding and stalling. Following is the status of current implementation:

- Machine level interrupts has been added, including the support for vectored interrupts.
- External interrupts are supported using bits 16 and above of MIP & MIE CSRs as provisioned by Privileged Architecture Version 1.11. 
- Data hazards are resolved using forwarding, while Load-Use hazard leads to one cycle stall. 
- Memory and peripherals are integrated through Wishbone Interconnect.
- The SoC has on-chip pre-initialized boot memory with a simple boot loader. 
- The system boots from external flash using SPI interface.
- A motor control module, capable of controlling dc-servo motor with encoder feedback.  

### Block Diagram
<img src="docs/soc.png" alt="soc" width="700"/>

The verilog rtl used in this repo is generated from Scala source which is available in a separate repository [here](https://github.com/ee-uet/UETRV_ESoC). Further details bout the peripheral memory map, bootloader, example programs, testbenches etc. are also provided in that repo. 
