# Kode for aa lage 1:1 tabell for coicop grupper som en 1:1 eller mange:1

# Les inn xls fil - trenger tilgang
library(readxl)
path_trade <- file.path(Sys.getenv('FORBRUK'), "COICOP_MENGDE_ARBEIDSFIL/coicop2018")
coi <- read_excel(file.path(path_trade, "ECOICOP_COICOP_2018.xlsx"),
                  sheet = "ecoicop___coicop_2018___with_co", col_names=T)
names(coi)[c(1,2,4,5)]  <- c("ecoi", "coi_navn", "coi18", "coi18_navn")

# Filter and formatere
coi <- coi[nchar(coi$ecoi) == 8, ]
coi$ecoi <- gsub("\\.", "", coi$ecoi)
coi$coi18 <- gsub("\\.", "", coi$coi18)

# create dataframe with 1:1 and 1:many matches
tab <- table(coi$ecoi)
tab1 <- tab[tab == 1]
coi1 <- coi[coi$ecoi %in% names(tab1), ]

# add in addition 1:1s
# vegetable oils, other meats, beef, lamb, beer, ales etc
# Have left in 05403 - consider removing and adding in convert table
# All DVDs going to general films etc (should sort education but not sure how.)
others_mat <- cbind(ecoi = c("01153", "01125", "01121", "01123", "02131", "02132"),
                    coi18 = c("01151", "01122", "01122", "01122", "02130", "02130"))
others_ikkemat <- cbind(ecoi = c("03121", "03122", "05403", "05522", "05611", "09332", "12131", "09141"),
                        coi18 = c("03121", "03122", "05403", "05522", "05611", "09312", "13120", "09520"))
coi1 <- rbind(coi1[, c("ecoi", "coi18")],
              others_mat, others_ikkemat)

save(coi1, file = "data/coi1.RData")

