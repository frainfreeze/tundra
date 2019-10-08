---
# ============================= HTML META/HEADER ==============================
# These variables are destined to the meta elements in the html head block.
# Use them when you want to show author, date, etc., only in meta elements, or
# you want different values to be displayed in the document and its metadata.
pagetitle:   The page title
title:    The title of the document
subtitle: The subtitle
#author:   Author Name
#date:   Nov 21, 2017
lang: en
toc-title: Contents

# =============================== SUMMARY TEXT ================================
# If defined, the contents of `$summary$` key will be displayed right before TOC.
# -----------------------------------------------------------------------------
summary: |
    This is a preview of “Handbook template”.
    The look and organization was inspired by Freebsd handbook (hence the name) and
    github pages css. The template can be found in tundra.sh repository:

    - <https://github.com/frainfreeze/tundra/blob/master/res/handbook/index.Thtml>

    :::::::: Warning ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    __DISCLAIMER__ --- This document is theme and generator options preview/cheatsheet,
    and it does not reflect all current generator capatibilities. See pandoc documentation
    and thundra.sh source for more features and options.

    This document was built with `pandoc --template=../res/basic/handbook.Thtml  PREVIEW.md -o PREVIEW.html --toc`
    :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
---
  
# Features

This is a fully stand-alone pandoc HTML5 template (embedded CSS stylesheet).
It's ideal for creating single-file documentation for projects

Use this documents source as feature cheatsheet.


## Standard Typography

Lorem markdownum stagna *de spatiantes* mirabatur **arboribus at nunc**, somnus sanguine quosque ~~genusque addenda socia~~.[^1] <mark>Plus ipsisque latent</mark>, genus, medio aut rima haberet.

Quem palluerat, vulgaris pignora: <kbd>Crtl</kbd>+<kbd>Z</kbd>.[^2]

<h1>H1 Heading</h1>
<h2>H2 Heading</h2>
<h3>H3 Heading</h3>
<h4>H4 Heading</h4>
<h5>H5 Heading</h5>
<h6>H6 Heading</h6>

> Et vult Ulixe nec mater moras veluti spatio omnia sub quemque ripas ubi. Nil non, sub nec, ubi ferant deus pacis Turni, parentum. (a quote)
>
> > Ut nobis Ampycides esset indigenae eiecit domini successibus Aiaci tecta nunc terris, Argolica videres est neque. Aeacides caloris, magna canes.[^3] (a nested quote)

[^1]: Nec opus caecoque frondibus fervet.
[^2]: Hora sequantur *nimium exiguis et* in fit coniuge aures, adfuit.
[^3]: Turni, parentum. Ut nobis Ampycides esset indigenae eiecit domini successibus Aiaci tecta nunc terris, Argolica videres est neque. Aeacides caloris, magna canes.

Lists
-----

### Ordered Lists

1.  Nec et tormenta tacitae decet aethere
2.  Nullamque corpus
    1.  Sic nunc naides dubiis
    2.  Virgo forti ardent
    3.  Dic pro captantur exitus quo viris infera
3.  Adit Symplegadas inque

### Bullet Lists

-   Dic pro captantur exitus quo viris infera
-   Humanam tenderet
    -   Est esset devoveas
    -   Adit Symplegadas inque
-   Lelex ad ira
-   Inpositus cum genus extulit nec inseris ille

### Task Lists
- [ ] Dic pro captantur exitus quo viris infera
- [x] Humanam tenderet
- [x] Inpositus cum genus extulit nec inseris ille

Definition lists
----------------

Term 1

: Definition 1

Term 2 with <mark>inline markup</mark>

: Definition 2

    Hora sequantur *nimium exiguis et* in fit coniuge aures, adfuit.

    Ut sentesflumen, mea ira, et ubi manus silicem.



Tables
------

| Header 1 | Header 2 | Header 3 |
|----------|----------|----------|
| Cell     | _Cell_   | __Cell__ |
| `Cell`   | Cell     | Cell     |
| Cell     | Cell     | Cell     |


## Source Code Blocks


``` python
#!/usr/bin/env python
"""
Print the Fibonacci Sequence to output.
By Alex E. Rodriguez; public domain:
https://github.com/arodriguez23434/arodriguez_2016_fibonacci
"""
def fibo(int):
    #Indices 0 & 1 are pre-set; Addition begins at index 2
    fibo_list = [0,1];
    for i in range(2,int):
        fibo_list.append(fibo_list[i-2]+fibo_list[i-1]);
    return fibo_list;

print(fibo(100)); #Print list 
```

::::::::: Alert :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
**HIGHLIGHT-STYLE** --- Source code is highlighted using either pandoc's default style (`pygments`) or the style set at invocation by the `--highlight-style=STYLE|FILE` option.
This document uses the `haddock` built-in style.

The template's embedded CSS doesn't define the syntax coloring style, leaving you the freedom to use your own style definition files or pandoc's built-in styles.
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

Line Blocks
-----------

| The limerick packs laughs anatomical
| In space that is quite economical.
|    But the good ones I've seen
|    So seldom are clean
| And the clean ones so seldom are comical

\

::::::: Note ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
__NOTE__ --- Pandoc v2.x no longer adds inline CSS to Line blocks, it assigns them the "`line-block`" class instead, leaving it up to the end-user to define it in the CSS stylesheet. This templates covers Line blocks style definitions.
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

Inline text elements
--------------------

You can use the `<mark>` tag to <mark>highlight text</mark>.

~~This line of text is meant to be treated as deleted text.~~

Keystroke can be rendered with `<key>` tag: <kbd>Shift</kbd>+<kbd>U</kbd>


Alerts
------
This templates implements alerts via custom `<div>` classes (case-sensitive):

- `.Alert` (blue)
- `.Warning` (yellow)
- `.Error` (red)
- `.Success` (green)
- `.Note` (grey)


::::: Alert :::::::::::::::::::::::::::::::::::::::::
Alert — I’m the “Alert” alert!
:::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::: Warning :::::::::::::::::::::::::::::::::::::::::
Warning — I’m the “Warning” alert!
:::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::: Error :::::::::::::::::::::::::::::::::::::::::
Error — I’m the “Error” alert!
:::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::: Success :::::::::::::::::::::::::::::::::::::::::
Success — I’m the “Success” alert!
:::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::: Note :::::::::::::::::::::::::::::::::::::::::
Note — I’m the “Note” alert!
:::::::::::::::::::::::::::::::::::::::::::::::::::::::


Template Variables
==================

Beside supporting all the standard pandoc template variables (pandoc v2.0.2), some extra variables were added to the template to allow finer customization.

+---------------+--------------------------------------------------------------------+------------+
|    VAR NAME   |                            DESCRIPTION                             |  DEFAULT   |
+===============+====================================================================+============+
| `$summary$`   | A block of text that will be displayed right before the TOC.<br /> | empty      |
|               | Wrapped in `<div class="summary">`.                                |            |
+---------------+--------------------------------------------------------------------+------------+
| `$toc-title$` | Title for Table of Contents.                                       | `Contents` |
+---------------+--------------------------------------------------------------------+------------+
| `$charset$`   | Override document encoding.                                        | `utf-8`    |
+---------------+--------------------------------------------------------------------+------------+

The `$summary$` Variable
------------------------

The `$summary$` text belongs to the `<header>` block, so it won't be displayed unless _title_ was definied. It will be placed after _authors_ and _date_, and right before _Table of Contentes_. It will parsed as markdown, so it offers an easy way to add introductiory text directly in the document's YAML header.

You can see an example of the `$summary$` var at work right in this page.

The `$charset$` Variable
---------------------------

I've added the `$charset$` variable because I was having trouble using the template inside the WebBrowser Control in a Windows application I created (a markdown file previewer that uses pandoc and this template to quickly render an html preview via WebBrowser Control). The programming language I used would only allow injecting HTML into the WebBrowser Control as UCS-2 enconded Unicode strings, even if pandoc's output was captured as UTF-8 --- ie., while I/O operations allow using different encondings, all internal string operations are restricted to UCS-2.

The problem was fixed by setting `$charset$` to `windows-1251` when invoking pandoc from my Windows application (command line option `-V charset=windows-1251`), as the actual document presented to the WebBrowser Control would no longer be in UTF-8 but in UCS-2 due to internal conversion.

Therefore I thought that there might be other scenarios which might require overriding the default charset encoding of the template because of encoding conversions occuring in a toolchain, protocol transmissions, or whatever. Even though UTF-8 is now the standard enconding for most source and output files when it comes to markdown and HTML, having this optional template variable allows handling edge cases.


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                         REFERENCE LINKS DEFINITIONS                          
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

[GitHub Pages]: https://pages.github.com/ "More info on GitHub Pages"

[Pandoc-Goodies PP-Macros Library]: https://github.com/tajmone/pandoc-goodies/tree/master/pp "Go to the Pandoc-Goodies PP-Macros Library"

[Inline Formatting macros set]: https://github.com/tajmone/pandoc-goodies/tree/master/pp#inline-formatting "More info about the Inline Formatting macros set"

[GitHub Alerts macros set]: https://github.com/tajmone/pandoc-goodies/tree/master/pp#github-alerts "More info about the Alerts macros set"

[fenced-divs]: http://pandoc.org/MANUAL.html#extension-fenced_divs "More info about pandoc fenced-divs syntax"