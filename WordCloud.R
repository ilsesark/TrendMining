install.packages("text2vec")
install.packages("tm")
install.packages("magrittr")
install.packages("wordcloud")
install.packages("stopwords", dependencies = TRUE)
library("stopwords")
library(text2vec)
library(tm)
library(magrittr)
library(wordcloud)

#EDIT this row
my_file <- "my_STO_devops_data.RData"

#draw_myWordCloud = function(my_file){
  
  my_temp_file = paste(my_data_dir, "/", sep="")
  my_temp_file = paste(my_temp_file, my_file, sep="")
  load(my_temp_file)
  
  print(paste("Creating Word cloud, my_file: ", my_file))
  
  my_text <- paste(my_articles$Title, my_articles$Abstract_clean)
  my_text = tolower(my_text)
  
  #remove more words that we do not care about 
  
  #FOR SCOPUS DATA
  my_stopwords = c(stopwords::stopwords(language = "en", source = "snowball"),"also", "can", "however", "use", "used")
  
  # FOR STACKOVERFLOW DATA
  my_stopwords = c(stopwords::stopwords(language = "en", source = "snowball"),"able", "want", "can", "one", "like", "also", "just")
  
  
  my_text = removeWords(my_text, my_stopwords)
  
  wordcloud(my_text, max.words=60, min.freq=5, random.order=FALSE, rot.per=0)
  
  rm(my_text)
  print("Finished Word cloud")
#}