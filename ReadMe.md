## This repository allows users to run and access Advanced ACT’s library Pixell and run the Jupyter notebook tutorials associated with Data Release 4.
---
Adv ACT's Data Release 4 includes intensity and polarization maps covering close to half the sky as well as a variety of other data products.  These data products are described in some detail in the Python Notebook Tutorials presented here.  The tutorials also introduce users to the Plate Carree maps used for the AdvACT data products as well as the python library, Pixell, used to handle the maps.  

The notebooks are implemented using a Docker Image which installs Pixell in a container and allows users to easily install the Pixell library.  However, if users are interested in performing more in depth analyses using Pixell we encourage you to fully install the library following the instructions found [here](https://github.com/simonsobs/pixell). 

---
Note: 

In order for the notebooks to run fully you’ll need to have all of the data products downloaded and located in a file on your computer. 
The location and name of this file will be linked to the container

### To run the entirety of these notebooks you will need to have the following data products downloaded:

#### To Run 'Advanced_ACT_DR4_Combined_data_products.ipynb'
- ACT + Planck Coadded map : "act_planck_s08_s18_cmb_f150_night_map_I.fits"
- Planck Map : "HFI_SkyMap_143_2048_R2.02_halfmission-1.fits"
- Cluster catalog : 'E-D56Clusters.fits'
- List of Messier objects : "messier_objs.csv"
- Lensing Map : "mc_corrected_realKappaCoadd_s14&15_deep56New.fits"
- Compton-$y$ : "tilec_single_tile_deep56_comptony_map_v1.2.0_joint.fits"
- CMB + kSZ : "tilec_single_tile_deep56_cmb_map_v1.2.0_joint.fits"
- CMB + kSZ with tSZ deprojected : "tilec_single_tile_deep56_cmb_deprojects_comptony_map_v1.2.0_joint.fits"

#### To Run "Advanced_ACT_DR4_Map_Splits_with_Power_Spectrum_analysis.ipynb"
- Sample Adv ACT patch without sources, set 1: "act_dr4_s15_D8_pa2_f150_nohwp_night_3pass_4way_set1_map_srcfree.fits"
- Sample Adv ACT patch without sources, set 2: "act_dr4_s15_D8_pa2_f150_nohwp_night_3pass_4way_set2_map_srcfree.fits"
- Corresponding source map: "act_dr4_s15_D8_pa2_f150_nohwp_night_3pass_4way_set2_srcs.fits"
- Beam: "s15_pa2_f150_nohwp_night_beam_tform_instant_cmbspec.txt"

--------------

### To run and set up Pixell and the tutorial:

1) Install and run [docker](https://www.docker.com/)
   - Create a Docker account and then sign in

2) Clone this repository and then open terminal.

3) In terminal navigate to the cloned repository and run:
   - docker build -t advact/tutorials:1.0 .
   
    This first command compiles the neccesary packages and will take some time to run (~ 6 minutes)
    
   - docker run -it -p 8888:8888 -v [Path_to_Local_data]:/usr/home/workspace/data --rm advact/tutorials:1.0
	
    Here "Path_to_local_data" Must be replaced with the path to the data folder on your machine that contains the relevant maps
    At this point the docker container is running and you can launch Jupiter notebook in order to run the tutorial.

4) Launch Jupiter notebook
   - jupyter notebook --ip 0.0.0.0 --no-browser
   
   - In the terminal you should now see a link that you can copy and paste into a browser.  The link will open up jupyter notebook and you'll be able to navigate to the notebooks and run them in the container.
   
   - If that deosn't work open your browser and navigate to 
   	- localhost:8888/
   - When prompted for a token copy and paste the token from the url or find it using the terminal by typing:
   	- jupyter notebook list
  	This will give a list of running jupyter notebooks that should look like this:
   		Currently running servers:
		http://localhost:8888/?token=0d66c7b877535a9511ebe70d230f5ed65df1e9a0ac4f1144 :: /Users/.... Folder Path
	
	Copy the text after 'token=' and before the ' :: /Users...' into the token request box and that should launch the notebook.
	
5) Run Tutorials:
   - To check your data has correctly linked open the data directory, you should see a list of the relevant files.
   
   - Navigate to the Tutorials folder and start with the 1st notebook which serves as an indtroduction and provides an overview of the tutorials.
   

   
Note: You can also create new notebooks or add other data sets to the local directory that will automatically become available in the container.




