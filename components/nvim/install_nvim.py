import os
import platform
import shutil
import sys
import tarfile
import tempfile
import urllib.request

def get_asset_name():
    system = platform.system()
    machine = platform.machine().lower()
    arch = "arm64" if machine in ("arm64", "aarch64") else "x86_64"
    if system == "Darwin":
        return f"nvim-macos-{arch}"
    if system == "Linux":
        return f"nvim-linux-{arch}"
    sys.exit(f"Unsupported platform: {system} {machine}")

asset = get_asset_name()
url = f"https://github.com/neovim/neovim/releases/download/stable/{asset}.tar.gz"
work_dir = tempfile.mkdtemp(prefix="install_nvim_")
nvim_path = os.path.join(work_dir, asset)
tar_path = nvim_path + ".tar.gz"
local_path = os.path.join(os.environ["HOME"], ".local")

def get_nvim():
    urllib.request.urlretrieve(url, tar_path)
    with tarfile.open(tar_path, "r:gz") as tar:
        tar.extractall(path=nvim_path)

def clean():
    shutil.rmtree(work_dir, ignore_errors=True)

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

try:
    get_nvim()
    install_diff(nvim_path, local_path)
finally:
    clean()
