library(raster)


m1 <- matrix(c(1,1,2,2,1,1,2,2,1,1,3,3),ncol=4,nrow=3,byrow=TRUE)
m2 <- matrix(c(1,2,3,4,2,NA,2,2,3,3,3,1),ncol=4,nrow=3,byrow=TRUE)

print(m1)
print(m2)

r1 <- raster(m1)
r2 <- raster(m2)

extent(r1) <- extent(r2) <- extent(c(0,4,0,3))

colortable(r1) <- c("red","blue","green")
colortable(r2)<- c("red","blue","green","yellow")

plot(r1)
plot(r2)

r12 <- stack(r1,r2)
plot(r2,axes=TRUE)

res(r1)

xmax(r1) 

cellStats(r1,"sum") 

cellStats(r1,"sd") 

sum1 <- r1 + 2; print(as.matrix(sum1))

sum2 <- r1 + 2*r2
print(as.matrix(sum2))

sum3 <- overlay(r1, r2, sum1, fun=function(x, y, z){ x + 2*y -z} )
print(as.matrix(sum3))

m3 <- matrix(c(5,5,5,5,5,5,5,5,5,5,5,5),ncol=4,nrow=3,byrow=TRUE)
print(m3)

r3 <- raster(m3)

extent(r3) <- extent(c(0,4,3,6)) # Está al norte de r1
mosaico <- merge(r1,r3)
extent(mosaico)

print(as.matrix(mosaico))

extent_corte <- extent(c(1,3,2,4))
corte <- crop(mosaico,extent_corte)
print(as.matrix(corte))

print(as.matrix(r2))
r2[r2 > 2] <- 6
print(as.matrix(r2))

system("wget http://storage.googleapis.com/trabajos/Data.zip")
