#README for model code for: Managing Climate Change Under Uncertainty: Recursive Integrated Assessment at an Inflection Point

The model is written in MATLAB and requires the COMPECON toolbox by Miranda and Fackler. It can be found at: http://www4.ncsu.edu/~pfackler/compecon/toolbox.html

There is a main folder and two subfolders. One subfolder, Smolyak, contains the Smolyak collocation codes. Some of these codes are adapted from ones graciously provided online by Lilia and Serguei Maliar. Others are partially adapted from Python code provided at EconForge: https://github.com/EconForge. The other subfolder, Results, contains the solutions (basis function coefficients) to the problem.

How to run the model:

main_dice.m - the main script to run the entire model. This will generate a workspace.mat in a folder under the Results subfolder, with indicators in the folder name for what type of run it was.

sub_time_paths.m - The subroutine to simulate paths conditional on the solution to the finite horizon problem. Load the workspace.mat that corresponds to the model you wish to simulate. channels_out contains the optimal carbon tax channels found in the main text.
