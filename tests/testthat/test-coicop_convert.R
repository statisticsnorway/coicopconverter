## Unittests for coicop converter

test_that("Avocado is coded correctly", {
  ny <- coicop_convert(testdata,
                       ecoicop = "ecoicop5",
                       varenavn = "product_name",
                       coicop6 = "ecoicop6",
                       ingredients = "ingreds",
                       maxtemp = "temp")
  expect_equal(ny[7], "01161")
})


test_that("Code will run if temperature is missing",{
  ny <- coicop_convert(testdata,
                       ecoicop = "ecoicop5",
                       varenavn = "product_name",
                       coicop6 = "ecoicop6",
                       ingredients = "ingreds")
  expect_equal(ny[8], "01161")
})


test_that("Maxtemp is correctly converted to numeric",{
  ny <- coicop_convert(testdata,
                       ecoicop = "ecoicop5",
                       varenavn = "product_name",
                       coicop6 = "ecoicop6",
                       ingredients = "ingreds",
                       maxtemp = "temp")
  expect_equal(ny[8], "01161")
})


test_that("Item missing name returns NA",{
  expect_message(
    ny <- coicop_convert(testdata,
                         ecoicop = "ecoicop5",
                         varenavn = "product_name",
                         coicop6 = "ecoicop6",
                         ingredients = "ingreds",
                         maxtemp = "temp")
  )
  expect_true(is.na(ny[10]))
})
