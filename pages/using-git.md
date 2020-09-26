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

It's that easy!

## But what if I want to take notes on the slides?

Well, there's one more thing.
If you *change* the files then the next time you try to get our updates,
git will complain that your changes conflict with ours.
So, we recommend that if you want to edit one of the files we have,
to first make a *copy* of it, and edit the copy.
For instance, you could copy `Week_01_Lecture.Rmd` to `Week_01_Lecture_NOTES.Rmd`,
and then edit the `NOTES` version. git will ignore your new file, unless you ask it not to.


## But what if I *already did* edit some of the files?

If you do modify some of the files,
when you try to `merge` you could get an error like this:
```
error: Your local changes to the following files would be overwritten by checkout:
    (names of some files you changed)
Please commit your changes or stash them before you switch branches.
Aborting
```
To deal with this, you should (1) get rid of your local changes,
and then (2) `merge` away.
First, you should probably do
```
    git status
```
to see what's changed.
The message this prints out even gives you a nice reminder of how to remove any local changes:
say you edited `Week_01_Lecture.Rmd` but didn't mean to.
You could make those changes go away by doing
```
    git checkout -- Week_01_Lecture.Rmd
```
This makes the changes go away permanently, so make sure if you actually wanted to keep them,
that you first copy the file elsewhere.
Another way to make *all* your changes go away at once is to do
```
    git stash
```
This is reversible - doing `git stash pop` will bring them back...  if nothing else changes in the meantime.

After you make the local changes dissappear, doing `git status` should tell you
```
nothing added to commit but untracked files present (use "git add" to track)
```
(Maybe there's some "untracked files"; those are OK.)
after which you can finally
```
    git merge origin/master
```
