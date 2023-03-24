# Code for creating some test data

testdata <- rbind(
    c("Mandelpoteter Norge, 2 kg", "potet", 5, '01199', '011992', '01199'),
    c("Kinakål Nederland, 1 stk", NA, NA, '01171', '011711', '01174'),
    c("BRINGEBÆR 125G KURV", NA, NA, '01161', '011617', '01164'),
    c('Jordbærsyltetøy hjemmelaget 400G',
        'Jordbær 60%, sukker, vann, fortykningsmiddel (pektin), surhetsregulerende middel (eplesyre), konserveringsmiddel (kaliumsorbat)',
        NA, "01182","011821","01183"),
    c("Maiskorn til popcorn 400g", "Tørkede maiskorn", NA, '01173', '011732','01179')
)

colnames(testdata) <- c('product_name', "ingreds", "temp", 'ecoicop5', 'ecoicop6', 'coicopUN')

save(testdata, file = "data/testdata.RData")

