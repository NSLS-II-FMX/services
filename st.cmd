#!/bin/bash
export PATH=/opt/conda/bin/:$PATH
export USER=notebook
export HOME=/epics/iocs/notebook
export SHELL=bash

source /etc/profile.d/proxy.sh

# export http_proxy=http://proxy:8888
# export https_proxy=http://proxy:8888
# export no_proxy=cs.nsls2.local,localhost,127.0.0.1

log_dir="/var/log/jupyter/"
jupyter_log="$log_dir/jupyter-fmx_$(date "+%F_%H-%M-%S").log"

. /opt/conda/etc/profile.d/conda.sh

# source activate /opt/conda_envs/collection-17Q3.0
# conda activate /opt/conda_envs/collection-2019-2.0-fmx
# conda activate /opt/conda_envs/collection-2019-3.0-fmx
# conda activate /opt/conda_envs/collection-2020-2.0rc8
conda activate /opt/conda_envs/collection-2021-1.0

###############################################################################
# DAMA note (July 10, 2019): the corresponding kernel file is defined in      #
# /usr/share/jupyter/kernels-available/collection-*/kernel.json, and          #
# symlinked to /usr/share/jupyter/kernels/collection-*/kernel.json            #
###############################################################################

jupyter lab --no-browser --notebook-dir=/epics/iocs/notebook/notebooks/ --ip=0.0.0.0 --port=17000 --NotebookApp.token='' --debug > $jupyter_log 2>&1
