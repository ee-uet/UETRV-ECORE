
if { [info exist ::env(MAGIC_EXT_USE_GDS)] && $::env(MAGIC_EXT_USE_GDS) } {
	gds read $::env(CURRENT_GDS)
} else {
	lef read /home/ali11-2000/FYP/mpw/pdks/sky130A/libs.ref/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd.tlef
	if {  [info exist ::env(EXTRA_LEFS)] } {
		set lefs_in $::env(EXTRA_LEFS)
		foreach lef_file $lefs_in {
			lef read $lef_file
		}
	}
	def read /home/ali11-2000/FYP/mpw/UETRV-ECORE/openlane/Core/runs/Core/results/routing/Core.def
}
load Core -dereference
cd /home/ali11-2000/FYP/mpw/UETRV-ECORE/openlane/Core/runs/Core/results/finishing/
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
ext2spice -o /home/ali11-2000/FYP/mpw/UETRV-ECORE/openlane/Core/runs/Core/results/finishing/Core.spice Core.ext
feedback save /home/ali11-2000/FYP/mpw/UETRV-ECORE/openlane/Core/runs/Core/logs/finishing/31-ext2spice.feedback.txt
# exec cp Core.spice /home/ali11-2000/FYP/mpw/UETRV-ECORE/openlane/Core/runs/Core/results/finishing/Core.spice

