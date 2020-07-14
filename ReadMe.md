## This repository allows users to run and access the map-manipulation library Pixell and run the Jupyter notebook tutorials associated with Data Release 4.
---
ACT's Data Release 4 includes intensity and polarization maps covering close to half the sky as well as a variety of other data products.  These data products are described in some detail in the Python Notebook Tutorials presented here.  The tutorials also introduce users to the Plate Carree maps used for the ACT data products as well as the python library, Pixell, used to handle the maps.  


## Installing and Running the Notebooks

The notebooks are implemented using a Docker Image which installs Pixell and the other relevant packages in a container.  However, if users are interested in performing more in-depth analyses using these packages we also offer instructions for a local installation of the relevant software. 

---

## Local Installation 
### Download the neccesary data products 
The links to all of the products used in these notebooks have been compiled in pul_data.sh files which makes it simple to download the data products using wget or curl.  Feel free to add any other data products you'd like to pull to the file following the pre-existing format or comment out ones you don't want to use.  

You'll notice we provide you with a general pull_data file which includes all of the needed files, but we've also split these into smaller groups according to the notebooks they are used for.  If you only want to run a few of the notebooks and would like to pull the data that corresponds just to those notebooks instead of the full set simply replace the filename in the next two commands with the file name corresponding to the notebook you wish to pull data for. The full dataset is around 8.5GB in size: if your internet downloads data at 5-10MBps, it will take you ~15 - 25min to download everything.

To pull the data using the text file and curl or wget you will want to place the pull_data file in the folder you wish to download the data into and then run:

	sh pull_data_wget.sh
	
Or if you are working on a mac and don't have wget set up you can get it using homebrew or use curl instead:
	
	sh pull_data_curl.sh
	
The above command will pull all of the data products with the exception of the coadded maps due to the size of these files.  For the coadded map we automatically provide smaller versions ( a cut out, and a downgraded version) however you can also get the full map from the LAMBDA website if you wish to use that.  You would need the file: 

	"act_planck_dr4.01_s08s16_AA_f150_night_map.fits"
	
The full list of ACT DR4 data products can be found on LAMBDA [here](https://lambda.gsfc.nasa.gov/product/act/). 

For questions or comments pertaining to these notebooks please reach out to our help desk at act_notebooks@googlegroups.com.

--------------
## Installing with Docker

1) Install and run [docker](https://www.docker.com/):

   - Create a Docker account and then sign in
   - Docker is set up to limit the memory available to your container.  To adjust this go into Preferences -> Resources and set Memory to 10GB and CPUs to 4.  You can increase them at any point if you need to.

2) Pull the Docker image:

	open your terminal or command line and run:

 		docker run -d -it -p 8888:8888 --name dr4_tutorials  --rm actcollaboration/dr4_tutorials
	This command connects the containers port to the local port with the `-p` flag, it names the container with the `--name` flag, it tells your system to remove the container once the session is ended with the `--rm` flag and then finally it points to the image you want to pull which is called `actcollaboration/dr4_tutorials`

3) Move the container content to a local directory:

	We now want to move the data in the container to somewhere that's easy to find on your local machine.  I suggest creating a folder on your computer somewhere where you want to store the data for this tutorial.  The path to that folder should replace `[local_path]` in the lines below. 	
		
		docker cp dr4_tutorials:/usr/home/workspace/. [local_path] && cd [local_path]/Data
   
    This command copies the contents of the image using the `cp` command to somewhere on your local machine and then we go to the data folder in that repository.
    
4) Download the data:

	In order to run the notebooks you'll need to download the relevant data products. In the data folder you'll notice a few different scripts that have been set up to pull the correct products.  If you're on a mac you will want to use the files that have 'curl' in the name, unless you have wget set up already.  You can choose to pull all of the data products or just a subset depending on which file you choose (run `ls` for macs or `dir` for windows to check what files are available).  From there you just need to run that file using:
   
   		sh [pull_data_curl].sh 
   Just replace the `[pull_data_curl]` part with the name of the file you wish to run.
5) Relaunch the container with the new data:

	Now that we have the data we just need to relaunch our container and we're ready to go.  To do so run:

		docker container stop dr4_tutorials && docker run -it -p 8888:8888 -v [local_path]:/usr/home/workspace --name dr4_tutorials --rm actcollaboration/dr4_tutorials

	Again you need to replace `[local_path]` with the path to the folder you created earlier.  If you're on a windows machine you may need to switch the slashes in the path name to `/` (forward slashes) instead of back slashes. If the command fails on the path name the first time then just run the second half of it with the corrected path name:
		
		docker run -it -p 8888:8888 -v [local_path]:/usr/home/workspace --name dr4_tutorials --rm actcollaboration/dr4_tutorials

6) Launch Jupyter Notebook:

	You will now be in the container and should be able to launch the jupyter notebooks by just running 
		
		jupyter notebook --ip 0.0.0.0
	

   - In the terminal you should now see a link that you can copy and paste into a browser.  The link will open up jupyter notebook and you'll be able to navigate to the notebooks and run them in the container.
   
   - If that deosn't work open your browser and navigate to 
   	localhost:8888/
   - When prompted for a token copy and paste the token from the url or find it using the terminal by typing:
   
   			jupyter notebook list
		
  	This will give a list of running jupyter notebooks that should look like this:
   		
	Currently running servers:
		
	http://localhost:8888/?token=0d66c7b877535a9511ebe70d230f5ed65df1e9a0ac4f1144 :: /Users/.... Folder Path
	
	Copy the text after 'token=' and before the ' :: /Users...' into the token request box and that should launch the notebook.
	
7) Run Tutorials:

   - To check your data has correctly linked open the data directory, you should see a list of the relevant files.
   
   - Navigate to the Tutorials folder and start with the 1st notebook which serves as an indtroduction and provides an overview of the tutorials.
   

   
Note: You can also create new notebooks or add other data sets to the local directory that will automatically become available in the container.

When in the container if you wish to save work or data locally simply save them to the 'data/' folder that you linked with your local data when launching the container.





### Dependencies 
- [Pixell](https://github.com/simonsobs/pixell/)
- [pylike](https://github.com/Collaboration/pyactlike)
- [Healpy](https://github.com/healpy/healpy)
- [getdist](https://github.com/cmbant/getdist)
- [nawrapper](https://github.com/xzackli/nawrapper)
- astropy, CAMB, matplotlib, numpy, pandas, scipy  


## References:

* Aiola, S., Calabrese, E., Loic, M., & Naess, S. 2020, ApJS, 1, 1
* Akrami, Y., Arroja, F., Ashdown, M., et al. 2018, arXiv e-prints,arXiv:1807.06205
* Astropy Collaboration, Robitaille, T. P., Tollerud, E. J., et al.2013, [A&A, 558, A33](http://dx.doi.org/10.1051/0004-6361/201322068)
* Bennett, C. L., Kogut, A., Hinshaw, G., et al. 1994, [ApJ, 436, 423](http://dx.doi.org/10.1086/174918)
* Bennett, C. L., Halpern, M., Hinshaw, G., et al. 2003, [ApJS, 148, 1](http://dx.doi.org/10.1086/377253)
* Carlstrom, J.E., Holder, G. P., Reese, E. D. 2002 [ARAA, 40, 643](https://doi.org/10.1146/annurev.astro.40.060401.093803)
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


