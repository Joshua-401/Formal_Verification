config_rtlds -rule -disable -domain {LINT DFT AUTO_FORMAL}
config_rtlds -rule -enable -tag {INS_MS_PSIZ}
analyze -sv09 INS_MS_PSIZ.v  
elaborate
clock -none
reset -none
check_superlint -extract
