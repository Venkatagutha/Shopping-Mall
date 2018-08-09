Mall<- read.csv("Mall_Customers.csv")
M<-Mall[4:5]


# Find the number of cluster required using elbow method
# chose the point that looks similar to an elbow
# that is biggest change in the line(slope)
library(cluster)
set.seed(6)
w<- vector()
for( i in 1:10)w[i]<-sum(kmeans(M,i)$withins)
plot(1:10,w, type="b",xlab="No.of clusters", ylab="W", main="Finding number of clusters")
# here we can set k=5
#Now use this knowledge and build kmeans cluster.
set.seed(29)
k<- kmeans(M, 5, iter.max = 300, nstart = 10)
# now visualise 
clusplot(M,k$cluster ,xlab="Income", ylab="Spendings", main ="Types of customers",lines=0,
          shade= T, color = T,plotchar=T, span=T)
