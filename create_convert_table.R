# Create table for using in conversion
#### Create reference data ####

# 01111 ris
words01191 <- paste0("ost|gresskar|sopp|kjøtt|kjott|kylling|grønnsaker|gronnsaker|fisk|bønner|",
                     "bonner|løg|løk|sitron|safran|lemon|cheese|pumpkin|mushroom|meat|chicken|",
                     "vegetable|fish|bean")

coicop_ref <- data.frame(ecoicop="01111", words=words01191, ingreds=T, temp=NA, coicop6=NA,
                         coicop="01191", coicop_alt="01111", priority = 1,
                         stringsAsFactors =F)

# 01112 - dropped services
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01112", words = NA, ingreds=F, temp=NA, coicop6="011122",
                                  coicop="01111", coicop_alt="01112", priority = 1))

# 01116 - Pasta - raw og ferdig
words01191 <- "fersk|spinat|ost|sjampinjong|mushroom|olive|skinke|tomat|parmigiano|bolognese|kylling|biff"
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01116", words=words01191, ingreds=F, temp=NA, coicop6=NA,
                                  coicop="01191", coicop_alt="01115", priority = 1))
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01116", words=NA, ingreds=F, temp=6, coicop6=NA,
                                  coicop="01191", coicop_alt=NA, priority = 2))

# 01118 Other cereal products
words01179 <- "potetmel|tapioca|sago"
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01118", words=words01179, ingreds=F, temp=NA, coicop6=NA,
                                  coicop="01179", coicop_alt="01119", priority = 1))

# 01122 - Pork - (hode, hale, øre skal ut)
words01124 <- "sylte|tunge|lever"
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01122", words=words01179, ingreds=F, temp=NA, coicop6=NA,
                                  coicop="01124", coicop_alt="01122", priority = 1))

# 01124 - kylling
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01124", words=words01179, ingreds=F, temp=NA, coicop6=NA,
                                  coicop="01124", coicop_alt="01122", priority = 1))

# 01127 - Sausages (coicop6 = 011273) to 01125
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01127", words=NA, ingreds=F, temp=NA, coicop6=011273,
                                  coicop="01125", coicop_alt="01123", priority = 1))

# 01128 - Other prepared meat - kikkeerter til 01179
words01179 <- "kikkeerter|kikerter|vegetar|vegan|artisjokk-krem|tartex"
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01128", words=words01179, ingreds=F, temp=NA, coicop6=NA,
                                  coicop="01179", coicop_alt="01125", priority = 1))

# 01133 - Seafood
words01122 <- "snegler|frosk|snail|frog"
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01133", words=words01122, ingreds=F, temp=NA, coicop6=NA,
                                  coicop="01122", coicop_alt="01134", priority = 1))

# 01135 - Dried, preserved fish
words01135 <- paste0("krabbe|kreps|blekksprut|reke|octopus|calamari|østers|crab|",
                     "shrimp|kamskjell|skalldyr|aspik")
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01135", words=words01135, ingreds=F, temp=NA, coicop6=NA,
                                  coicop="01135", coicop_alt="01132", priority = 1))

# 01136 - Prepared fish - take out seafood
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01136", words=words01135, ingreds=F, temp=NA, coicop6=NA,
                                  coicop="01136", coicop_alt="01133", priority = 1))
words01137 <- "kaviar|lever|rogn"
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01136", words=words01135, ingreds=F, temp=NA, coicop6=NA,
                                  coicop="01137", coicop_alt=NA, priority = 2))


# 01146 - Use varegruppenavn
words01147 <- "mousse|dessert|panna cotta|risifrutti|mareng|vaniljesaus"
words01144 <- "soya|havredrikk|havremelk|kokosdrikk"
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01146", words="dessert", ingreds=F, temp=NA, coicop6=NA,
                                  coicop="01147", coicop_alt="01149", priority = 1))
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01146", words="krem|fløte|flote", ingreds=F, temp=NA, coicop6=NA,
                                  coicop="01143", coicop_alt=NA, priority = 2))
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01146", words="kaffemelk", ingreds=F, temp=NA, coicop6=NA,
                                  coicop="01141", coicop_alt=NA, priority = 3))
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01146", words=words01147, ingreds=F, temp=NA, coicop6=NA,
                                  coicop="01147", coicop_alt=NA, priority = 4))
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01146", words=words01144, ingreds=F, temp=NA, coicop6=NA,
                                  coicop="01144", coicop_alt=NA, priority = 5))
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01146", words="biola", ingreds=F, temp=NA, coicop6=NA,
                                  coicop="01146", coicop_alt=NA, priority = 6))


# 01152 - take out animal fats and nut butters - CHECK FOR MORE NUT BUTTERS
words01159 <- "andefett|svinefett|ribbefett"
words01184 <- c("nøtt|mandel|kokos|coconut")
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01152", words=words01159, ingreds=F, temp=NA, coicop6=NA,
                                  coicop="01159", coicop_alt="01153", priority = 1))
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01152", words=words01184, ingreds=F, temp=NA, coicop6=NA,
                                  coicop="01184", coicop_alt="01153", priority = 2))


# 01161 ### using coico6 for sitrus & apples!! (add in words?)
words01161 <- "dadler|fiken|avakado|banan|mango|papaya|kokoananas|physalis"
words01163 <- "plomme|nektarin|epler|pære|persimon"
words01164 <- "berry|bær"
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01161", words=words01161, ingreds=F, temp=NA, coicop6=NA,
                                  coicop="01161", coicop_alt="01165", priority = 1))
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01161", words=NA, ingreds=F, temp=NA, coicop6="011611",
                                  coicop="01162", coicop_alt=NA, priority = 2))
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01161", words=NA, ingreds=F, temp=NA, coicop6="011613",
                                  coicop="01163", coicop_alt=NA, priority = 3))
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01161", words=words01163, ingreds=F, temp=NA, coicop6=NA,
                                  coicop="01163", coicop_alt=NA, priority = 4))
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01161", words=NA, ingreds=F, temp=NA, coicop6="011617",
                                  coicop="01164", coicop_alt=NA, priority = 5))
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01161", words=words01164, ingreds=F, temp=NA, coicop6=NA,
                                  coicop="01164", coicop_alt=NA, priority = 6))

# 01163 - Dried fruit and nuts
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01163", words=NA, ingreds=F, temp=NA, coicop6="011632",
                                  coicop="01168", coicop_alt="01167", priority = 1))



#  01171 - veggies
words01171 <- "brokkoli|broccolini|asparges|choy|babyleaf|salat "#ikke salatløk so use space after
words01172 <- "paprika|chili|squash|aubergin|gressk."
words01173 <- "bønner|sukkerert|ert"
words01161 <- "avakado|avocado"
words01175 <- "potet|potatoe"
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01171", words=NA, ingreds=F, temp=NA, coicop6="011711|011715",
                                  coicop="01171", coicop_alt="01174", priority = 1))
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01171", words=words01171, ingreds=F, temp=NA, coicop6=NA,
                                  coicop="01171", coicop_alt=NA, priority = 2))
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01171", words=NA, ingreds=F, temp=NA, coicop6="011713|011714",
                                  coicop="01172", coicop_alt=NA, priority = 3))
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01171", words=words01172, ingreds=F, temp=NA, coicop6=NA,
                                  coicop="01172", coicop_alt=NA, priority = 4))
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01171", words=words01173, ingreds=F, temp=NA, coicop6=NA,
                                  coicop="01173", coicop_alt=NA, priority = 5))
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01171", words=words01161, ingreds=F, temp=NA, coicop6=NA,
                                  coicop="01161", coicop_alt=NA, priority = 6))
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01171", words=words01175, ingreds=F, temp=NA, coicop6=NA,
                                  coicop="01175", coicop_alt=NA, priority = 7))
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01171", words=words01164, ingreds=F, temp=NA, coicop6=NA,
                                  coicop="01164", coicop_alt=NA, priority = 8))


# 01173 - VANSKELIG gruppe
words01177 <- "tør|dried"
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01173", words=words01177, ingreds=T, temp=NA, coicop6=NA,
                                  coicop="01177", coicop_alt="01179", priority = 1))
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01173", words=words01177, ingreds=T, temp=NA, coicop6=011731,
                                  coicop="01176", coicop_alt=NA, priority = 2)) # check for words and coico6






# 01174 - potet
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01174", words=NA, ingreds=F, temp=NA, coicop6=011741,
                                  coicop="01175", coicop_alt="01179", priority = 1))




# 01175 - Crisps (use first ingredient)
words01179 <- "tortilla|corn|mais |maismel|rismel|maiskjerne|hvetemel|majsmel" # not maisstivelse
words01123 <- "beef jerky|bacon krisp|bacongull|baconsvor"
words01167 <- "eple"
words01189 <- "gullmandler|nøttemiks"
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01175", words=words01179, ingreds=1, temp=NA, coicop6=NA,
                                  coicop="01119", coicop_alt="01179", priority = 1))
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01175", words=words01123, ingreds=1, temp=NA, coicop6=NA,
                                  coicop="01123", coicop_alt=NA, priority = 2))
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01175", words=words01167, ingreds=F, temp=NA, coicop6=NA,
                                  coicop="01167", coicop_alt=NA, priority = 3))
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01175", words=words01189, ingreds=F, temp=NA, coicop6=NA,
                                  coicop="01189", coicop_alt=NA, priority = 4))


# 01176 - nothing

# 01192 - salt and herbs vs sauces fix up
ingreds01193 <- "salt"
words01193 <- "sauce|saus"
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01192", words=ingreds01193, ingreds=1, temp=NA, coicop6=NA,
                                  coicop="01193", coicop_alt="01194", priority = 1))
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01192", words=words01193, ingreds=F, temp=NA, coicop6=NA,
                                  coicop="01193", coicop_alt=NA, priority = 2))


# 01199   - vanskelig gruppe!!
words01191 <- c("suppe|soup|spaghetti|lasagne|terrin")
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01199", words=words01191, ingreds=F, temp=NA, coicop6=NA,
                                  coicop="01191", coicop_alt="01199", priority = 1))

# 01221 - Water and flavoured water
words01290 <- paste0("smak|sma|mango|sitron|eple|bær|appelsin|pære|lime|grape|villbr|lemon|
                     apple|frukt|aranciata|limonata|kokos")
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01221", words=words01290, ingreds=F, temp=NA, coicop6=NA,
                                  coicop="01290", coicop_alt="01250", priority = 1))

# 01222 - soft drinks vs energy drinks (fix for incorrect placement from before I think)
words01290 = 'monster|redbull|red bull|rockstar|battery|energy|hellhound|nocco|celcius'
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01222", words=words01290, ingreds=F, temp=NA, coicop6=NA,
                                  coicop="01290", coicop_alt='01260', priority = 1))

# 01223 Juice
coicop_ref <- rbind(coicop_ref, c(ecoicop = "01223", words=NA, ingreds=F, temp=NA, coicop6="012232",
                                  coicop="01210", coicop_alt="01290", priority = 1))


# 02111 - nothing
# 02121 - nothing
# 02122 - nothing
# 02123 - nothing


### IKKE MAT
words04542 <- "ved"
words04543 <- "grillkull"
coicop_ref <- rbind(coicop_ref, c(ecoicop = "04549", words=words04542,
                                  ingreds=F, temp=NA, coicop6=NA,
                                  coicop="04542", coicop_alt="04543",
                                  priority = 1))



# Alle til ?05403!! Check

# 05612 - Check whether to add in more words here
words05611 <- 'svamp|klut'
coicop_ref <- rbind(coicop_ref, c(ecoicop = "05612", words=NA, ingreds=F,
                                  temp=NA,
                                  coicop6="00270|00283|00285|01077",
                                  coicop="05611", coicop_alt="05619",
                                  priority = 1))
coicop_ref <- rbind(coicop_ref, c(ecoicop = "05612", words=words05611,
                                  ingreds=F, temp=NA, coicop6=NA,
                                  coicop="05611", coicop_alt=NA,
                                  priority = 2))


# Save data
Encoding(coicop_ref$words) <- "UTF-8"
save(coicop_ref, file = "data/coicop_ref.RData")

