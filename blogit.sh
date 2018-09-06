# build
find * -name "*.md" -type f -exec sh -c 'pandoc "${0}" -o "${0%.md}.html" --template res/basic.Thtml --css res/basic.css --self-contained --toc --toc-depth 3' {} \;

# clean
#find . -type f -iname "*.html" -delete

##### other
# pandoc index.md -s | lynx -stdin