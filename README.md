# slurm-jupyter-notebook

## Download the repository and set the environment

Clone the repository

```bash
git clone git@github.com:breadnbutter0/slurm-jupyter-notebook.git
```

Change directory to the repository

```bash
cd slurm-jupyter-notebook
```

Export jupyter notebook path to bashrc

```bash
echo export JNPATH="$(pwd)" >> ~/.bashrc
```

```bash
source ~/.bashrc
```

Set aliases for the easier implementation

```bash
echo alias startjn="'cd ${JNPATH} && sbatch ${JNPATH}/repeat_jupyter.sh'" >> ~/.bashrc
echo alias jnurl="'python ${JNPATH}/jupyter_url.py'" >> ~/.bashrc
echo alias jnlog="'code ${JNPATH}/jupyter.log'" >> ~/.bashrc
```

```bash
source ~/.bashrc
```

## Start jupyter notebook

1.  Open gilbreth terminal and run

```bash
startjn
```

This will automatically submit a jupyter notebook job every 4 hours. Everytime the job is newly submitted, you have to re-do the process from step 2.

2.  Once the job starts to run, you will see two submitted jobs: `jupyter` and `repeat_jupyter` in squeue in few seconds. Run

```bash
squeue -u <user_name>
```

You should be able to see something like this:

```bash
JOBID        USER      ACCOUNT      NAME             NODES   CPUS  TIME_LIMIT ST TIME
603871       kim4012   standby      jupyter              1      1     4:00:00  R 38:24
603869       kim4012   standby      repeat_jupyter       1      1     4:00:00  R 40:24
```

3.  To check the jupyter notebook url, run

```bash
jnurl
```

Then, in command line,

```bash
====================================================================================================
Run this command on your local terminal:
ssh -N -L8081:172.18.36.22:8081 kim4012@gilbreth.rcac.purdue.edu
====================================================================================================
Jupyter local url:
http://127.0.0.1:8081/?token=8de77a33ae584043d7d28ad244b9a5f147f03b7a5b33c6cc
====================================================================================================
Visual Studio Code Jupyter Remote Serever:
http://gilbreth-b008:8081/?token=8de77a33ae584043d7d28ad244b9a5f147f03b7a5b33c6cc
====================================================================================================
```

### Access via Visual Studio Code

In Visual Studo Code, `Ctrl + Shift + P` and search

- `Jupyter: Specify Jupyter Server for Connections`

- Choose `Existing`

- Copy and paste the `Visual Studio Code Jupyter Remote Server` URL from Step 3.

- Choose the jupyter kernel

### Access via your local machine

- Open your local terminal

- Copy and paste `Run this command on your local termnial` command from ealier process step 3.

- Open jupyter notebook using `Jupyter local url` from ealier process step 3.

You can see the details in `jupyter.log` file

```bash
jnlog
```

If you succesfully started the jupyter notebook, you should see somthing below at the bottom line of the `jupyter.log`

```bash
...

[I 20:04:51.491 NotebookApp] Jupyter Notebook 6.1.4 is running at:
[I 20:04:51.491 NotebookApp] http://gilbreth-b008:8081/?token=8de77a33ae584043d7d28ad244b9a5f147f03b7a5b33c6cc
[I 20:04:51.492 NotebookApp]  or http://127.0.0.1:8081/?token=8de77a33ae584043d7d28ad244b9a5f147f03b7a5b33c6cc
[I 20:04:51.492 NotebookApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
[C 20:04:51.495 NotebookApp]

    To access the notebook, open this file in a browser:
        file:///home/kim4012/.local/share/jupyter/runtime/nbserver-24402-open.html
    Or copy and paste one of these URLs:
        http://gilbreth-b008:8081/?token=8de77a33ae584043d7d28ad244b9a5f147f03b7a5b33c6cc
     or http://127.0.0.1:8081/?token=8de77a33ae584043d7d28ad244b9a5f147f03b7a5b33c6cc

[I 20:36:52.249 NotebookApp] Creating new notebook in
[I 20:36:52.466 NotebookApp] Kernel started: 2dcffdde-9483-4b84-9e32-d937e7848f75, name: tf-gpu
[W 20:36:52.490 NotebookApp] delete /noise_label-jvsc-4064aa38-5253-436e-a684-79bd09bc8294231396ee-5b0f-4856-bfdb-728bc1242a52.ipynb
[W 20:36:52.490 NotebookApp] Skipping trash for /depot/jinha/gdsl/Hansae/projects/PARCEL/python/slurm-jupyter-notebook/noise_label-jvsc-4064aa38-5253-436e-a684-79bd09bc8294231396ee-5b0f-4856-bfdb-728bc1242a52.ipynb, on different device to home directory
```
