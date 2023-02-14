if command -v xmodmap &> /dev/null
then
    /bin/bash -c "sleep 3; /usr/bin/xmodmap ~/.xmodmap"
fi
