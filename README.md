# slurm-jupyter-notebook

## Start jupyter notebook using slurm

This will automatically submit a jupyter notebook job every 4 hours. Everytime the job is newly submitted, you have to re-do the process from step 2.

### Access via Visual Studio Code

1.  Open gilbreth terminal and run

    ```bash
    sbatch repeat_jupyter.sh
    ```

2.  Once the job starts to run, you will see two submitted jobs name `jupyter` and `repeat_jupyter` in squeue.

    To check the job status, run

    ```bash
    squeue -u <user_name>
    ```

3.  To check the jupyter notebook url, run

    ```bash
    python jupyter_url.py
    ```

4.  In Visual Studo Code, Ctrl + Shift + P and search

    - `Jupyter: Specify Jupyter Server for Connections`

    - Choose `Excisting`

    - Copy and paste the `Visual Studio Code Jupyter Remote Server` URL from Step 3.

    - Choose the jupyter kernel

### Access via your local machine

1. Open your local terminal

2. Copy and paste `Run this command on your local termnial` command from ealier process step 3.

3. Open jupyter notebook using `Jupyter local url` from ealier process step 3.

You can see the details in `jupyter.log` file
