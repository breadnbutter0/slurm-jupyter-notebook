#%%
import os

file_dir = os.path.dirname(os.path.realpath(__file__))
#%%
try:
    with open("{}/jupyter.log".format(file_dir)) as f:
        lines=f.readlines()
        
    hostname = lines[6][:-1]
    for i, line in enumerate(lines):
        try:
            host = line.split(' ')[1]
            if i > 6 and host == hostname:
                host_ip_address = line.split(' ')[0]
            
            if line == '    Or copy and paste one of these URLs:\n':
                jupyter_vscode = lines[i+1][8:-1]
                jupyter_local_url = lines[i+2][8:-1]
        except:
            pass
        
    port = jupyter_local_url.split(':')[2].split('/')[0]
    user_name = lines[0].split(':')[1][1:-1]

    print("="*100)
    print("Run this command on your local terminal:")
    print("ssh -N -L{}:{}:{} {}@gilbreth.rcac.purdue.edu".format(port,host_ip_address,port,user_name))
    print("="*100)
    print("Jupyter local url:")
    print(jupyter_local_url)
    print("="*100)
    print("Visual Studio Code Jupyter Remote Serever:")
    print(jupyter_vscode)
    print("="*100)
    
except:
    print("Jupyter is opening.. Please wait for a few seconds..")