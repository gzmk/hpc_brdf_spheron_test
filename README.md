# hpc_brdf_spheron_test

This code is written to run on the High Performance Computer (HPC)
If running on a computer locally, all you need is render_test.m and Conditions, Mappings and .dae (3D model) files.

gk_hpc_conf.m is required to configure the Mitsuba on HPC. 
run-matlab.pbs is for sending jobs to HPC. 

Ben: You can see in the Mappings file all other ways I tried to change the camera setting. 
You can use either .dae files to render. 
