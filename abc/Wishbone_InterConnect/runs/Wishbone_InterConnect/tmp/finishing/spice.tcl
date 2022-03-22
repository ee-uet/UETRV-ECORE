
if { [info exist ::env(MAGIC_EXT_USE_GDS)] && $::env(MAGIC_EXT_USE_GDS) } {
	gds read $::env(CURRENT_GDS)
} else {
	lef read /home/ali112000/Desktop/mpw/pdk/sky130A/libs.ref/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd.tlef
	if {  [info exist ::env(EXTRA_LEFS)] } {
		set lefs_in $::env(EXTRA_LEFS)
		foreach lef_file $lefs_in {
			lef read $lef_file
		}
	}
	def read /home/ali112000/mpw5/UETRV-ECORE/openlane/Wishbone_InterConnect/runs/Wishbone_InterConnect/results/routing/WB_InterConnect.def
}
load WB_InterConnect -dereference
cd /home/ali112000/mpw5/UETRV-ECORE/openlane/Wishbone_InterConnect/runs/Wishbone_InterConnect/results/finishing/
extract do local
extract no capacitance
extract no coupling
extract no resistance
extract no adjust
if { ! 0 } {
	extract unique
}
# extract warn all
extract

ext2spice lvs
ext2spice -o /home/ali112000/mpw5/UETRV-ECORE/openlane/Wishbone_InterConnect/runs/Wishbone_InterConnect/results/finishing/WB_InterConnect.spice WB_InterConnect.ext
feedback save /home/ali112000/mpw5/UETRV-ECORE/openlane/Wishbone_InterConnect/runs/Wishbone_InterConnect/logs/finishing/31-ext2spice.feedback.txt
# exec cp WB_InterConnect.spice /home/ali112000/mpw5/UETRV-ECORE/openlane/Wishbone_InterConnect/runs/Wishbone_InterConnect/results/finishing/WB_InterConnect.spice

