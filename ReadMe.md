## This repository allows users to run and access the map-manipulation library Pixell and run the Jupyter notebook tutorials associated with Data Release 4 and 5 (DR4 and DR5).

ACT's DR4 and DR5 include intensity and polarization maps covering close to half the sky as well as a variety of other data products.  These data products are described in some detail in the Python Notebook Tutorials presented here.  The tutorials also introduce users to the Plate Carree maps used for the ACT data products as well as the python library, Pixell, used to handle the maps.

The full list of ACT DR4 and DR5 data products can be found on LAMBDA [here](https://lambda.gsfc.nasa.gov/product/act/). 

For questions or comments pertaining to these notebooks please reach out to our help desk at act_notebooks@googlegroups.com.

## Installing and Running the Notebooks

There are two options for building and running this repo: a completely local installation, along with a local download of required data, or a fully-containerized installation via Docker, which installs all dependencies. In the latter case, users will manually download required data during the container setup. We provide instructions for either case. We assume you are running >= Python 3.6 as your default `python` version in your environment.

---

## Local Installation 
### Download the necessary data products 
The links to all of the products used in these notebooks have been compiled in pull_data bash scipts which makes it simple to download the data products using wget or curl. Feel free to add any other data products you'd like to pull by adding it to the relevant pull_data file following the pre-existing format.

In addition to providing pull_data scripts for the entire notebook set, we've also provided scripts that pull products for a subset of notebooks as a space-saving measure. If you only want to run a few of the notebooks, and would like to only pull data corresponding to those notebooks, simply replace the filename in the next two commands with the filename corresponding to the desired notebook(s). The full dataset is around 7.3GB in size: it should take you ~30 - 45 min to download everything (LAMBDA can be slow, but the other servers should permit a faster download speed).

First set up a directory to hold the data products you will download. Then, copy the pull_data script you wish to run into that directory. Finally, execute either of the following commands in that directory (e.g. to download all the data products):

	sh pull_data_wget.sh
	
Or if you are working on a mac and don't have wget set up, you can use homebrew or use curl instead:
	
	sh pull_data_curl.sh
	
The above will pull all of the data products with the exception of the full-resolution, full-size coadded maps due to the size of these files. Therefore, for the coadded map we automatically provide smaller versions (a full-res, smaller-footprint-cutout, and a low-res, full-size-footprint version); however, you can also get the full map from the LAMBDA website if you wish to use that.  You would need the file: 

	"act_planck_dr5.01_s08s18_AA_f150_night_map.fits"

Make sure you change the variable `path` in [Section 1](Notebooks/Section_1_Introduction.ipynb) to reflect the directory holding your local data!

### Installing packages
We highly recommend working entirely within a conda environment to manage packages. If that is not possible for you, you should still be able to install all dependencies.

Most of the packages required to run the notebooks have well documented installation procedures, available on their websites ([Healpy](https://healpy.readthedocs.io/en/latest/), [getdist](https://getdist.readthedocs.io/en/latest/), [astropy](https://docs.astropy.org/en/stable/), [CAMB](https://camb.readthedocs.io/en/latest/index.html), [matplotlib](https://matplotlib.org/), [numpy](https://numpy.org/), [pandas](https://pandas.pydata.org/), [plotly](https://plotly.com/python/), [scipy](https://www.scipy.org/)). For proprietary packages ([Pixell](https://github.com/simonsobs/pixell/), [pyactlike](https://github.com/ACTCollaboration/pyactlike), [nawrapper](https://github.com/xzackli/nawrapper)), you can navigate to the ReadMe of the repositories and follow their installation documentation; or, we have reproduced it for you here:

1) Pixell

	- Install all `Pixell` dependencies [listed here](https://github.com/simonsobs/pixell/#dependencies)
	- Run the following two lines:
		
		pip install pixell --user
		
		test-pixell
		
	You may need to restart your environment for `test-pixell` to work.
	
2) pyactlike

	- Navigate to a location in your environment where you are comfortable installing a GitHub repo
	- Download the repo files located here: 
	
		https://lambda.gsfc.nasa.gov/data/suborbital/ACT/ACT_dr4/likelihoods/actpollite_python_dr4.01.tar.gz
		
	- Extract the files from the `tar.gz` zipped file. There should be a new folder made in your current directory called `actpollite_python_dr4.01`. 
	- Navigate into `actpollite_python_dr4.01` and run the following:
		
		pip install . --user
	
	- You can test the install with `pytest` in the base directory of the cloned `pyactlike` repo (the `actpollite_python_dr4.01` folder)
		
3) nawrapper

	- The recommended installation procedure involves working in a conda environment. If this is something you are comfortable with, or prefer, follow the clear and detailed steps [outlined here](https://xzackli.github.io/nawrapper/usage/installation.html)
	- Otherwise, [install namaster](https://github.com/LSSTDESC/NaMaster). The easiest way to do this is to install `pymaster`:
	
		pip install pymaster --user
		
	- Install `nawrapper` dependencies not already mentioned above: [cython](https://cython.readthedocs.io/en/latest/) and [pillow](https://pillow.readthedocs.io/en/stable/)
	- Install `nawrapper`:
	
		git clone git@github.com:xzackli/nawrapper.git
		
		cd nawrapper
		
		pip install -e . --user
	

--------------
## Docker Installation

We now walk through the Docker installation procedure.  The initial set up should be reasonably fast with the exception of the step that downloads the data.  After setting up the container up once, it's easy to relaunch it with a single command at any time.

1) Install and run [docker](https://www.docker.com/):

   - Create a Docker account and then sign in
   - Docker is set up to limit the memory available to your container. **Some notebooks are CPU and memory intensive, so you should adjust this! Go into Preferences -> Resources and set Memory to 10GB and CPUs to 4**.  You can increase them at any point if you need to.

2) Pull the Docker image:

	- open your terminal or command line and run:

 			docker run -d -it -p 8888:8888 --name dr4_tutorials  --rm actcollaboration/dr4_tutorials
		
	This command connects the containers port to the local port with the `-p` flag, it names the container with the `--name` flag, it tells your system to remove the container once the session is ended with the `--rm` flag and then finally it points to the image you want to pull which is called `actcollaboration/dr4_tutorials`

3) Move the container content to a local directory:

	- We now want to move the data in the container to somewhere that's easy to find on your local machine.  We suggest creating a folder on your computer somewhere where you want to store the data for this tutorial.  The path to that folder should replace `[local_path]` in the lines below. 	
		
			docker cp dr4_tutorials:/usr/home/workspace/. [local_path] && cd [local_path]/Data
   
    This command copies the contents of the image using the `cp` command to somewhere on your local machine and then we go to the data folder in that repository.
    
4) Download the data:

	- In order to run the notebooks you'll need to download the relevant data products. In the data folder of this repo you'll notice a few different scripts that have been set up to pull the correct products.  If you're on a mac you will want to use the files that have 'curl' in the name, unless you have wget set up already.  You can choose to pull all of the data products or just a subset depending on which file you choose (run `ls` for macs or `dir` for windows to check what files are available).  From there you just need to run that file using:
   
   			sh [pull_data_curl].sh
		
   Just replace the `[pull_data_curl]` part with the name of the file you wish to run. This procedure is the same as the local installation/download instructions. 
5) Relaunch the container with the new data:

	- Now that we have the data we just need to relaunch our container and we're ready to go.  To do so we first stop the container (the part of this command before the `&&` can be used to stop the container whenever you wish to do so in the future) and then relaunch it :

			docker container stop dr4_tutorials && docker run -it -p 8888:8888 -v [local_path]:/usr/home/workspace --name dr4_tutorials --rm actcollaboration/dr4_tutorials

	- Again you need to replace `[local_path]` with the path to the folder you created earlier.  Here the `-v` flag mounts your local folder onto the container so that you can easily access the data and save any changes you make to the notebooks.  
	- If you're on a windows machine you may need to switch the slashes in the path name to `/` (forward slashes) instead of back slashes. If the command fails on the path name the first time then just run the second half of it with the corrected path name:
		
			docker run -it -p 8888:8888 -v [local_path]:/usr/home/workspace --name dr4_tutorials --rm actcollaboration/dr4_tutorials

	- For future use of this container you can relaunch it using just the above command and you can stop it using `docker container stop dr4_tutorials`

6) Launch Jupyter Notebook:

	- You will now be in the container and should be able to launch the jupyter notebooks by just running 
		
			jupyter notebook --ip 0.0.0.0
	

   - In the terminal you should now see a link that you can copy and paste into a browser.  The link will open up jupyter notebook and you'll be able to navigate to the notebooks and run them in the container.
   
7) Run Tutorials:

   - To check your data has correctly linked open the data directory, you should see a list of the relevant files.
   
   - Navigate to the Tutorials folder and start with the 1st notebook which serves as an indtroduction and provides an overview of the tutorials.
   
### Trouble Shooting the Docker Jupyter notebooks
This step can occasionally cause problems if you are already using the port `8888` on your computer (i.e. you have another notebook running somewhere or something similar). Here are some trouble shooting steps you can try.

   - Try explicitly navigating to the `8888` port by opening your browser and entering:
   	localhost:8888/
     - When prompted for a token copy and paste the token from the url or find it using the terminal by typing:
   
   			jupyter notebook list
		
     - This will give a list of running jupyter notebooks that should look like this:
   		
		Currently running servers:
		
		http://localhost:8888/?token=0d66c7b877535a9511ebe70d230f5ed65df1e9a0ac4f1144 :: /Users/.... Folder Path
	
     - Copy the text after 'token=' and before the ' :: /Users...' into the token request box and that should launch the notebook.
   
   - You can map the notebook onto a different port
   
     - Close your container by typing `exit` then run:
   
   			docker run -it -p 8889:8888 -v [local_path]:/usr/home/workspace --name dr4_tutorials --rm actcollaboration/dr4_tutorials
   	
        
      - Now re run jupyter notebook as before and copy the link but change the numbers in the url `8888` -> `8889` 
   

   
Note: You can also create new notebooks or add other data sets to the local directory that will automatically become available in the container.

When in the container if you wish to save work or data locally simply save them to the 'data/' folder that you linked with your local data when launching the container.


### Dependencies 
- [Pixell](https://github.com/simonsobs/pixell/)
- [pyactlike](https://github.com/ACTCollaboration/pyactlike)
- [nawrapper](https://github.com/xzackli/nawrapper)
- [Healpy](https://healpy.readthedocs.io/en/latest/)
- [getdist](https://getdist.readthedocs.io/en/latest/)
- [astropy](https://docs.astropy.org/en/stable/)
- [CAMB](https://camb.readthedocs.io/en/latest/index.html)
- [matplotlib](https://matplotlib.org/)
- [numpy](https://numpy.org/)
- [pandas](https://pandas.pydata.org/)
- [plotly](https://plotly.com/python/)
- [scipy](https://www.scipy.org/)


## References:

* Aiola, S., Calabrese, E., Loic, M., & Naess, S. 2020, ApJS, 1, 1 [pre-publication](https://phy-act1.princeton.edu/public/saiola/act_dr4_A20.pdf)
* Akrami, Y., Arroja, F., Ashdown, M., et al. 2018, arXiv e-prints, [arXiv:1807.06205](https://arxiv.org/abs/1807.06205)
* Astropy Collaboration, Robitaille, T. P., Tollerud, E. J., et al.2013, [A&A, 558, A33](http://dx.doi.org/10.1051/0004-6361/201322068)
* Bennett, C. L., Kogut, A., Hinshaw, G., et al. 1994, [ApJ, 436, 423](http://dx.doi.org/10.1086/174918)
* Bennett, C. L., Halpern, M., Hinshaw, G., et al. 2003, [ApJS, 148, 1](http://dx.doi.org/10.1086/377253)
* Carlstrom, J.E., Holder, G. P., Reese, E. D. 2002 [ARAA, 40, 643](https://doi.org/10.1146/annurev.astro.40.060401.093803)
* Choi, S., Hasselfield, M., Ho, P., Koopman, B., & Lungu, M.2020, ApJS [pre-publication](https://phy-act1.princeton.edu/public/saiola/act_dr4_C20.pdf)
* Darwish, O., Madhavacheril, M. S., Sherwin, B., et al. 2020, [arXiv:2004.01139 [astro-ph.CO]](http://arxiv.org/abs/2004.01139)
* Górski, K. M., Hivon, E., Banday, A. J., et al. 2005, [ApJ, 622, 759](http://dx.doi.org/10.1086/427976)
* Han, D., Sehgal, N., MacInnis, A., et al. 2020, [arXiv:2007.14405 [astro-ph.CO]](https://arxiv.org/abs/2007.14405)
* Hilton, M., Sifon, C., Naess, S., et al. 2020, [arXiv:2009.11043 [astro-ph.CO]](https://arxiv.org/abs/2009.11043)
* Hunter, J. D. 2007, [Computing in Science & Engineering, 9, 90](http://dx.doi.org/10.1109/MCSE.2007.55)
* Lewis, A. 2019, [arXiv:1910.13970 [astro-ph.IM]](http://arxiv.org/abs/1910.13970)
* Lewis, A., Challinor, A., & Lasenby, A. 2000, [ApJ, 538, 473](http://dx.doi.org/10.1086/309179)
* Louis et al. 2017, [JCAP, 06, 031](https://doi.org/10.1088/1475-7516/2017/06/031)
* Madhavacheril, M. S., Hill, J. C., Naess, S., et al. 2019, [arXiv:1911.05717 [astro-ph.CO]](http://arxiv.org/abs/1911.05717)
* Naess et al. 2020, In preparation, 1 [pre-publication](https://phy-act1.princeton.edu/public/saiola/act_dr4_N20.pdf)
* Naess et al. 2014, [JCAP, 10, 007](https://doi.org/10.1088/1475-7516/2014/10/007)
* Price-Whelan, A. M., Sip ̋ocz, B. M., Günther, H. M., et al. 2018, [AJ, 156, 123](http://dx.doi.org/10.3847/1538-3881/aabc4f)
* Plotly Technologies Inc. Collaborative data science. Montréal, QC, 2015. https://plot.ly.
* Reinecke, M., & Seljebotn, D. S. 2013, [A&A, 554, A112](http://dx.doi.org/10.1051/0004-6361/201321494)
* Zonca, A., Singer, L., Lenz, D., et al. 2019, [Journal of OpenSource Software, 4, 1298](http://dx.doi.org/10.21105/joss.01298)
