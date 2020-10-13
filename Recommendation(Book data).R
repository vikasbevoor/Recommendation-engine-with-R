
#Installing and loading the libraries
install.packages("recommenderlab", dependencies=TRUE)
install.packages("Matrix")

library("recommenderlab")
library(caTools)

#movie rating data
books <- read.csv(file.choose())#metadata about the variable
View(books)
attach(books)

# Data exploration
summary(books)
str(books)

#converting 0 values in rating into NA
ratings...3.[ratings...3. == 0] <- NA
books <- books[-c(6)]
books <- cbind(books, ratings...3.)
View(books)

book <- books[-c(1,4,5)]
View(book)
attach(book)


#rating distribution
hist(ratings...3.)
summary(ratings...3.)


#the datatype should be realRatingMatrix inorder to build recommendation engine
book_matrix <- as(book, 'realRatingMatrix')

str(book_matrix)

# 1. Ratings based
#Popularity based 
book_model1 <- Recommender(book_matrix, method="POPULAR")

#Predictions
recommended_items1 <- predict(book_model1,book_matrix[50], n=1)
as(recommended_items1, "list")

## Popularity model recommends the same movies for all users , we need to improve our model using # # Collaborative Filtering

#User Based Collaborative Filtering
book_model2 <- Recommender(book_matrix, method="UBCF")

#Predictions 
recommended_items2 <- predict(book_model2, book_matrix[50], n=1)
as(recommended_items2, "list")


book1 <- books[ ,c(2,4,6)]
View(book1)

# 2. Author based
#the datatype should be realRatingMatrix inorder to build recommendation engine
book1_matrix <- as(book1, 'realRatingMatrix')
str(book1_matrix)

#Popularity based 
book1_model1 <- Recommender(book1_matrix, method="POPULAR")

#Predictions
recommended1_items1 <- predict(book1_model1,book1_matrix[50], n=1)
as(recommended1_items1, "list")

## Popularity model recommends the same books for all users , we need to improve our model using # # Collaborative Filtering

#User Based Collaborative Filtering
book1_model2 <- Recommender(book1_matrix, method="UBCF")

#Predictions 
recommended2_items2 <- predict(book1_model2, book1_matrix[50], n=1)
as(recommended2_items2, "list")


book2 <- books[c(2,5,6)]
View(book2)

# 3. Publisher based
#the datatype should be realRatingMatrix inorder to build recommendation engine
book2_matrix <- as(book2, 'realRatingMatrix')
str(book2_matrix)

#Popularity based 
book2_model1 <- Recommender(book2_matrix, method="POPULAR")

#Predictions
recommended2_items1 <- predict(book2_model1,book2_matrix[50], n=1)
as(recommended2_items1, "list")
## Popularity model recommends the same books for all users , we need to improve our model using # # Collaborative Filtering

#User Based Collaborative Filtering
book2_model2 <- Recommender(book2_matrix, method="UBCF")

#Predictions 
recommended2_items2 <- predict(book2_model2, book2_matrix[50], n=1)
as(recommended2_items2, "list")


