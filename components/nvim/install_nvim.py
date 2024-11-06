import os
import shutil
import sys
import tarfile
import urllib.request

url = "https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz"
nvim_path = "/tmp/nvim-linux64"
tar_path = nvim_path + ".tar.gz"
local_path = os.path.join(os.environ["HOME"], ".local")

def get_nvim():
    urllib.request.urlretrieve(url, tar_path)
    with tarfile.open(tar_path, "r:gz") as tar:
        tar.extractall(path=nvim_path)

def clean():
    os.remove(tar_path)
    os.remove(nvim_path)

def install_diff(src, dest_dir):
    for p in os.listdir(src):
        path = os.path.join(src, p)
        dest = os.path.join(dest_dir,p)
        if os.path.exists(dest):
            print(dest, "is exist")
            if os.path.isdir(dest):
                install_diff(path, dest)
        else:
            print(path, dest)
            if os.path.isdir(path):
                shutil.copytree(path, dest)
            else:
                shutil.copy(path, dest)

get_nvim()
install_diff(nvim_path, local_path)
