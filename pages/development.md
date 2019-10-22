---
layout: page
title: Course development
description: how to develop this website
---

# Debugging the html

To view a local version install `jekyll` and run `jekyll serve`.


# Git and github

## Branches

If you want to push to github but don't want to break everything,
*make a new branch*, and then if you want to discuss the changes with others,
*make a pull request*.
To do this,

1. Checkout a new branch, which you can call whatever you want (eg `my_new_branch`):
    ```
    git checkout -b my_new_branch
    ```

2. Make your changes. Commit them. You can make as many commits as you like.

3. Push the changes to a new branch on github
    ```
    git push --set-upstream origin my_new_branch
    ```

4. Go to the [github repo](https://github.com/UO_Biostats/UO_ABS).
    If you are logged in, it will helpfully ask you if you want to start a new pull request
    from the branch you just pushed. Yes, please!
    Write something so the rest of us know what we're looking at;
    this gives us a space to comment and discuss.

5. Now, we discuss and comment; push more changes to the branch, etcetera.
    And, eventually, merge it to master.

6. When it's merged, switch back to `master` and delete the now-unused branch:
    ```
    git checkout master
    git fetch
    git merge origin/master
    git branch -d my_new_branch
    ```

*Note:* If you want to switch back to `master` temporarily,
this is as easy as doing `git checkout master`; having a look,
and then `git checkout my_new_branch` to get back.

# Rmarkdown

The Rmarkdown slides can be knitted from Rstudio,
but I don't do it that way.
Here's how I do it:

1. install [templater](https://github.com/petrelharp/templater), which is a small R package I wrote as a wrapper around `knitr` and `pandoc`

    *Note:* what `knitr` does is it first evaluates code chunks and makes a `.md` file; then it calls `pandoc` to make the html.
    
2. to make a certain set of slides, run e.g. `make Week_03_Lecture.slides.html`. Running this will do these two things:
```
Rscript -e 'knitr::knit_patterns[["set"]](list( chunk.begin="^```+\\s*\\{[.]?(r[a-zA-Z]*.*)\\}\\s*$", chunk.end="^```+\\s*$", inline.code="`r +([^`]+)\\s*`")); templater::render_template("Week_03_Lecture.Rmd", output="Week_03_Lecture.md", change.rootdir=TRUE)'
pandoc -o Week_03_Lecture.slides.html -t revealjs -V theme=simple -V slideNumber=true -V transition=none -H resources/adjust-revealjs.style --slide-level 2 --standalone  --self-contained -H .pandoc.macros.tex --mathjax=https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js?config=TeX-AMS-MML_HTMLorMML  Week_03_Lecture.md
```
There is, for instance, some special CSS configuration to the slides in `resources/adjust-revealjs.style`.

3. To run the `R` code in a console, to do for instance online examples, open R and then run:
```
library(templater)
render_template("Week_03_Lecture.Rmd", envir=environment(), output="Week_03_Lecture.md")
```
This says to knit the Rmd document *in the current environment*, so all the variables are available, and output just the markdown file instead of going all the way to html.

