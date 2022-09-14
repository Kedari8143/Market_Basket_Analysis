library(arules)
library(arulesViz)
# ---------------------------------------------------
market_basket <- read.transactions(
  file ='market_basket.csv',
  sep = ',',
  quote = "",
  format = 'basket',
  rm.duplicates = TRUE,
  skip = 1
)
# ---------------------------------------------------
summary(market_basket)

# ---------------------------------------------------
# total number of items purchased
18440 * 22346 * 0.0009915565 -> total_items_purchased
# ---------------------------------------------------
market_basket %>% head(n=5) %>% inspect
# ---------------------------------------------------

library(RColorBrewer)
# ---------------------------------------------------
itemFrequencyPlot(
  x = market_basket,
  topN = 10,
  type = 'absolute',
  horiz = TRUE,
  mai = NULL,
  col = brewer.pal(10, 'Spectral')
)
# ---------------------------------------------------

rule1 <- market_basket %>%
  apriori(parameter = list(support = 0.005, confidence = 0.8)) %>%
  sort(by= 'confidence')

summary(rule1)

rule1 %>% head(n=5) %>% inspect

rule1 %>% tail(n=5) %>% inspect
# ---------------------------------------------------

rule1 <- rule1 %>% sort(by = 'lift')

rule1 %>% head(n=5) %>% inspect
# ---------------------------------------------------

plot(rule1,engine = "htmlwidget")
plot(rule1, method = "two-key", engine = "htmlwidget")
plot(rule1, method = "graph", engine = "htmlwidget")

# ---------------------------------------------------

rule2 <- market_basket %>%
  apriori(parameter = list(support = 0.009, confidence = 0.3)) %>%
  sort(by= 'confidence')

summary(rule2)

rule2 %>% head(n=5) %>% inspect

rule2 %>% tail(n=5) %>% inspect
# ---------------------------------------------------

plot(rule2,engine = "htmlwidget")
plot(rule2, method = "two-key", engine = "htmlwidget")
plot(rule2, method = "graph", engine = "htmlwidget")

# ---------------------------------------------------

rule3 <- market_basket %>%
  apriori(parameter = list(support = 0.02, confidence = 0.5)) %>%
  sort(by= 'support')

summary(rule3)

rule3 %>% head(n=5) %>% inspect

rule3 %>% tail(n=5) %>% inspect
# ---------------------------------------------------

plot(rule3,engine = "htmlwidget")
plot(rule3, method = "two-key", engine = "htmlwidget")
plot(rule3, method = "graph", engine = "htmlwidget")

# ---------------------------------------------------

