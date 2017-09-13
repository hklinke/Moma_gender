
# 1929-1989
# Load Moma Collection Data first from https://github.com/MuseumofModernArt/collection

# create column with year numerical
MoMAExhibitions1929to1989$ex_year=as.integer(
  substring(MoMAExhibitions1929to1989$ExhibitionBeginDate, 
            nchar(MoMAExhibitions1929to1989$ExhibitionBeginDate)-3, 
            nchar(MoMAExhibitions1929to1989$ExhibitionBeginDate)))


# create frame
moma_gender <- data.frame(year=numeric(),
                          female=numeric(), 
                          male=numeric(), 
                          stringsAsFactors=FALSE)

#loop to fill the table

for(i in 1929:1989){
    moma_gender[i-1928,1]=i
  moma_gender[i-1928,2]=sum(
    (MoMAExhibitions1929to1989$Gender=="Female")& 
      (MoMAExhibitions1929to1989$ex_year==i), 
    na.rm=TRUE)
  moma_gender[i-1928,3]=sum(
    (MoMAExhibitions1929to1989$Gender=="Male")& 
      (MoMAExhibitions1929to1989$ex_year==i), 
    na.rm=TRUE)
}


plot(moma_gender$year, moma_gender$female, type="o", 
     ylim = c(0,1000), col="red", main="Gender in Exibitions", xlab="year", ylab = "female/male")
lines(moma_gender$year, moma_gender$male, type="o", col="blue")
