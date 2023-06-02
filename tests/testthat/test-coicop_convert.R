

test_that("Avocado is coded correctly", {
  ny <- coicop_convert(testdata,
                       ecoicop = "ecoicop5",
                       varenavn = "product_name",
                       coicop6 = "ecoicop6",
                       ingredients = "ingreds",
                       maxtemp = "temp")
  expect_equal(ny[7], "01161")
})



