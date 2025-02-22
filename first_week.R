install.packages("readr")  # Sadece ilk kez yuklemek icin
library(readr)
#Veri Setini ice Aktaralim
bike_csv <- read.csv("C:/Users/Casper/Desktop/SeoulBikeData.csv")
#Veri Yapisini inceleyelim
str(bike_csv)
colnames(bike_csv)

#Kiralanan toplam bisiklet sayisi:
total_bikes <-sum(bike_csv$`Rented.Bike.Count`, na.rm = TRUE)
total_bikes

#Ortalama sicaklik:
mean_temp <- mean(bike_csv$`Temperature..C.`,na.rm = TRUE)
mean_temp

#Maksimum ruzgar hizi:
max_wind <- max(bike_csv$`Wind.speed..m.s`,na.rm=T)
max_wind

#Mevsim degiskenini faktor yapalim.
fseason <-factor(bike_csv$Seasons)
levels(fseason)
table(bike_csv$Seasons) #her bir levelin frekanslar??n?? g??sterir

#Saatleri iceren bir vektor olusturalim
hours <-(bike_csv$Hour)
hours
#Eksik Veri var mi?
missing_values <- sum(is.na(bike_csv))
missing_values
colSums(is.na(bike_csv))
#Bir matris olustural??m
temp_m <- matrix(c(bike_csv$Temperature..C.,bike_csv$Humidity...), ncol=2,byrow=FALSE)
colnames(temp_m) <- c("temperature","humidity")
temp_m
#Olusturdugumuz matrise goz atalim:
head(temp_m)
dim(temp_m)
nrow(temp_m)
ncol(temp_m)

#Liste olusturalim
bike_list <- list(data = bike_csv, hours = hours, temp_humidity = temp_m)
bike_list

#Ozetler
summary(bike_csv)
head(temp_m)
str(bike_list)

library(dplyr)
glimpse(bike_list)

#Data Frames
head(bike_csv, 10)

#Kac tatil gunu olduguna bakalim:
fholiday <- factor(bike_csv$Holiday)
levels(fholiday)
table(fholiday)

#Merging Vectors -> Vektorleri birlestirelim
rainfall <- c(bike_csv$Rainfall.mm.)
rainfall
snowfall <- c(bike_csv$Snowfall..cm.)
snowfall
weather_conditions <- cbind(rainfall,snowfall)
#Basit bir grafik cizelim (Ekstra)
library(ggplot2)
ggplot(bike_csv, aes(x = `Rented.Bike.Count`)) +
  geom_histogram(binwidth = 100, fill = "pink", color = "green") +
  theme_minimal() +
  labs(title = "Bisiklet Kiralama Say??lar??n??n Da????l??m??", x = "Kiralanan Bisiklet Say??s??", y = "Frekans")
table(bike_csv$`Rented.Bike.Count`)


