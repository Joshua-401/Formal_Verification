config_rtlds -rule -disable -domain {LINT DFT AUTO_FORMAL}
config_rtlds -rule -enable -tag {FNC_NO_AVAC}
analyze -sv09 FNC_NO_AVAC.v  
elaborate
clock -none
reset -none
check_superlint -extract
