if command -v xmodmap &> /dev/null
then
    /bin/bash -c "sleep 20; /usr/bin/xmodmap ~/.xmodmap"
fi
