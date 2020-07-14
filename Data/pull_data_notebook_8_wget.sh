#!/bin/bash

alias wgetncc='wget --no-check-certificate' 
# ~~~~~~~ Ancillary Products ~~~~~~~~~~
wgetncc https://phy-act1.princeton.edu/staged/zatkins/BIN_ACTPOL_50_4_SC_low_ell
wgetncc -r -np -R "index.html*" https://phy-act1.princeton.edu/staged/zatkins/mcm
wgetncc https://phy-act1.princeton.edu/staged/zatkins/TT_cross_spectra.txt
wgetncc https://phy-act1.princeton.edu/staged/zatkins/camb_theory.dat
wgetncc https://phy-act1.princeton.edu/staged/zatkins/cross_cov_TTT.txt
wgetncc https://phy-act1.princeton.edu/staged/zatkins/auto_cov_TTTT.txt
wgetncc https://phy-act1.princeton.edu/staged/zatkins/deep56_TT_spectrum.txt

echo "getting window function"
wget --show-progress -O act_dr4.01_window_functions.tar.gz https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/ancillary_products/act_dr4.01_window_functions.tar.gz

echo "extract files"
tar -xf act_dr4.01_window_functions.tar.gz  window_functions/beams/act_dr4.01_s15_pa1_f150_nohwp_night_beam_tform_jitter_D56_cmbspec.$

echo "move window function"
mv window_functions/beams/act_dr4.01_s15_pa1_f150_nohwp_night_beam_tform_jitter_D56_cmbspec.txt ./act_dr4.01_s15_pa1_f150_nohwp_night$
rm act_dr4.01_window_functions.tar.gz
rm -r window_functions

# ~~~~~~~ Masks ~~~~~~~~~~~~~~~~~~
echo "getting masks"
wget --show-progress -O act_dr4.01_masks.tar.gz https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/ancillary_products/act_dr4.01_masks.tar.gz 

tar -xf act_dr4.01_masks.tar.gz masks/source_masks/act_dr4.01_mask_s13s16_0.015mJy_5.0arcmin.fits
tar -xf act_dr4.01_masks.tar.gz masks/footprints/act_dr4.01_D56_apo_w0.fits

mv masks/source_masks/act_dr4.01_mask_s13s16_0.015mJy_5.0arcmin.fits ./act_dr4.01_mask_s13s16_0.015mJy_5.0arcmin.fits
mv masks/footprints/act_dr4.01_D56_apo_w0.fits ./act_dr4.01_D56_apo_w0.fits

rm act_dr4.01_masks.tar.gz
rm -r masks

# ~~~~~~~~ s15 Maps ~~~~~~~~~~~~~
echo " getting the source free maps"
wget https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/maps/s15/act_dr4.01_s15_D56_pa1_f150_nohwp_night_3pass_4way_set{0..3}_map_srcfree.fits
wget https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/maps/s15/act_dr4.01_s15_D56_pa1_f150_nohwp_night_3pass_4way_coadd_map_srcfree.fits

echo "Getting the Source maps"
wget https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/maps/s15/act_dr4.01_s15_D56_pa1_f150_nohwp_night_3pass_4way_set{0..3}_srcs.fits
wget https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/maps/s15/act_dr4.01_s15_D56_pa1_f150_nohwp_night_3pass_4way_coadd_srcs.fits

echo "Getting the inverse variance maps"
wget https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/maps/s15/act_dr4.01_s15_D56_pa1_f150_nohwp_night_3pass_4way_set{0..3}_ivar.fits
wget https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/maps/s15/act_dr4.01_s15_D56_pa1_f150_nohwp_night_3pass_4way_coadd_ivar.fits


