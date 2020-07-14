#!/bin/bash

# ~~~~~~~ Notebook Ancillary Products ~~~~~~~~~~
curl -O https://phy-act1.princeton.edu/staged/zatkins/BIN_ACTPOL_50_4_SC_low_ell
mkdir mcm
curl -O https://phy-act1.princeton.edu/staged/zatkins/mcm/mcm.json
curl -O https://phy-act1.princeton.edu/staged/zatkins/mcm/w00.bin

mv ./mcm.json ./mcm/mcm.json
mv ./w00.bin ./mcm/w00.bin
curl -O https://phy-act1.princeton.edu/staged/zatkins/TT_cross_spectra.txt
curl -O https://phy-act1.princeton.edu/staged/zatkins/camb_theory.dat
curl -O https://phy-act1.princeton.edu/staged/zatkins/auto_cov_TTTT.txt
curl -O https://phy-act1.princeton.edu/staged/zatkins/cross_cov_TTT.txt
curl -O https://phy-act1.princeton.edu/staged/zatkins/deep56_TT_spectrum.txt

# ~~~~ Ancillary Data Products ~~~~~~

echo "getting window function"
curl -L -O https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/ancillary_products/act_dr4.01_window_functions.tar.gz  

echo "extract files"
tar -xf act_dr4.01_window_functions.tar.gz  window_functions/beams/act_dr4.01_s15_pa1_f150_nohwp_night_beam_tform_jitter_D56_cmbspec.txt

echo "move window function"
mv window_functions/beams/act_dr4.01_s15_pa1_f150_nohwp_night_beam_tform_jitter_D56_cmbspec.txt ./act_dr4.01_s15_pa1_f150_nohwp_night_beam_tform_jitter_D56_cmbspec.txt
rm act_dr4.01_window_functions.tar.gz
rm -r window_functions

# ~~~~~~~ Masks ~~~~~~~~~~~~~~~~~~
echo "getting masks"
curl -L -O https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/ancillary_products/act_dr4.01_masks.tar.gz 

tar -xf act_dr4.01_masks.tar.gz masks/source_masks/act_dr4.01_mask_s13s16_0.015mJy_5.0arcmin.fits
tar -xf act_dr4.01_masks.tar.gz masks/footprints/act_dr4.01_D56_apo_w0.fits

mv masks/source_masks/act_dr4.01_mask_s13s16_0.015mJy_5.0arcmin.fits ./act_dr4.01_mask_s13s16_0.015mJy_5.0arcmin.fits
mv masks/footprints/act_dr4.01_D56_apo_w0.fits ./act_dr4.01_D56_apo_w0.fits

rm act_dr4.01_masks.tar.gz
rm -r masks

# ~~~~~~~~ s15 Maps ~~~~~~~~~~~~~
echo " getting the source free maps"
curl -O https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/maps/s15/act_dr4.01_s15_D56_pa1_f150_nohwp_night_3pass_4way_set[0-3]_map_srcfree.fits
curl -O https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/maps/s15/act_dr4.01_s15_D56_pa1_f150_nohwp_night_3pass_4way_coadd_map_srcfree.fits

echo "Getting the Source maps"
curl -O https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/maps/s15/act_dr4.01_s15_D56_pa1_f150_nohwp_night_3pass_4way_set[0-3]_srcs.fits
curl -O https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/maps/s15/act_dr4.01_s15_D56_pa1_f150_nohwp_night_3pass_4way_coadd_srcs.fits

echo "Getting the inverse variance maps"
curl -O https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/maps/s15/act_dr4.01_s15_D56_pa1_f150_nohwp_night_3pass_4way_set[0-3]_ivar.fits
curl -O https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/maps/s15/act_dr4.01_s15_D56_pa1_f150_nohwp_night_3pass_4way_coadd_ivar.fits

