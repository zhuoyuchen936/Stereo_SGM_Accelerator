debImport "-sv" "-f" "filelist.f"
debLoadSimResult \
           /anlab12/stuhome/zngz42/TCASII/rtl_TSMC40/rtl/PostProcessing_Top_new/new.fsdb
wvCreateWindow
srcSelect -signal "clk" -line 58 -pos 1 -win $_nTrace1
srcSelect -signal "rst" -line 59 -pos 1 -win $_nTrace1
srcSelect -signal "clken" -line 60 -pos 1 -win $_nTrace1
srcSelect -signal "enable" -line 61 -pos 1 -win $_nTrace1
srcSelect -signal "width" -line 62 -pos 1 -win $_nTrace1
srcSelect -signal "valid_final_L" -line 63 -pos 1 -win $_nTrace1
srcSelect -signal "valid_final_R" -line 64 -pos 1 -win $_nTrace1
srcSelect -toggle -signal "valid_final_R" -line 64 -pos 1 -win $_nTrace1
srcSelect -signal "valid_final_R" -line 64 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "range" -line 67 -pos 1 -win $_nTrace1
srcSelect -signal "clk" -line 58 -pos 1 -win $_nTrace1
srcSelect -signal "rst" -line 59 -pos 1 -win $_nTrace1
srcSelect -signal "clken" -line 60 -pos 1 -win $_nTrace1
srcSelect -signal "enable" -line 61 -pos 1 -win $_nTrace1
srcSelect -signal "width" -line 62 -pos 1 -win $_nTrace1
srcSelect -signal "valid_final_L" -line 63 -pos 1 -win $_nTrace1
srcSelect -signal "valid_final_R" -line 64 -pos 1 -win $_nTrace1
srcSelect -signal "disp_hole" -line 70 -pos 1 -win $_nTrace1
srcSelect -signal "valid_final_hole" -line 71 -pos 1 -win $_nTrace1
wvCreateWindow
wvSetPosition -win $_nWave3 {("G1" 0)}
wvOpenFile -win $_nWave3 \
           {/anlab12/stuhome/zngz42/TCASII/rtl_TSMC40/rtl/PostProcessing_Top_new/new.fsdb}
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave3
wvSelectSignal -win $_nWave3 {( "G1" 11 )} 
wvZoom -win $_nWave3 533065.180192 881298.714991
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
verdiDockWidgetSetCurTab -dock windowDock_nWave_2
verdiDockWidgetSetCurTab -dock windowDock_nWave_3
