This is the panTHERIA dataset, downloaded from [the Ecological Archives](http://esapubs.org/archive/ecol/E090/184/metadata.htm),
which is

> ... a global species-level data set of key life-history, ecological and
> geographical traits of all known extant and recently extinct mammals
> (PanTHERIA) developed for a number of macroecological and macroevolutionary
> research projects.

- Metadata and varianble definitions: http://esapubs.org/archive/ecol/E090/184/metadata.htm
- the [dataset](PanTHERIA_WR05_mammals.txt)

Code to read in the data and assign levels in columns appropriately
is provided in the file `[read_pantheria.R](read_pantheria.R)`,
which you can use as follows.
If you are working in this directory (e.g., from the github repository) then you can just run:
```r
source("read_pantheria.R")
pantheria <- read_pantheria(".")
```

If you need to download the files, then you can do this in R by first running:
```r
url <- "https://uo-biostats.github.io/UO_ABS/CLASS_MATERIALS/Datasets/PanTHERIA/"
for (x in c("PanTHERIA_WR05_mammals.txt", "read_pantheria.R")) {
    download.file(paste0(url, x), x)
}
```
and then running the code above.
