nClientsPerf <- read.csv('./experiments/nclients-results.csv', header=FALSE, colClasses=c('numeric', rep('numeric', 3), 'numeric'))
nEntriesPerf <- read.csv('./experiments/nentries-results.csv', header=FALSE, colClasses=c('numeric', rep('numeric', 3), 'numeric'))
nReadPerf <- read.csv('./experiments/rops-results.csv', header=FALSE, colClasses=c('numeric', rep('numeric', 3), 'numeric'))
nWritesPerf <- read.csv('./experiments/wops-results.csv', header=FALSE, colClasses=c('numeric', rep('numeric', 3), 'numeric'))
nReadWritePerf <- read.csv('./experiments/rwratio-results.csv', header=FALSE, colClasses=c('numeric', rep('numeric', 3), 'numeric'))

nReadWritePerf$V6<-nReadWritePerf$V3/(nReadWritePerf$V3 + nReadWritePerf$V4)

par(mfrow=c(1,1))

plot(nClientsPerf$V5 ~ nClientsPerf$V1, data=nClientsPerf, type="b", col="red", ylab="Successfull transaction rate %", xlab="Number of Clients", main="Number of Clients Increase")
plot(nEntriesPerf$V5 ~ nEntriesPerf$V2, data=nEntriesPerf, type="b", col="red", ylab="Successfull transaction rate %", xlab="Number of Entries", main="Number of Entries Increase")
plot(nReadPerf$V5 ~ nReadPerf$V3, data=nReadPerf, type="b", col="red", ylab="Successfull transaction rate %", xlab="Number of Reads", main="Number of Reads Increase")
plot(nWritesPerf$V5 ~ nWritesPerf$V4, data=nWritesPerf, type="b", col="red", ylab="Successfull transaction rate %", xlab="Number of Writes", main="Number of Writes Increase")

plot(nReadWritePerf$V5 ~ nReadWritePerf$V6, data=nReadWritePerf, type="b", col="red", ylab="Successfull transaction rate %", xlab="Ratio of Read/Writes", main="Ratio of Read/Writes Increase")
text(30, 100, expression(infinity), cex=2)
text(28, 100, "infinity", cex=1) 

##Experiment with double
nClients <- read.csv('./timey-source-files/params-nclients.csv', header=FALSE, colClasses=c('numeric', rep('numeric', 3), 'numeric'))
nEntries <- read.csv('./timey-source-files/params-nentries.csv', header=FALSE, colClasses=c('numeric', rep('numeric', 3), 'numeric'))
nRead <- read.csv('./timey-source-files/params-rops.csv', header=FALSE, colClasses=c('numeric', rep('numeric', 3), 'numeric'))
nWrites <- read.csv('./timey-source-files/params-wops.csv', header=FALSE, colClasses=c('numeric', rep('numeric', 3), 'numeric'))
nReadWrite <- read.csv('./timey-source-files/params-rwratio.csv', header=FALSE, colClasses=c('numeric', rep('numeric', 3), 'numeric'))

nReadWrite$V6<-nReadWrite$V3/(nReadWrite$V3 + nReadWrite$V4)

summary<-summaryBy(nClients ~ V1, data = nClients, 
          FUN = list(mean, max, min, median, sd))

mean(df1$Mathematics1_score)

attach(mtcars)
par(mfrow=c(2,2))

plot(nClients$V5 ~ nClients$V1, data=nClients, type="b", col="red", ylab="Successfull transaction rate %", xlab="Number of Clients", main="Number of Clients Increase")
lines(nClientsPerf$V5 ~ nClientsPerf$V1, type="b", col="blue")
legend("topright", legend=c("Concurrency Control", "Base"),
       col=c("red", "blue"), lty = 1:1, cex=0.8)


plot(nEntries$V5 ~ nEntries$V2, data=nEntries, type="b", col="red", ylab="Successfull transaction rate %", xlab="Number of Entries", main="Number of Entries Increase")
lines(nEntriesPerf$V5 ~ nEntriesPerf$V2, type="b", col="blue")
legend("topright", legend=c("Concurrency Control", "Base"),
       col=c("red", "blue"), lty = 1:1, cex=0.8)


plot(nRead$V5 ~ nRead$V3, data=nRead, type="b", col="red", ylab="Successfull transaction rate %", xlab="Number of Reads", main="Number of Reads Increase")
lines(nReadPerf$V5 ~ nReadPerf$V3, type="b", col="blue")
legend("topright", legend=c("Concurrency Control", "Base"),
       col=c("red", "blue"), lty = 1:1, cex=0.8)

plot(nWrites$V5 ~ nWrites$V4, data=nWrites, type="b", col="red", ylab="Successfull transaction rate %", xlab="Number of Writes", main="Number of Writes Increase")
lines(nWritesPerf$V5 ~ nWritesPerf$V4, type="b", col="blue")
legend("topright", legend=c("Concurrency Control", "Base"),
       col=c("red", "blue"), lty = 1:1, cex=0.8)

plot(nReadWrite$V5 ~ nReadWrite$V6, data=nReadWrite, type="b", col="red", ylab="Successful transaction rate %", xlab="Ratio of Read/Writes", main="Chaning the ratio of Read/Writes")
lines(nWritesPerf$V5 ~ nWritesPerf$V6, data=nWritesPerf, type="b", col="blue")
legend("right", legend=c("Concurrency Control", "Base"),
       col=c("red", "blue"), lty = 1:1, cex=0.8)


plot(nEntries$V5 ~ nEntries$V2, data=nEntries, ylab="Successfull transaction rate %", xlab="Number of Entires", main="Number of Entries Increase")
