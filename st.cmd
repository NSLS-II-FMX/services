#!/bin/bash
export PATH=/opt/conda/bin/:$PATH
export USER=xf17id2
export HOME=/epics/iocs/notebook
export SHELL=bash

. /etc/profile.d/epics.sh
. /opt/conda/etc/profile.d/conda.sh

log_dir="/var/log/jupyter"
jupyter_log="$log_dir/jupyter-fmx_$(date "+%F_%H-%M-%S").log"

# source activate /opt/conda_envs/collection-17Q3.0
# conda activate /opt/conda_envs/collection-2019-2.0-fmx
# conda activate /opt/conda_envs/collection-2019-3.0-fmx
# conda activate /opt/conda_envs/collection-2020-2.0rc8
# conda activate /opt/conda_envs/collection-2021-1.0
# conda activate /opt/conda_envs/nsls2-collection-2021-2.2
# conda activate /opt/conda_envs/2022-1.0-py39
conda activate /nsls2/conda/envs/2022-2.0-py39

###############################################################################
# DAMA note (July 10, 2019): the corresponding kernel file is defined in      #
# /usr/share/jupyter/kernels-available/collection-*/kernel.json, and          #
# symlinked to /usr/share/jupyter/kernels/collection-*/kernel.json            #
###############################################################################

jupyter lab --no-browser --notebook-dir=/epics/iocs/notebook/notebooks/ --ip=0.0.0.0 --port=17000 --debug > $jupyter_log 2>&1
