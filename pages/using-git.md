---
layout: page
title: Using git
description: how to use git to get the course slides
---

# `git`-ing the course materials

We are maintaining course material using the version control software [`git`](https://git-scm.com/),
and distributing it through [github](https://github.com).
We're doing this for our own sake (git makes our lives much easier!)
but this also makes it easy for *you* to get the course material (and our updates),
and to keep them updated.
This will give you a little bit of practice using git;
if you don't already, we encourage you to get to know it well.

Here is the basic procedure for obtaining the course material and keeping it updated.
After you have `git` installed, in a console...

1. Go to the directory you want to put this course's directory in, and run
    ```
    git clone https://github.com/UO-Biostats/UO_ABS
    ```

2. That should have created a new directory, called `UO_ABS/` with everything in it.
    Check, by pointing your web browser to the subdirectory `UO_ABS/CLASS_MATERIALS/Lectures` and opening `Week_01_Lecture.slides.html`.

3. When we update the material, you can update your local copy by running
    ```
    git fetch
    git merge origin/master
    ```

Great: that's it!

Well, there's one more thing.
The instructions above will work if you don't make any local changes to our files.
But, what if you want to -say- make notes on the slides?
If so, when you try to `merge` you could get an error like this:
```
error: Your local changes to the following files would be overwritten by checkout:
    (names of some files you changed)
Please commit your changes or stash them before you switch branches.
Aborting
```
You have two options:

1. Store your changes away in another "branch" - they won't be visible to you any more, but they will be *there*, somewhere. (Where? See option 2.)
    To do this, run
    ```
    git checkout -b 'my_edits'
    git commit -a -m 'these were my edits'
    git checkout master
    ```
    Now, your local copy should be "clean" again, and you can `git merge origin/master` like before.

2. Learn how to use git! That's what you'll need to do if you want to *actually* edit our material, and both keep your edits as well as staying up to date with us.
