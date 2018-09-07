<h1 align="center">tundra.sh - v0.1</h1>
<div align="center">
  <strong>static website, blog and documentation generator</strong>
</div>
<div align="center">
  <code>tundra.sh</code> is written in shell and depends only on pandoc
</div>

<!-- showcase -->
<center>
  <table>
    <tr>
      <td><a href="https://frainfreeze.github.io/tundra/">
            <img width="120" alt="basic theme: this readme" src="https://i.imgur.com/tdwMukX.png"></a></td>
      <td><a href="https://frainfreeze.github.io/tundra/posts/basic-demo-post.html">
            <img width="120" alt="basic theme: post" src="https://i.imgur.com/qikHdvC.png"></a></td>
      <td><a href="https://frainfreeze.github.io/tundra/posts/fancy-demo-readme.html">
            <img width="120" alt="fancy theme: this readme" src="https://i.imgur.com/t6SUJKb.png"></a></td>
      <td><a href="https://frainfreeze.github.io/tundra/posts/fancy-demo-post.html">
            <img width="120" alt="fancy theme: post" src="https://i.imgur.com/W87VktF.png"></a></td>
    </tr>
  </table>
</center>

<p align="center">
  <a href="#features">Features</a> •
  <a href="#how-to-use">Install</a> •
  <a href="#download">Configure</a> •
  <a href="#credits">Customize</a> •
  <a href="#related">Roadmap</a> •
  <a href="#license">License</a>
</p>

## Features
- minimal dependencies: just the `pandoc` on POSIX systems
- generates light static pages
- blog friendly
- syntax highlighting for over 100 languages, out of the box

## Install
Built and tested on Debian 9. To get the demo page up:
- `sudo apt install pandoc`
- `git clone https://github.com/frainfreeze/pandblog.git`
- `chmod a+rx ./tundra.sh`
- `./tundra.sh -b && xdg-open index.html`

To change index page simply edit this readme or configure `tundra.sh` 
to point at your index.md file. See configuration bellow.

To make new blog posts add source files to posts folder.

Run `./tundra.sh -h` to see available options.

## Configure


## Customize
There are two types of configuration: per project and per page.
Per project: on top of `tundra.sh` are configuration variables.
You can use them to change page theme, markdown flavor etc.

Per page: `pandoc` supports YAML blocks, this is self-explanatory example:

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

## Roadmap
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

## License
Public domain.