CONTROLFILE="controls_fhem-flex.txt"

if [ -z "$*" ]
then
    echo "Usage: "
    echo "    commit.sh <commit message>"
    exit
fi

echo "-------------------------------------------------------------------------"
echo "Your commit message: $*"
echo ""
echo "-------------------------------------------------------------------------"
echo "The following files would be added to the repository:"
echo ""
git add -A --dry-run

echo ""
echo "-------------------------------------------------------------------------"
echo "The following changes would be committed:"
echo ""
git commit -a -m "$*" --dry-run

if [[ $* =~ ^test$ ]]
then
    exit
fi

echo ""
echo "-------------------------------------------------------------------------"
read -p "Proceed to commit? " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "...adding files"
    git add -A
    
    echo "...writing CHANGED file"
    mv CHANGED _CHANGED
    TODAY=$(date +"%Y-%m-%d")
    echo " - $TODAY: $*" > CHANGED
    cat _CHANGED >> CHANGED
    rm _CHANGED
    
    echo "...preparing controlfile"
    rm $CONTROLFILE
    find ./www/pgm2 -type f \( ! -iname ".*" \) -print0 | while IFS= read -r -d '' f;
    do
        out="UPD `stat --format "%z %s" $f | sed -e "s#\([0-9-]*\)\ \([0-9:]*\)\.[0-9]*\ [+0-9]*#\1_\2#"` $f"
        echo ${out//.\//} >> $CONTROLFILE
    done

    
    echo "...commit changes"
    git commit -a -m "$*"
    
    echo "...pull from github"
    git pull
    
    echo "...push to github"
    git push
fi

echo "done"
