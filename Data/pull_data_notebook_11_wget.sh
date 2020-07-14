#!/bin/bash

alias wgetncc='wget --no-check-certificate' 

# ~~~~~ Comological Results ~~~~~~
wgetncc https://phy-act1.princeton.edu/staged/zatkins/ACTPol_lcdm_1.txt
wgetncc https://phy-act1.princeton.edu/staged/zatkins/ACTPol_lcdm.paramnames

# ~~~~~ Ancillary Products
wgetncc https://phy-act1.princeton.edu/staged/zatkins/ACTPol_lcdm.paramnames.csv
