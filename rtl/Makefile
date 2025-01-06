.PHONY: image


compile_cov:
	vcs -R -full64 +v2k -sverilog -debug_acc+all \
		-fsdb \
		+notimingcheck +nospecify \
		-f filelist.f \
		-cm line+tgl+cond+branch+assert \
		-cm_noconst \
		-l com.log

verdi_cov:
	verdi -f filelist.f -ssf xxx.fsdb -cov -covdir simv.vdb/ -workMode coverageAnalysis &






#all: compile verdi
#
compile:
	#vcs +v2k -sverilog -debug_all -full64 \
	#	-P /anlabeda/Synopsys/synopsys2018/verdi/O-2018.09-SP1/share/PLI/VCS/LINUX64/novas.tab /anlabeda/Synopsys/synopsys2018/verdi/O-2018.09-SP1/share/PLI/VCS/LINUX64/pli.a \
	#	-f filelist.vc \
	#	-timescale=1ns/1ns \
	#	-l com.log
	#
	#+define+FSDB 
	#-debug_acc+dmptf 
	mkdir -p image/image_out
	vcs -R -full64 +v2k -sverilog -debug_all \
		-fsdb \
	 	+notimingcheck +nospecify \
		+define+FSDB \
		-timescale=1ns/1ns \
		-f filelist.f\
		-o sim \
		-v2k_generate \
		+lint=TFIPC-L \
		-l sim.log \
		#+lint=all \


verdi:
	verdi -sv -f filelist.f -ssf xxx.fsdb &
#
#file:
#	find ../../rtl/ -name '*.v' -or -name '*.sv' > filelist.f
#
clean:
	rm -rf *.log  csrc sim*  *.key *.fsdb novas* wave.* verdiLog image *fsdb*
#
#image:
#	python3 ./scripts/hexfunc.py	
