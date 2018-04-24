# dplyr pro manipulaci s tabulkou
if(library(dplyr, logical.return =TRUE) != TRUE){
  install.packages("dplyr")
}
library(dplyr)

# Načtení balíku CoreNLP
if(library(coreNLP, logical.return =TRUE) != TRUE){
  install.packages("coreNLP")
}
library(coreNLP)

# Stažení java souborů a základních modelů
downloadCoreNLP(type = "base")

#inicializace
initCoreNLP(type = "english_all", mem = "6g")

# Příprava datasetů
datasets <- c("original_dataset/amazon_cells_labelled.txt", "original_dataset/imdb_labelled.txt", "original_dataset/yelp_labelled.txt")

sentences <- NULL
for(dataset in datasets) {
  temp <- read.csv(dataset, sep = "\t", as.is = TRUE, header = FALSE, col.names = c("sentence", "polarity"), quote = "")
  temp$source <- dataset
  if(exists("sentences")) {
    sentences <- bind_rows(sentences, temp)
  } else sentences <- temp
}

vzorek <- sentences[sample(nrow(sentences), 3000),]

vzorek <- as.data.frame(t(apply(vzorek, 1, function(x) {
  anotace <- annotateString(x["sentence"])
  vet <- length(getParse(anotace))
  x["stanford_sentiment_value"] <- "E_vety"
  x["stanford_sentiment"] <- "E_vety"
  if(vet == 1) { 
    x["stanford_sentiment_value"] <- unlist(getSentiment(anotace)["sentimentValue"])
    x["stanford_sentiment"] <- unlist(getSentiment(anotace)["sentiment"])
  }
  return(x)
})))

write.csv(vzorek,"data_sentiment.csv")