# Use Apple's man page viewer
function man {
    if [ $# -eq 1 ] ;
        then open x-man-page://$1 ;
    elif [ $# -eq 2 ] ;
        then open x-man-page://$1/$2 ;
    fi
}
