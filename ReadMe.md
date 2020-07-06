## This repository allows users to run and access Advanced ACT's library Pixell and run the Jupyter notebook tutorials associated with Data Release 4.
---
Adv ACT's Data Release 4 includes intensity and polarization maps covering close to half the sky as well as a variety of other data products.  These data products are described in some detail in the Python Notebook Tutorials presented here.  The tutorials also introduce users to the Plate Carree maps used for the AdvACT data products as well as the python library, Pixell, used to handle the maps.  

### Dependencies 
- [Pixell](https://github.com/simonsobs/pixell/)
- [pyactlike](https://github.com/ACTCollaboration/pyactlike)
- [Healpy](https://github.com/healpy/healpy)
- [getdist](https://github.com/cmbant/getdist)
- astropy, numpy, scipy, matplotlib, CAMB 

## Installing and Running the Notebooks

The notebooks are implemented using a Docker Image which installs Pixell and the other relevant packages in a container.  However, if users are interested in performing more in-depth analyses using Pixell we encourage you to fully install the library following the instructions found [here](https://github.com/simonsobs/pixell). 

---
Note: 

In order for the notebooks to run fully you'fll need to have all of the data products downloaded and located in a file on your computer. 
The location and name of this file will be linked to the container.  

### Download the neccesary data products
The links to all of the products used in these notebooks have been compiled in the pul_data.txt file which makes it simple to download the data products using wget. This may take some time due to the number of files but can be run in the background while you set up the container.  Feel free to add any other data products you'd like to pull to the text file or comment out ones you don't want to use.

To pull the data using the text file and wget you just need to run: 

	wget -i pull_data.txt
	
If you are working on a mac and don't have wget set up you can get it using homebrew or use curl instead:
	
	xargs -n 1 curl -0 < pull_data.txt
	
The above command will pull all of the data products with the exception of the coadded maps due to the size of these files.  For the coadded map we provide users with two options, the original full resolution maps which include I, Q, and U components but are 10 GB or a downgraded intensity only map which 220 MB and will also work for these notebooks.

For the full maps run:

	wget full_map_link
	
For the downgraded maps run:

	wget downgraded_map_link

Again for th above commands if you wish to use curl instead of wget just replace the word wget with curl.

The full list of ACT DR4 data products can be found on LAMBDA [here](https://lambda.gsfc.nasa.gov/product/act/)
```diff
+ will get rid of this list once we're live since the txt file above pulls them all

### To run the entirety of these notebooks you will need to have the following data products downloaded:

 ACT + Planck Coadded map : "act_planck_dr4.01_s08s16_AA_f150_night_map.fits"
or the lower resolution (and thus smaller) version "act_planck_dr4.01_s08s16_AA_f150_night_map_dg_I.fits"
 Planck Map : "HFI_SkyMap_143_2048_R2.02_full.fits"
 Cluster catalog : 'E-D56Clusters.fits'
 Lensing Map : "act_planck_dr4.01_s14s15_BN_lensing_kappa_baseline.fits"
 Compton-y : "tilec_single_tile_deep56_comptony_map_v1.2.0_joint.fits"
 CMB + kSZ : "tilec_single_tile_deep56_cmb_map_v1.2.0_joint.fits"
 CMB + kSZ with tSZ deprojected : "tilec_single_tile_deep56_cmb_deprojects_comptony_map_v1.2.0_joint.fits"
 Sample Adv ACT patch without sources, set 1: "act_dr4_s15_D8_pa2_f150_nohwp_night_3pass_4way_set1_map_srcfree.fits"
 Sample Adv ACT patch without sources, set 2: "act_dr4_s15_D8_pa2_f150_nohwp_night_3pass_4way_set2_map_srcfree.fits"
 Corresponding source map: "act_dr4_s15_D8_pa2_f150_nohwp_night_3pass_4way_set2_srcs.fits"
 Beam: "s15_pa2_f150_nohwp_night_beam_tform_instant_cmbspec.txt"


** The Planck map can be found [here](https://irsa.ipac.caltech.edu/data/Planck/release_2/all-sky-maps/maps/HFI_SkyMap_143_2048_R2.02_full.fits) .  They can also be found in this [google drive](https://drive.google.com/drive/folders/16ErVuAGbmhyaAFM12i9v_aNAWyb-2Ppz?usp=sharing) 

```
For questions or comments pertaining to these notebooks contact Maya Mallaby-Kay (mayamkay@umich.edu).

--------------

### To run and set up Pixell and the tutorial:

1) Install and run [docker](https://www.docker.com/)
   - Create a Docker account and then sign in
   - Docker is set up to limit the memory available to your container.  To adjust this go into Preferences -> Resources and set Memory to 10GB and CPUs to 4.  You can increase them at any point if you need to.

2) Clone this repository and then open terminal.

3) In terminal navigate to the cloned repository and run:
	
		docker build -t advact/tutorials:1.0 .
   
    This first command compiles the neccesary packages and will take some time to run (~ 6 minutes)
    
		docker run -it -p 8888:8888 -v [Path_to_Local_data]:/usr/home/workspace/data --rm advact/tutorials:1.0
	
    Here "Path_to_local_data" Must be replaced with the path to the data folder on your machine that contains the relevant maps.  For some users you may need to explicitly give Docker permission to access the folders on your computer.  In order to do so open the settings in Docker desktop and adjust the sharing settings as needed.
    At this point the docker container is running and you can launch Jupiter notebook in order to run the tutorial.
    
    If you don't want to connect the container to your local machine you can run the following command instead.
    
    	docker run -it -p 8888:8888  --rm advact/tutorials:1.0

4) Launch Jupyter notebook
   
   		jupyter notebook --ip 0.0.0.0 --no-browser
   
   - In the terminal you should now see a link that you can copy and paste into a browser.  The link will open up jupyter notebook and you'll be able to navigate to the notebooks and run them in the container.
   
   - If that deosn't work open your browser and navigate to 
   	localhost:8888/
   - When prompted for a token copy and paste the token from the url or find it using the terminal by typing:
   
   			jupyter notebook list
		
  	This will give a list of running jupyter notebooks that should look like this:
   		
	Currently running servers:
		
	http://localhost:8888/?token=0d66c7b877535a9511ebe70d230f5ed65df1e9a0ac4f1144 :: /Users/.... Folder Path
	
	Copy the text after 'token=' and before the ' :: /Users...' into the token request box and that should launch the notebook.
	
5) Run Tutorials:
   - To check your data has correctly linked open the data directory, you should see a list of the relevant files.
   
   - Navigate to the Tutorials folder and start with the 1st notebook which serves as an indtroduction and provides an overview of the tutorials.
   

   
Note: You can also create new notebooks or add other data sets to the local directory that will automatically become available in the container.

When in the container if you wish to save work or data locally simply save them to the 'data/' folder that you linked with your local data when launching the container.





## References:

* Aiola, S., Calabrese, E., Loic, M., & Naess, S. 2020, ApJS, 1, 1
* Akrami, Y., Arroja, F., Ashdown, M., et al. 2018, arXiv e-prints,arXiv:1807.06205
* Astropy Collaboration, Robitaille, T. P., Tollerud, E. J., et al.2013, [A&A, 558, A33](http://dx.doi.org/10.1051/0004-6361/201322068)
* Bennett, C. L., Kogut, A., Hinshaw, G., et al. 1994, [ApJ, 436, 423](http://dx.doi.org/10.1086/174918)
* Bennett, C. L., Halpern, M., Hinshaw, G., et al. 2003, [ApJS, 148,1](http://dx.doi.org/10.1086/377253)
* Choi, S., Hasselfield, M., Ho, P., Koopman, B., & Lungu, M.2020, ApJS
* Darwish, O., Madhavacheril, M. S., Sherwin, B., et al. 2020, [arXiv:2004.01139 [astro-ph.CO]](http://arxiv.org/abs/2004.01139)
* Górski, K. M., Hivon, E., Banday, A. J., et al. 2005, [ApJ, 622, 759](http://dx.doi.org/10.1086/427976)
* Han et al. 2020, In preparation, 1
* Hilton et al. 2020, In preparation, 1
* Hunter, J. D. 2007, [Computing in Science & Engineering, 9, 90](http://dx.doi.org/10.1109/MCSE.2007.55)
* Lewis, A. 2019, [arXiv:1910.13970 [astro-ph.IM]](http://arxiv.org/abs/1910.13970)
* Lewis, A., Challinor, A., & Lasenby, A. 2000, [ApJ, 538, 473](http://dx.doi.org/10.1086/309179)
* Madhavacheril, M. S., Hill, J. C., Naess, S., et al. 2019, [arXiv:1911.05717 [astro-ph.CO]](http://arxiv.org/abs/1911.05717)
* Naess et al. 2020, In preparation, 1
* Price-Whelan, A. M., Sip ̋ocz, B. M., Günther, H. M., et al. 2018, [AJ, 156, 123](http://dx.doi.org/10.3847/1538-3881/aabc4f)
* Reinecke, M., & Seljebotn, D. S. 2013, [A&A, 554, A112](http://dx.doi.org/10.1051/0004-6361/201321494)
* Zonca, A., Singer, L., Lenz, D., et al. 2019, [Journal of OpenSource Software, 4, 1298](http://dx.doi.org/10.21105/joss.01298)

