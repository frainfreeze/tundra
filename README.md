# pandblog - WIP
`pandblog` is simple static website and blog generator writen in shell. pandblog renders HTML pages from markdown using pandoc.

### examples
Default layout:
- no example.
  
'Fancy' theme:
- [This readme](https://frainfreeze.github.io/pandblog/)
- [Post example](https://frainfreeze.github.io/pandblog/posts/post0.html)
- [no toc post](https://frainfreeze.github.io/pandblog/posts/post1.html)
- sweet, right?

### features
- minimal dependencies: just the `pandoc` on POSIX systems
- generates light static pages
- blog friendly
- syntax highlighting for over 100 languages, out of the box

### install & usage
Built and tested on Debian 9. To get the demo page up:
- `sudo apt install pandoc`
- `git clone https://github.com/frainfreeze/pandblog.git`
- `chmod +x ./blogit.sh`
- `./blogit.sh -b && xdg-open index.html`

To change index page simply edit this readme or configure `blogit.sh` 
to point at your index.md file. See configuration bellow.

To make new posts and markdown files to posts folder.

Run `./blogit.sh -h` to see available options.

### configuration
There are two types of configuration: per project and per page.
Per project: on top of `blogit.sh` are configuration variables.
You can use them to change page theme, markdown flavor etc.

Per page: `pandoc` supports YAML block, this is self-explanatory example:

```yaml
---
title: "Example title"
author: "author"
date: 2000-01-21
tags: ["tag1","tag2"]
toc: false
---
```

I recommend you to keep the block on the top of the file. 
See [pandoc documentation](https://pandoc.org/MANUAL.html#extension-yaml_metadata_block) for more details.

### todo
- index and about page
- make switches actually work, sigh
- build ~~index and~~ about page independently
- custom css for index and about page
- navigation
- tags
- ~~documentation~~
- ~~demo page~~
- ~~fancy css template~~
- docs folder option
- publications
    - tex
    - pdf
- tidy up basic css
- tidy up fancy css

### license
Public domain.