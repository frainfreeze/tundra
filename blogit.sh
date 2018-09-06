#!/bin/sh

# config:
POSTS=`pwd`/posts
INDEX=`pwd`/README.md
RES_PATH=`pwd`/res/fancy
MD_FLAVOUR="markdown_github+yaml_metadata_block"

usage() {
    echo "Build static website and blog from markdownfiles using pandoc."
    echo "./blogit.sh"
    echo "   -h --help \tDisplay this page."
    echo "   -b --build \tBuild HTML files from markdown"
    echo "   -c --clean \tDelete HTML files"
    echo "   --posts=$POSTS \tSet the posts directory"
    echo "   --index=$INDEX \tSet the index page location"
    echo "   --res-path=$RES_PATH \tSet the resources directory"
    echo ""
}

if [ -z "$1" ] 
then
  usage
  exit 1
fi

while [ "$1" != "" ]; do
    PARAM=`echo $1 | awk -F= '{print $1}'`
    VALUE=`echo $1 | awk -F= '{print $2}'`
    case $PARAM in
        -h | --help)
            usage
            exit
            ;;
        -b | --build)
            echo "Building sources..."
            START_TIME=$(date +%s)

            # build index (and about and other independent pages, wip)
            pandoc -f $MD_FLAVOUR $INDEX -o "index.html" --template $RES_PATH/index.Thtml --css $RES_PATH/style.css --toc --toc-depth 3
            #pandoc -f $MD_FLAVOUR $INDEX -o "about.html" --template $RES_PATH/about.Thtml --css $RES_PATH/style.css --self-contained
            
            # build blog
            cd posts
            for f in *.md; do 
              pandoc -f $MD_FLAVOUR "$f" -s -o "${f%.md}.html" --template $RES_PATH/blog.Thtml --css $RES_PATH/style.css --toc --toc-depth 3; 
            done
            cd ..
            END_TIME=$(($(date +%s) - $START_TIME))
            echo "HTML files built in $(($END_TIME/60)) min $(($END_TIME%60)) sec" 
            exit
            ;;
        -c | --clean)
            find . -type f -iname "*.html" -delete
            echo "deleted all html files!"
            exit
            ;;
        --posts)
            POSTS=$VALUE
            ;;
        --res-path)
            RES_PATH=$VALUE
            ;;
        *)
            echo "ERROR: unknown parameter \"$PARAM\""
            usage
            exit 1
            ;;
    esac
    shift
done


##### other
# pandoc index.md -s | lynx -stdin
# find * -name "*.md" -type f -exec sh -c 'pandoc "${0}" -o "${0%.md}.html" --template res/basic.Thtml --css res/basic.css --self-contained --toc --toc-depth 3' {} \;