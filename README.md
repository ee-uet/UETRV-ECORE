## UETRV-ECore  
UETRV-ECore is a RISC-V based SoC integrating 3-stage pipelined core with multiple peripherals for embedded applications. Currently, the core implements RV32I ISA based on User-level ISA Version 2.0 and Privileged Architecture Version 1.11 supporting machine mode only. The core does not have any structural hazards, while data hazards are resolved using forwarding and stalling. Following is the status of current implementation:

- Machine level interrupts has been added, including the support for vectored interrupts.
- External interrupts are supported using bits 16 and above of MIP & MIE CSRs as provisioned by Privileged Architecture Version 1.11. 
- Data hazards are resolved using forwarding, while Load-Use hazard leads to one cycle stall. 
- Memory and peripherals are integrated through Wishbone Interconnect.
- The SoC has on-chip pre-initialized boot memory with a simple boot loader. 
- The system boots from external flash using SPI interface.
- Three motor control modules, capable of controlling dc-servo motors with encoder feedback, have been integrated for coordinated multi-axis motion control.  

### SoC Block Diagram
<img src="docs/soc.png" alt="soc" width="700"/>

### SoC Memory Map
The memory map of SOC is shown in the following table
| Base Address        |    Description            |   Attributes    |
|:-------------------:|:-------------------------:|:---------------:|
| 0x0000_0000         |      Instruction Memory   |      R-X-W      |
| 0x0000_1000         |      Data Memory          |      R-W        |
| 0x0000_2000         |      UART                 |      R-W        |
| 0x0000_3000         |      SPI                  |      R-W        |
| 0x0000_4000         |      Motor Control 1      |      R-W        |
| 0x0000_5000         |      Motor Control 2      |      R-W        |
| 0x0000_6000         |      Motor Control 3      |      R-W        |
| 0x0000_7000         |      Boot Memory          |      R-X        |

- `R: Read access`
- `W: Write access`
- `X: Execute access`

The pictorial representation of memory map is in the following picture.

<img src="docs/mem_map.png" alt="mem_map" width="600"/>

The `linker.ld` file has the memory defination as follows.
```
MEMORY
{ 
  FLASH_INST (rx) : ORIGIN = 0x00000000, LENGTH = 2K
  FLASH_BOOT (rx) : ORIGIN = 0x00007000, LENGTH = 1K
  RAM       (rwx) : ORIGIN = 0x00001000, LENGTH = 2K
}
```
### Generating Verilog
Different building blocks for the SoC are integrated using the top module `'./src/main/scala/soc_tile.scala'`. To generate the Verilog, Scala Build Tool (sbt) and its dependencies needs to be installed. The verilog code can be generated by executing the following command:

`> sbt run`
 
The output verilog file `'./soc_tile.v'` has been generated using sbt 1.3.13.

### Building the Application Executable
Out of reset, the _Boot Memory_ is invoked by the core and the processor starts executing the instructions that are hard coded into the _Boot memory_. As a result of this execution, the Application program is loaded from the external _SPI FLASH Memory_ into the _Instruction Memory_. This phenomenon is demonstrated using the following diagram.

 <img src="docs/boot.png" alt="boot" width="700"/>

### Project Demo (Simulation and FPGA)
The project demo includes an FPGA based implementation to control a DC motor with encoder feedback. The demo project illustrating the motor control configuration is available in separate repo alongwith the Chisel source code for the SoC implementation. 

### The Bootloader and Flash Programming
The bootloader and external SPI falsh memory programming (using TI's Tiva embedded board) are available in a separate repo.
