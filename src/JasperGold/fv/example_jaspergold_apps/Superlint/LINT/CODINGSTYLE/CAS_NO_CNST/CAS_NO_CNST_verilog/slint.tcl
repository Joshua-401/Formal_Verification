config_rtlds -rule -disable -domain {LINT DFT AUTO_FORMAL}
config_rtlds -rule -enable -tag {CAS_NO_CNST}
analyze -sv09 CAS_NO_CNST.v  
elaborate
clock -none
reset -none
check_superlint -extract
