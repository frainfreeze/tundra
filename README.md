<h1 align="center">tundra.sh - v0.2</h1>
<div align="center">
  <strong>static website, blog and documentation generator</strong>
</div>
<div align="center">
  <code>tundra.sh</code> is written in shell and depends only on pandoc
  <img alt="mock-up" src="https://imgur.com/aaBW5Ggl.png">
</div>

<p align="center">
  <a href="#features">Features</a> •
  <a href="#install">Install</a> •
  <a href="#themes">Themes</a> •
  <a href="#configure">Configure</a> •
  <a href="#customize">Customize</a> •
  <a href="#roadmap">Roadmap</a> •
  <a href="#license">License</a>
</p>

## Features
- single shell script
- fast and simple to setup and configure
- minimal dependencies: just the `pandoc` on unix-like systems
- generates static content: easy to host anywhere
- syntax highlighting for over 100 languages, out of the box
- blog friendly

## Install
Built and tested on Debian 9. To get the demo page up:
- Install pandoc: `sudo apt install pandoc`
- Download this repository: `git clone https://github.com/frainfreeze/pandblog.git`
- Make script executable: `chmod a+rx ./tundra.sh`
- Run the script and open output in browser: `./tundra.sh -b && xdg-open index.html`

## Themes
<div align="center">
    <div class="tg-wrap"><table>
    <tr>
        <th colspan="2">basic</th>
        <th colspan="2">bootstrap</th>
        <th colspan="2">spectre</th>
    </tr>
    <tr>
      <td><a href="https://i.imgur.com/qzsmGQz.png" target="_blank">
            <img alt="basic theme: this readme" src="https://i.imgur.com/qzsmGQz.png"></a></td>
      <td><a href="https://i.imgur.com/VCuzE9p.png" target="_blank">
            <img alt="basic theme: post" src="https://i.imgur.com/VCuzE9p.png"></a></td>
      <td><a href="https://i.imgur.com/sOrLoEN.png" target="_blank">
            <img alt="bootstrap theme: this readme" src="https://i.imgur.com/sOrLoEN.png"></a></td>
      <td><a href="https://i.imgur.com/tBN3UHi.png" target="_blank">
            <img alt="bootstrap theme: post" src="https://i.imgur.com/tBN3UHi.png"></a></td>
      <td><a href="https://i.imgur.com/GhVfJjx.png" target="_blank">
            <img alt="spectre theme: this readme" src="https://i.imgur.com/GhVfJjx.png"></a></td>
      <td><a href="https://i.imgur.com/DgwFZTW.png" target="_blank">
            <img alt="spectre theme: post" src="https://i.imgur.com/DgwFZTW.png"></a></td>
    </tr>
    </table></div>
</div>

## Configure
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

## Customize
To change index page simply edit this readme or configure `tundra.sh` 
to point at your index.md file. See configuration above.

To make new blog posts add source files to posts folder.

Run `./tundra.sh -h` to see available options.

Todo: custom themes, custom page layout.

## Roadmap
**v0.3**
- standalone pages
- custom css for index/standalone pages
- navigation

**v0.4**
- multiple i/o formats support
- publications
- tidy up basic css
  
**v0.5**
- output to docs folder option(for gh pages)
- tidy up bootstrap css

**v0.6**
- fancy css (spectre?)
- documentation
- tags support

**v0.7**
- support for more than 20 types of source files
  
## License
Public domain.
