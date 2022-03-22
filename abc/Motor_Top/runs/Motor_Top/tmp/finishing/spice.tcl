
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
	def read /home/ali112000/mpw5/UETRV-ECORE/openlane/Motor_Top/runs/Motor_Top/results/routing/Motor_Top.def
}
load Motor_Top -dereference
cd /home/ali112000/mpw5/UETRV-ECORE/openlane/Motor_Top/runs/Motor_Top/results/finishing/
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
ext2spice -o /home/ali112000/mpw5/UETRV-ECORE/openlane/Motor_Top/runs/Motor_Top/results/finishing/Motor_Top.spice Motor_Top.ext
feedback save /home/ali112000/mpw5/UETRV-ECORE/openlane/Motor_Top/runs/Motor_Top/logs/finishing/31-ext2spice.feedback.txt
# exec cp Motor_Top.spice /home/ali112000/mpw5/UETRV-ECORE/openlane/Motor_Top/runs/Motor_Top/results/finishing/Motor_Top.spice

