This is the panTHERIA dataset, downloaded from [the Ecological Archives](http://esapubs.org/archive/ecol/E090/184/metadata.htm),
which is

> ... a global species-level data set of key life-history, ecological and
> geographical traits of all known extant and recently extinct mammals
> (PanTHERIA) developed for a number of macroecological and macroevolutionary
> research projects.

- Metadata and varianble definitions: http://esapubs.org/archive/ecol/E090/184/metadata.htm
- the [dataset](PanTHERIA_WR05_mammals.txt)

Code to read in the data and assign levels in columns appropriately:
```
read_pantheria <- function(dirname) {
    pantheria <- read.table(file.path(dirname, "pantheria_wr05_mammals.txt"),
                            header=true, check.names=false, stringsasfactors=false, sep="\t")
    names(pantheria) <- gsub("^msw05_", "", gsub("^[0-9-]*_", "", names(pantheria)))
    pantheria$Order <- factor(pantheria$Order)
    pantheria$Family <- factor(pantheria$Family)
    pantheria$Genus <- factor(pantheria$Genus)
    translations <- list(activitycycle = c("nocturnal", "crepuscular", "diurnal"),
                         terrestriality = c("fossorial", "ground_dwelling"),
                         trophiclevel = c("carnivore", "herbivore", "omnivore"))
    for (col in names(pantheria)) {
        a <- pantheria[[col]]
        if (is.numeric(a)) {
            a[a == -999] <- na
        } else if (col %in% names(translations)) {
            a <- factor(translations[[col]][a], levels=translations[[col]])
        }
        pantheria[[col]] <- a
    }
}
```
