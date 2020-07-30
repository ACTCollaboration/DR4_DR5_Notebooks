#!/bin/bash


# ~~~~~~~ Derived Maps ~~~~~~~~~~~
# Temporarily get them from phy-act1
echo "get the coadd maps"
curl -O https://phy-act1.princeton.edu/public/zatkins/act_planck_dr4.01_s08s16_AA_f150_night_map_d56_I.fits
curl -O https://phy-act1.princeton.edu/public/zatkins/act_planck_dr4.01_s08s16_AA_f150_night_map_dg_I.fits

echo "get lensing maps"
curl -O https://phy-act1.princeton.edu/public/zatkins/act_planck_dr4.01_s14s15_D56_lensing_kappa_baseline.fits

echo "get component separated maps"
curl -O https://phy-act1.princeton.edu/public/zatkins/tilec_single_tile_D56_comptony_map_v1.2.0_joint.fits 
curl -O https://phy-act1.princeton.edu/public/zatkins/tilec_single_tile_D56_cmb_map_v1.2.0_joint.fits
curl -O https://phy-act1.princeton.edu/public/zatkins/tilec_single_tile_D56_cmb_deprojects_comptony_map_v1.2.0_joint.fits 

# ~~~~~~~ Cosmo Results ~~~~~~~~~~
curl -O https://phy-act1.princeton.edu/public/zatkins/ACTPol_lcdm_1.txt
curl -O https://phy-act1.princeton.edu/public/zatkins/ACTPol_lcdm.paramnames

# ~~~~ Ancillary Data Products ~~~~~~
echo "getting masks"
curl -L -O https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/ancillary_products/act_dr4.01_masks.tar.gz 

echo "extract files"
tar -xf act_dr4.01_masks.tar.gz masks/lensing_masks/act_dr4.01_s14s15_D56_lensing_mask.fits
tar -xf act_dr4.01_masks.tar.gz masks/source_masks/act_dr4.01_mask_s13s16_0.015mJy_5.0arcmin.fits
tar -xf act_dr4.01_masks.tar.gz masks/footprints/act_dr4.01_D56_apo_w0.fits
tar -xf act_dr4.01_masks.tar.gz masks/footprints/act_dr4.01_D6_apo_w0.fits

echo "move masks"
mv masks/lensing_masks/act_dr4.01_s14s15_D56_lensing_mask.fits ./act_dr4.01_s14s15_D56_lensing_mask.fits
mv masks/source_masks/act_dr4.01_mask_s13s16_0.015mJy_5.0arcmin.fits ./act_dr4.01_mask_s13s16_0.015mJy_5.0arcmin.fits
mv masks/footprints/act_dr4.01_D56_apo_w0.fits ./act_dr4.01_D56_apo_w0.fits
mv masks/footprints/act_dr4.01_D6_apo_w0.fits ./act_dr4.01_D6_apo_w0.fits

rm act_dr4.01_masks.tar.gz
rm -r masks

echo "getting window function"
curl -L -O https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/ancillary_products/act_dr4.01_window_functions.tar.gz  

echo "extract files"
tar -xf act_dr4.01_window_functions.tar.gz  window_functions/beams/act_dr4.01_s15_pa1_f150_nohwp_night_beam_tform_jitter_D56_cmbspec.txt

echo "move window function"
mv window_functions/beams/act_dr4.01_s15_pa1_f150_nohwp_night_beam_tform_jitter_D56_cmbspec.txt ./act_dr4.01_s15_pa1_f150_nohwp_night_beam_tform_jitter_D56_cmbspec.txt
rm act_dr4.01_window_functions.tar.gz
rm -r window_functions

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

# ~~~~~~~~ s13 Maps ~~~~~~~~~~~~~~~
echo "getting the season 13 inverse variance maps"
curl -O https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/maps/s13/act_dr4.01_s13_D6_pa1_f150_nohwp_night_3pass_4way_set[0-3]_ivar.fits
curl -O https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/maps/s13/act_dr4.01_s13_D6_pa1_f150_nohwp_night_3pass_4way_coadd_ivar.fits

echo "getting the season 13 source free maps"
curl -O https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/maps/s13/act_dr4.01_s13_D6_pa1_f150_nohwp_night_3pass_4way_set[0-3]_map_srcfree.fits
curl -O https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/maps/s13/act_dr4.01_s13_D6_pa1_f150_nohwp_night_3pass_4way_coadd_map_srcfree.fits

# ~~~~~~~ Non ACT Products ~~~~~~~~
echo "Get the Planck map and CMASS galaxy catalog"
curl -O https://irsa.ipac.caltech.edu/data/Planck/release_2/all-sky-maps/maps/HFI_SkyMap_143_2048_R2.02_full.fits
curl -O https://data.sdss.org/sas/dr12/boss/lss/galaxy_DR12v5_CMASSLOWZTOT_South.fits.gz && gunzip ./galaxy_DR12v5_CMASSLOWZTOT_South.fits.gz

# ~~~~~~~ ACT Cluster catalog ~~~~~~
echo "Get a cluster catalog"
curl -O https://lambda.gsfc.nasa.gov/data/suborbital/ACT/actpol_2016_lensing/E-D56Clusters.fits

# ~~~~~~~~ Sims ~~~~~~~~~~~~~~~~~~
# curl -O https://phy-act1.princeton.edu/public/zatkins/act_dr4.01_s15_D56_pa1_coadd_est_True_covsqrt.fits

# ~~~~~~ Notebook Ancillary Products ~~~~~~~~~~~~~

echo "get the coadd maps"
curl -O https://phy-act1.princeton.edu/public/zatkins/act_planck_dr4.01_s08s16_AA_f150_night_map_d56_I.fits
curl -O https://phy-act1.princeton.edu/public/zatkins/act_planck_dr4.01_s08s16_AA_f150_night_map_dg_I.fits

curl -O https://phy-act1.princeton.edu/public/zatkins/messier_objs.csv
curl -O https://phy-act1.princeton.edu/public/zatkins/camb_theory.dat
curl -O https://phy-act1.princeton.edu/public/zatkins/act_dr4.01_s13_D6_pa1_coadd_est_True_covsqrt.fits

curl -O https://phy-act1.princeton.edu/public/zatkins/BIN_ACTPOL_50_4_SC_low_ell
curl -O https://phy-act1.princeton.edu/public/zatkins/ACTPol_lcdm.paramnames.csv
curl -O https://phy-act1.princeton.edu/public/zatkins/auto_cov_TTTT.txt
curl -O https://phy-act1.princeton.edu/public/zatkins/cross_cov_TTTT.txt
curl -O https://phy-act1.princeton.edu/public/zatkins/TT_cross_spectra.txt
curl -O https://phy-act1.princeton.edu/public/zatkins/deep56_TT_spectrum.txt
curl -O https://phy-act1.princeton.edu/public/zatkins/deep56_kfilter_tfunc_sim.txt

curl -O https://phy-act1.princeton.edu/public/zatkins/060420_lensed_best_fits_params.txt
curl -O https://phy-act1.princeton.edu/public/zatkins/060420_delensed_best_fits_params.txt
curl -O https://phy-act1.princeton.edu/public/zatkins/060320_param_shift_20x20.txt

mkdir mcm
curl -O  https://phy-act1.princeton.edu/public/zatkins/mcm/mcm.json
curl -O  https://phy-act1.princeton.edu/public/zatkins/mcm/w00.bin

mv ./mcm.json ./mcm/mcm.json
mv ./w00.bin ./mcm/w00.bin











