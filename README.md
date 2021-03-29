

The actual website can be viewed at [https://UO-Biostats.github.io/UO_ABS/](https://UO-Biostats.github.io/UO_ABS/).

Quick link: the [schedule](https://UO-Biostats.github.io/UO_ABS/pages/schedule.html), with links to the slides.


--------------------


This is a [jekyll](https://jekyllrb.com) website,
modified from Karl Broman's [simple site](http://github.com/kbroman/simple_site)
by way of [Cécile Ané](http://cecileane.github.io/computingtools/).


*Notes on installation/building:*

- To view a local version run `bundle exec jekyll serve`.

- The skeleton can by modified by editing `config.yml` and `_includes/themes/twitter/default.html`.

- To get this to build locally with Debian, I had to `aptitude remove jekyll`; `bundle update`; 
    then find where the executable is using `bundle info jekyll`; 
    and finally make a symlink for the `jekyll` executable to somewhere in my `PATH`.

- More in the [development docs](https://UO-Biostats.github.io/UO_ABS/pages/development.html).
