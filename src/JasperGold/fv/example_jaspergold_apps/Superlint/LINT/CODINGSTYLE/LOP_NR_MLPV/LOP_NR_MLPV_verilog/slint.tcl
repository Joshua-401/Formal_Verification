config_rtlds -rule -disable -domain {LINT DFT AUTO_FORMAL}
config_rtlds -rule -enable -tag {LOP_NR_MLPV}
analyze -sv09 LOP_NR_MLPV.v  
elaborate
clock -none
reset -none
check_superlint -extract
