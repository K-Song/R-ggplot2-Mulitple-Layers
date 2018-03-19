
#install.packages("ggplot2")
library(ggplot2)

head(midwest)

ggplot(midwest, aes(percollege, percpovertyknown)) + geom_point(size = 5)

ggplot(midwest, aes(percollege, percpovertyknown, colour = factor(inmetro))) + geom_point(size = 5)

layer_1 <- midwest[midwest$inmetro == "0", ]
layer_2 <- midwest[midwest$inmetro == "1", ]

ggplot() + geom_point(data = layer_1, aes(percollege, percpovertyknown, colour = "red"), size = 5)+
  geom_point(data = layer_2, aes(percollege, percpovertyknown, colour = "green"), size = 5)+
  scale_color_manual(name = "In metro area", values = c("red" = "#F8766D", "green"="#00BFC4"), labels = c("red" = "0", "green" ="1"))

order_inmetro<-c("0", "1") #define the order
midwest_sorted<-midwest[order(match(midwest$inmetro, order_inmetro)),] # sort the rows of dataframe
midwest_sorted$inmetro<-as.character(midwest_sorted$inmetro) # convert the class of inmetro variable to character

ggplot(data = midwest_sorted, aes(percollege, percpovertyknown, colour = inmetro)) + geom_point(size = 5)+
  scale_color_manual(name = "In metro area", values = c("0" = "#F8766D", "1"="#00BFC4"), labels = c("0" = "0", "1" ="1"))

colour_values <- c("0" = "#F8766D", "1"="#00BFC4") 
print(colour_values)
#is equivalent to 
colour_values <- c("#F8766D", "#00BFC4")
names(colour_values) <- c("0", "1")
print(colour_values)



