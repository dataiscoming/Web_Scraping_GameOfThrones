# xpath
X_PATH = '/html/body/div[4]/div/div[1]/div/div[3]/div[4]/div/table[2]/tbody/tr/td/table'

#Specifying the url for desired website to be scraped
url <- 'https://awoiaf.westeros.org/index.php/Westeros'

df <- get_data(x_path = X_PATH, url = url)

summary(df$dataframe)

df1<-df[[1]][1]

colnames(df1)<-c("X")
df1 <- df1$X[df1$X!=""]

df2<-na.omit(df[[1]][2])

df3 <- data.frame("Continent"=NA,"kingdom"=NA,"Timestamp"=NA,"Url"=NA)
for(i in 1:nrow(df2)){
  a <- as.data.frame(strsplit(df2[i,1],"\n"))
  tmp <- data.frame("Continent"=rep(df1[i],nrow(a)),
                    "kingdom"=a[,1],
                    "Timestamp"=rep(format(Sys.time(),"%d%m%y%H%M%S"),nrow(a)),
                    "Url"=rep(url,nrow(a)))
  df3 <- rbind(df3,tmp)
}

df3<-na.omit(df3)

rm(df2,rank_data,rank_data_html,tmp,webpage,df1,i,url,X_PATH,a)



