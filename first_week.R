install.packages("readr")  # Sadece ilk kez y??klemek i??in
library(readr)
#Veri Setini i??e Aktaral??m
bike_csv <- read.csv("C:/Users/Casper/Desktop/SeoulBikeData.csv")
#Veri Yap??s??n?? ??nceleyelim
str(bike_csv)
colnames(bike_csv)

#Kiralanan toplam bisiklet say??s??:
total_bikes <-sum(bike_csv$`Rented.Bike.Count`, na.rm = TRUE)
total_bikes

#Ortalama s??cakl??k:
mean_temp <- mean(bike_csv$`Temperature..C.`,na.rm = TRUE)
mean_temp

#Maksimum r??zgar h??z??:
max_wind <- max(bike_csv$`Wind.speed..m.s`,na.rm=T)
max_wind

#Mevsim de??i??kenini fakt??r yapal??m.
fseason <-factor(bike_csv$Seasons)
levels(fseason)
table(bike_csv$Seasons) #her bir levelin frekanslar??n?? g??sterir

#Saatleri i??eren bir vekt??r olu??tural??m.
hours <-(bike_csv$Hour)
hours
#Eksik Veri var m???
missing_values <- sum(is.na(bike_csv))
missing_values
colSums(is.na(bike_csv))
#Bir matris olu??tural??m
temp_m <- matrix(c(bike_csv$Temperature..C.,bike_csv$Humidity...), ncol=2,byrow=FALSE)
colnames(temp_m) <- c("temperature","humidity")
temp_m
#Olu??turdu??umuz matrise g??z atal??m:
head(temp_m)
dim(temp_m)
nrow(temp_m)
ncol(temp_m)

#Liste olu??tural??m
bike_list <- list(data = bike_csv, hours = hours, temp_humidity = temp_m)
bike_list

#??zetler
summary(bike_csv)
head(temp_m)
str(bike_list)

library(dplyr)
glimpse(bike_list)

#Data Frames
head(bike_csv, 10)

#Ka?? tatil g??n?? oldu??una bakal??m:
fholiday <- factor(bike_csv$Holiday)
levels(fholiday)
table(fholiday)

#Merging Vectors
rainfall <- c(bike_csv$Rainfall.mm.)
rainfall
snowfall <- c(bike_csv$Snowfall..cm.)
snowfall
weather_conditions <- cbind(rainfall,snowfall)
#Basit bir Grafik ??izelim (Ekstra)
library(ggplot2)
ggplot(bike_csv, aes(x = `Rented.Bike.Count`)) +
  geom_histogram(binwidth = 100, fill = "pink", color = "green") +
  theme_minimal() +
  labs(title = "Bisiklet Kiralama Say??lar??n??n Da????l??m??", x = "Kiralanan Bisiklet Say??s??", y = "Frekans")
table(bike_csv$`Rented.Bike.Count`)


