<!-- badges: start -->
  [![R-CMD-check](https://github.com/statisticsnorway/coicopconverter/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/statisticsnorway/coicopconverter/actions/workflows/R-CMD-check.yaml)
  <!-- badges: end -->

# COICOP Converter

This R package contains a function to convert a COICOP variable from the European COICOP standard to the newer 2018 UN COICOP.

The package can be installed in a renv environment by running the code:
```
renv::install("statisticsnorway/coicopconverter")
```

We then use the `library` to load the package

```
library(coicopconverter)
```

The package contains some test data to run the main function, called `coicop_convert()`. The following gives an example

```
data(testdata)
new_coicop <- coicop_convert(testdata, "ecoicop5", "product_name",
               coicop6 = "ecoicop6",
               ingredients = "ingreds",
               maxtemp = "temp")

```


