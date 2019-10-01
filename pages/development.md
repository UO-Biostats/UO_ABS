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
