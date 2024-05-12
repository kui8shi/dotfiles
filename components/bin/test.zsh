install_diff () {
  path=$1
  dest_root=$2
  echo "install_diff($path, $dest_root)"
  for p in $(ls -1 $path); do
    src=$path/$p
    dest=$dest_root/$(dirname $p)
	  echo $path + $p = $src
    if [ -e $dest_root/$p ]; then
      if [ -d $dest_root/$p ]; then
      	install_diff $path/$p $dest_root
      fi
    else
      src=$path/$p
      install $src $dest
    fi
  done
}
install_diff /tmp/nvim-linux64 ~/.local
