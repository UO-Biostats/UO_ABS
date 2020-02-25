# will extract nsources passages, each of length around nwords words
# and write the passages, one per line, without punctuation, to passages_file,
# and the metadata to sources_file.
set.seed(23)

nsources <- 1000
nsents <- 20
passages_file <- "../../Lectures/data/passages.txt"
sources_file <- "../../Lectures/data/passage_sources.tsv"

get_words <- function (x) {
    # this regexp splits words
    # wordsplit <- "([,;.!? $]')|([^a-zA-Z'])|('[,;.!? $])"
    wordsplit <- "[^a-zA-Z]+"
    return(strsplit( tolower(paste(x, collapse=" ")), wordsplit )[[1]])
}
get_sentences <- function (x, minlen=50) {
    sentencesplit <- "[.!?] *"
    out <- gsub("[^a-z ]", "", strsplit( tolower(paste(x, collapse=" ")), sentencesplit )[[1]])
    return(out[nchar(out) > minlen])
}

# moby dick
all.md <- gsub("\n", " ", scan(gzfile("mobydick.txt.gz", 'rt'), what='char', skip=50), fixed=TRUE )
all.md <- all.md[1:(min(grep("Gutenberg", all.md)) - 4)]  # ends with End of Project Gutenberg
md.words <- get_words(all.md)
md.sentences <- get_sentences(all.md)

# pride and prejudice
all.pp <- gsub("\n", " ", scan(gzfile("prideandprejudice.txt.gz", 'rt'), what='char', skip=20), fixed=TRUE )
all.pp <- all.pp[1:(min(grep("Gutenberg", all.pp)) - 4)]  # ends with End of Project Gutenberg
pp.words <- get_words(all.pp)
pp.sentences <- get_sentences(all.pp)

# sense and sensibility
all.ss <- gsub("\n", " ", scan(gzfile("senseandsensibility.txt.gz", 'rt') ,what='char', skip=20), fixed=TRUE )
all.ss <- all.ss[1:(min(grep("Gutenberg", all.ss)) - 4)]  # ends with End of Project Gutenberg
ss.words <- get_words(all.ss)
ss.sentences <- get_sentences(all.ss)

sources <- data.frame(source=sample(c("md", "pp", "ss"), nsources, replace=TRUE))
sources$sentence <- NA
for (sn in levels(sources$source)) {
    sents <- get(paste0(sn, ".sentences"))
    sources$sentence[sources$source == sn] <- sample(length(sents)-nsents, sum(sources$source == sn), prob=nchar(sents[1:(length(sents)-nsents)]))
}
source_chunks <- sapply(1:nrow(sources), function (k) {
                    paste(get(paste0(sources$source[k], ".sentences"))[sources$sentence[k] + 0:(nsents-1)], collapse=" ") })
sources$nchar <- nchar(source_chunks)

writeLines(source_chunks, con=file(passages_file, open="w"))
write.table(sources[,c("source", "nchar")], file=sources_file, row.names=FALSE)

if (FALSE) {
    all.words <- sort(unique(c(all.md, all.pp, all.ss)))
    tabwords <- function (x, w) { tabulate(match(strsplit(x, " ")[[1]], w), nbins=length(w)) }

    sentmat <- sapply(source_chunks, tabwords, all.words)
    rownames(sentmat) <- all.words
    sentmat <- sentmat[rowSums(sentmat) > 0,]

    simmat <- crossprod(sentmat)
    simmat <- simmat / sqrt(colSums(sentmat^2)[col(simmat)] * colSums(sentmat^2)[row(simmat)])
    simpcs <- princomp(covmat=simmat)
    pairs(simpcs$loadings[,1:4], col=sources$source)
}
