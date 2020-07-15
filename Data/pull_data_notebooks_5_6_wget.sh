#!/bin/bash

# ~~~~~~~ Derived Maps ~~~~~~~~


wget -O act_planck_dr4.01_s14s15_D56_lensing_kappa_baseline.fits https://phy-act1.princeton.edu/public/zatkins/act_planck_dr4.01_s14s15_D56_lensing_kappa_baseline.fits
wget -O tilec_single_tile_D56_comptony_map_v1.2.0_joint.fits https://phy-act1.princeton.edu/public/zatkins/tilec_single_tile_D56_comptony_map_v1.2.0_joint.fits
wget -O tilec_single_tile_D56_cmb_map_v1.2.0_joint.fits https://phy-act1.princeton.edu/public/zatkins/tilec_single_tile_D56_cmb_map_v1.2.0_joint.fits
wget -O tilec_single_tile_D56_cmb_deprojects_comptony_map_v1.2.0_joint.fits https://phy-act1.princeton.edu/public/zatkins/tilec_single_tile_D56_cmb_deprojects_comptony_map_v1.2.0_joint.fits


# ~~~~~~~ ACT Cluster catalog ~~~~~~
echo "Get a cluster catalog"
wget https://lambda.gsfc.nasa.gov/data/suborbital/ACT/actpol_2016_lensing/E-D56Clusters.fits


# ~~~~~~~ Masks ~~~~~~~~~~~~~~~~~~
echo "getting masks"
wget --show-progress -O act_dr4.01_masks.tar.gz https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/ancillary_products/act_dr4.01_masks.tar.gz

echo "extract files"
tar -xf act_dr4.01_masks.tar.gz masks/lensing_masks/act_dr4.01_s14s15_D56_lensing_mask.fits
echo "move masks"
mv masks/lensing_masks/act_dr4.01_s14s15_D56_lensing_mask.fits ./act_dr4.01_s14s15_D56_lensing_mask.fits
rm act_dr4.01_masks.tar.gz
rm -r masks

# ~~~~~~~ Non ACT Products ~~~~~~~~
echo "Get the CMASS galaxy catalog"
wget  https://data.sdss.org/sas/dr12/boss/lss/galaxy_DR12v5_CMASSLOWZTOT_South.fits.gz && gunzip ./galaxy_DR12v5_CMASSLOWZTOT_South$



