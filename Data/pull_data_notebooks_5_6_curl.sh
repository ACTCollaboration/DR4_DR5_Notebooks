#!/bin/bash

# ~~~~~~~ Derived Maps ~~~~~~~~

echo "get derived maps"

curl -O -k https://phy-act1.princeton.edu/staged/zatkins/act_planck_dr4.01_s14s15_D56_lensing_kappa_baseline.fits
curl -O -k https://phy-act1.princeton.edu/staged/zatkins/tilec_single_tile_d56_comptony_map_v1.2.0_joint.fits
curl -O -k https://phy-act1.princeton.edu/staged/zatkins/tilec_single_tile_d56_cmb_map_v1.2.0_joint.fits
curl -O -k https://phy-act1.princeton.edu/staged/zatkins/tilec_single_tile_d56_cmb_deprojects_comptony_map_v1.2.0_joint.fits

# ~~~~~~~ ACT Cluster catalog ~~~~~~
echo "Get a cluster catalog"
curl -O https://lambda.gsfc.nasa.gov/data/suborbital/ACT/actpol_2016_lensing/E-D56Clusters.fits


# ~~~~~~~ Masks ~~~~~~~~~~~~~~~~~~
echo "getting masks"
curl -L -O https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/ancillary_products/act_dr4.01_masks.tar.gz 

echo "extract files"
tar -xf act_dr4.01_masks.tar.gz masks/lensing_masks/act_dr4.01_s14s15_D56_lensing_mask.fits
echo "move masks"
mv masks/lensing_masks/act_dr4.01_s14s15_D56_lensing_mask.fits ./act_dr4.01_s14s15_D56_lensing_mask.fits
rm act_dr4.01_masks.tar.gz
rm -r masks

# ~~~~~~~ Non ACT Products ~~~~~~~~
echo "Get the CMASS galaxy catalog"
curl -O https://data.sdss.org/sas/dr12/boss/lss/galaxy_DR12v5_CMASSLOWZTOT_South.fits.gz && gunzip ./galaxy_DR12v5_CMASSLOWZTOT_South.fits.gz
