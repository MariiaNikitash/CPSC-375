library(tidyverse)
library(tidytext)
text <- c("Because I could not stop for Death -",
"He kindly stopped for me -",
"The Carriage held but just Ourselves -",
"and Immortality")
text
text_df <- tibble(line = 1:4, text = text)
text_df
text_df %>% unnest_tokens(input=text, output="word")
text_df <- tibble(line = 1:4, text = text)
iris
as_tibble(iris)
text_df <- tibble(line = 1:4, text = text)
text_df %>% 
  unnest_tokens(input=text, output="word") %>%
  group_by(word) %>% summarise(n())
text_df %>% unnest_tokens(input=text, output="word") %>% 
  count(word)

library(wordcloud)
wordcloud(c("Hello", "how", "are", "you"), c(50,40,20,40))
stop_words
stop_words %>% group_by(lexicon) %>% count()

library(SnowballC)
wordStem("learns")
wordStem("learning")
wordStem("learned")
wordStem("families")
wordStem("family")

# classification with Tf-Idf vectors
mydata <- tibble(document=1:3, text=c("see spot", "see spot run", "run spot run"))
myvectors <- mydata %>%
  unnest_tokens(input=text, output="word") %>%
  count(document, word) %>%
  bind_tf_idf(term=word, document=document, n=n) %>%
  select(document,tf_idf, word) %>%
  pivot_wider(names_from = document, values_from = tf_idf, values_fill = 0)

myvectors
myvectors %>% select(`1`) # not a vector
myvectors %>% select(`1`) %>% as.vector()
myvectors$`1`
myvectors[[2]]
myvectors[2] # not a vector
D1 <- myvectors[[2]]
sqrt(sum(D1^2))
D1 / sqrt(sum(D1^2))
D1.norm <- D1 / sqrt(sum(D1^2))
D1.norm
D2 <- myvectors[[3]]
D2.norm <- D2 / sqrt(sum(D2^2))
sum(D1.norm * D2.norm) # cosine similarity

