#!/bin/bash


# Derived Maps
# Temporarily get them from act-1
echo "get the coadd maps"
wget https://phy-act1.princeton.edu/staged/zatkins/act_planck_dr4.01_s08s16_AA_f150_night_map_d56_I.fits
wget https://phy-act1.princeton.edu/staged/zatkins/act_planck_dr4.01_s08s16_AA_f150_night_map_dg_I.fits


# Cosmo Results
# Temp from act 1

# ~~~~~~~ Masks ~~~~~~~~~~~~~~~~~~~~
echo "getting masks"
wget --show-progress -O https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/ancillary_products/act_dr4.01_masks.tar.gz

echo "extract files"
tar -xf act_dr4.01_masks.tar.gz masks/lensing_masks/act_dr4.01_s14s15_D56_lensing_mask.fits
tar -xf act_dr4.01_masks.tar.gz masks/source_masks/act_dr4.01_mask_s13s16_0.015mJy_5.0arcmin.fits
tar -xf act_dr4.01_masks.tar.gz masks/footprints/act_dr4.01_D56_apo_w0.fits

echo "move masks"
mv masks/lensing_masks/act_dr4.01_s14s15_D56_lensing_mask.fits ./act_dr4.01_s14s15_D56_lensing_mask.fits
mv masks/source_masks/act_dr4.01_mask_s13s16_0.015mJy_5.0arcmin.fits ./act_dr4.01_mask_s13s16_0.015mJy_5.0arcmin.fits
mv masks/footprints/act_dr4.01_D56_apo_w0.fits ./act_dr4.01_D56_apo_w0.fits

rm act_dr4.01_masks.tar.gz
rm -r maskss

# ~~~~ Ancillary Data Products ~~~~~~~~`
echo "getting window function"
wget --show-progress -o act_dr4.01_window_functions.tar.gz shttps://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/ancillary_products/act_dr4.01_window_functions.tar.gz 

echo "extract files"
tar -xf act_dr4.01_window_functions.tar.gz  window_functions/beams/act_dr4.01_s15_pa1_f150_nohwp_night_beam_tform_jitter_D56_cmbspec.txt

echo "move window function"
mv window_functions/beams/act_dr4.01_s15_pa1_f150_nohwp_night_beam_tform_jitter_D56_cmbspec.txt ./act_dr4.01_s15_pa1_f150_nohwp_night_beam_tform_jitter_D56_cmbspec.txt
rm act_dr4.01_window_functions.tar.gz
rm -r window_functions

# ~~~~~~~~ s15 Maps ~~~~~~~~~~~~~
echo " getting the source free maps"
wget https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/maps/s15/act_dr4.01_s15_D56_pa1_f150_nohwp_night_3pass_4way_set{0..3}_map_srcfree.fits
wget https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/maps/s15/act_dr4.01_s15_D56_pa1_f150_nohwp_night_3pass_4way_coadd_map_srcfree.fits

echo "Getting the Source maps
wget https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/maps/s15/act_dr4.01_s15_D56_pa1_f150_nohwp_night_3pass_4way_set{0..3}_srcs.fits
wget https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/maps/s15/act_dr4.01_s15_D56_pa1_f150_nohwp_night_3pass_4way_coadd_srcs.fits

echo "Getting the inverse variance maps"
wget https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/maps/s15/act_dr4.01_s15_D56_pa1_f150_nohwp_night_3pass_4way_set{0..3}_ivar.fits
wget https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/maps/s15/act_dr4.01_s15_D56_pa1_f150_nohwp_night_3pass_4way_coadd_ivar.fits

# ~~~~~~~ Non ACT Products ~~~~~~~~
echo "Get the Planck map and CMASS galaxy catalog"
wget https://irsa.ipac.caltech.edu/data/Planck/release_2/all-sky-maps/maps/HFI_SkyMap_143_2048_R2.02_full.fits
wget https://data.sdss.org/sas/dr12/boss/lss/galaxy_DR12v5_CMASSLOWZTOT_South.fits.gz && gunzip ./galaxy_DR12v5_CMASSLOWZTOT_South.fits.gz

# ~~~~~~~ ACT Cluster catalog ~~~~~~
echo "Get a cluster catalog"
wget https://lambda.gsfc.nasa.gov/data/suborbital/ACT/actpol_2016_lensing/E-D56Clusters.fits






