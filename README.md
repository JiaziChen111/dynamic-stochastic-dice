#Code README for: Managing Climate Change Under Uncertainty: Recursive Integrated Assessment at an Inflection Point
#By: Derek Lemoine and Ivan Rudik

The model is written in MATLAB and requires the COMPECON toolbox by Miranda and Fackler. It can be found at: http://www4.ncsu.edu/~pfackler/compecon/toolbox.html. As is, the model will replicate results found in the paper. However, users can change the code to explore different scenarios (e.g. different damage functions).

There is a main folder and four subfolders. One subfolder, Smolyak, contains the Smolyak collocation codes. Some of these codes are adapted from ones graciously provided online by Lilia and Serguei Maliar. Others are partially adapted from Python code provided at EconForge: https://github.com/EconForge. The second subfolder, Results, contains the solutions (basis function coefficients) to the problem. The third subfolder contains the COMPECON toolbox codes. The fourth subfolder contains the structures for the terminal value functions.

How to run the model:

main_dice.m - the main script to run the entire model. This will generate a workspace.mat in a folder under the Results subfolder, with indicators in the folder name for what type of run it was.

time_paths.m - The subroutine to simulate paths conditional on the solution to the finite horizon problem. Load the workspace.mat that corresponds to the model you wish to simulate. channels_out contains the optimal carbon tax channels found in the main text.

Note: the controls for the model code are effective consumption and *abatement cost*. Using abatement cost as a control instead of abatement allows for a linearly constrained maximization problem.
