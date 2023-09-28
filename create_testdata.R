# Code for creating some test data

testdata <- rbind(
    c("Mandelpoteter Norge, 2 kg", "potet", 5, '01199', '011992', '01199'),
    c("Kinakål Nederland, 1 stk", NA, NA, '01171', '011711', '01174'),
    c("BRINGEBÆR 125G KURV", NA, NA, '01161', '011617', '01164'),
    c('Jordbærsyltetøy hjemmelaget 400G',
        'Jordbær 60%, sukker, vann, fortykningsmiddel (pektin), surhetsregulerende middel (eplesyre), konserveringsmiddel (kaliumsorbat)',
        NA, "01182","011821","01183"),
    c("Maiskorn til popcorn 400g", "Tørkede maiskorn", NA, '01173', '011732','01179'),
    c("Stor agurk", NA, NA, "01171", "011714", "01172"),
    c("Avokado spisemoden", NA, NA, "01171", "011719", "01161"),
    c("Avokado spisemoden", NA, NA, "01161", "011719", "01161"),
    c("Pasta meal", NA, 5, "01116", "011161", "01191"),
    c(NA, NA, NA, "01111", "011113", "01111")
)

colnames(testdata) <- c('product_name', "ingreds", "temp", 'ecoicop5', 'ecoicop6', 'coicopUN')

save(testdata, file = "data/testdata.RData")

