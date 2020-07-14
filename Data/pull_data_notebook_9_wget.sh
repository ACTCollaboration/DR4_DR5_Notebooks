#!/bin/bash

# ~~~~~~~~ s13 Maps ~~~~~~~~~~~~~~~
echo "getting the season 13 inverse variance maps"
wget https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/maps/s13/act_dr4.01_s13_D6_pa1_f150_nohwp_night_3pass_4way_set{0..3}_ivar.fits
wget https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/maps/s13/act_dr4.01_s13_D6_pa1_f150_nohwp_night_3pass_4way_coadd_ivar.fits

echo "getting the season 13 source free maps"
wget https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/maps/s13/act_dr4.01_s13_D6_pa1_f150_nohwp_night_3pass_4way_set{0..3}_map_srcfree.fits
wget https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/maps/s13/act_dr4.01_s13_D6_pa1_f150_nohwp_night_3pass_4way_coadd_map_srcfree.fits

# ~~~~~~~ Masks ~~~~~~~~~~~~~~~~~~~~
echo "getting masks"
wget --show-progress -O https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/ancillary_products/act_dr4.01_masks.tar.gz

tar -xf act_dr4.01_masks.tar.gz masks/footprints/act_dr4.01_D6_apo_w0.fits
mv masks/footprints/act_dr4.01_D6_apo_w0.fits ./act_dr4.01_D6_apo_w0.fits

rm act_dr4.01_masks.tar.gz
rm -r maskss

# ~~~~~~~~~ Sims ~~~~~~~
wget https://phy-act1.princeton.edu/staged/zatkins/act_dr4.01_s15_D56_pa1_coadd_est_True_covsqrt.fits
