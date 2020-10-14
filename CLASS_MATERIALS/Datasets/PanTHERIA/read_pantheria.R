read_pantheria <- function(dirname) {
    pantheria <- read.table(file.path(dirname, "PanTHERIA_WR05_mammals.txt"),
                            header=TRUE, check.names=FALSE, stringsAsFactors=FALSE, sep="\t")
    names(pantheria) <- gsub("^MSW05_", "", gsub("^[0-9-]*_", "", names(pantheria)))
    pantheria$Order <- factor(pantheria$Order)
    pantheria$Family <- factor(pantheria$Family)
    pantheria$Genus <- factor(pantheria$Genus)
    translations <- list(ActivityCycle = c("nocturnal", "crepuscular", "diurnal"),
                         Terrestriality = c("fossorial", "ground_dwelling"),
                         TrophicLevel = c("herbivore", "omnivore", "carnivore"))
    for (col in names(pantheria)) {
        a <- pantheria[[col]]
        if (is.numeric(a)) {
            a[a == -999] <- NA
        }
        if (col %in% names(translations)) {
            a <- factor(translations[[col]][a], levels=translations[[col]])
        }
        pantheria[[col]] <- a
    }
    return(pantheria)
}

