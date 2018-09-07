#!/bin/sh
# tundra.sh v0.2

########## Configuration ###########
#            features
# If index is false and blog is true a default index 
# will be generated in form of blog archive page. Index
# is usually websites landing page that links to blog,
# documents, about and other standalone pages.
INDEX=true
BLOG=true
DOCS=true
PAGES=true

#              paths
# $_PATH points to folder with $ source files
# $_RES points to theme in res folder for $
# $PAGES contains names of files that will be built into
# standalone pages and linked into navbar
ROOT=`pwd`
INDEX_PATH=$ROOT/README.md
INDEX_RES=$ROOT/res/basic

POSTS_PATH=$ROOT/posts
POSTS_RES=$ROOT/res/bootstrap

DOCS_PATH=$ROOT/docs
DOCS_RES=$ROOT/res/bootstrap

PAGES_PATH=$ROOT
PAGES_LIST="about.md books.md"
PAGES_RES=$ROOT/res/basic

#               misc
# MD_FLAVOUR tells pandoc what markdown flavour to use,
# +yaml_met... turns on yaml meta data option in pandoc
MD_FLAVOUR="markdown_github+yaml_metadata_block"


######### Implementation ##########
###################################
usage() {
    echo "Build static website and blog from markdownfiles using pandoc."
    echo "./tundra.sh"
    echo "   -h --help \tDisplay this page."
    echo "   -b --build \tBuild HTML files from markdown"
    echo "   -c --clean \tDelete HTML files"
    echo ""
}

gen_archive(){
    tmp_path=`pwd`
    # if theres no index and we have blog we will use
    # blog archive as main page
    if [ "$INDEX" = false ] && [ "$BLOG" = true ]
    then
        echo "\tGenerating index in archive format... todo."
    else
        cd $POSTS_PATH
        
        echo "<head><title>Blog archive</title>" > index.html
        cat $tmp_path/res/basic/js.Thtml >> index.html
        echo '<link rel="stylesheet" href="../res/basic/style.css"></head>' >> index.html
        echo "<h1>Blog archive</h1>" >> index.html
        echo "<input type=\"button\" id=\"test\" value=\"sort by date\"/>" >> index.html
        echo "<input type=\"button\" id=\"test1\" value=\"sort by title\"/>" >> index.html
        echo "<ul id=\"list\">" >> index.html
        for url in *.html; do
            if [ "$url" != "index.html" ]
            then
                title=`awk -vRS="</title>" '/<title>/{gsub(/.*<title>|\n+/,"");print;exit}' $url`
                date=`awk -vRS="</p></li>" '/<li><p class="navbar-text date">/{gsub(/.*<li><p class="navbar-text date">|\n+/,"");print;exit}' $url`
                echo "<li><span class=\"date\">$date</span> - <a href=\"$url\"><span class="post-title">$title</span></a></li>" >> index.html
            fi
        done
        echo "</ul>" >> index.html

        cd $tmp_path
    fi
}

gen_blog(){
    tmp_path=`pwd` # someone is bound to nest posts in subfolder and break this.
    cd $POSTS_PATH
    for f in *.md; do 
        pandoc -f $MD_FLAVOUR "$f" -s -o "${f%.*}.html" --template $POSTS_RES/blog.Thtml --css $POSTS_RES/style.css --toc --toc-depth 3; 
    done
    cd $tmp_path

    # generate archive page
    gen_archive
}

build_sources() {
    echo "Building sources..."
    START_TIME=$(date +%s)
    
    # build index
    if [ "$INDEX" = true ] 
    then
        echo "\tBuilding index"
        pandoc -f $MD_FLAVOUR $INDEX_PATH -o "index.html" --template $INDEX_RES/index.Thtml --css $INDEX_RES/style.css #--toc
    fi

    # build blog
    if [ "$BLOG" = true ] 
    then
        echo "\tBuilding blog"
        gen_blog
    fi

    # build individual pages
    if [ "$PAGES" = true ] 
    then
        echo "\tBuilding pages"
        for page in $PAGES_LIST
        do
            pandoc -f $MD_FLAVOUR $page -o "${page%.*}.html" --template $INDEX_RES/index.Thtml --css $INDEX_RES/style.css
        done
    fi

    END_TIME=$(($(date +%s) - $START_TIME))
    echo "Sources built in $(($END_TIME/60)) min $(($END_TIME%60)) sec" 
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
            exit 0
            ;;
        -b | --build)
            build_sources
            exit 0
            ;;
        -c | --clean)
            find . -type f -iname "*.html" -delete
            echo "deleted all html files!"
            exit 0
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