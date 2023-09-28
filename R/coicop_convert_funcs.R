
#' Convert a single European COICOP to 2018 UN COICOP
#'
#' @param ecoicop String contain the COICOP (5-digits, no periods)
#' @param coi1 The 1:1 table
#' @param coicop_ref The reference data
#' @param varenavn String with the product name
#' @param coicop6 String with the COICOP 6 classification (if available)
#' @param ingredients String with the list of ingredients (if available)
#' @param maxtemp Maximum temperature for storage (if available)
#'
#' @return string with COICOP value
#' @keywords internal
coicop_convert_single <- function(ecoicop, coi1, coicop_ref, varenavn=NULL,
                                  coicop6=NULL, ingredients= NULL,
                                  maxtemp = NULL){
  if(is.na(ecoicop)){
    return (NA)
  }
  if (ecoicop %in% coi1$ecoi){
    m <- match(ecoicop, coi1$ecoi)
    return(coi1$coi18[m])
  }
  if (missing(varenavn)){
    return(NA)
  }
  temp <- coicop_ref[coicop_ref$ecoicop == ecoicop, ]
  if (nrow(temp) == 0){
    return(NA)
  }

  new_coicop <- NA
  for (i in 1:nrow(temp)){
    alt_coicop <- ifelse(is.na(temp$coicop_alt[i]), new_coicop, temp$coicop_alt[i])
    new_coicop <- intern_convert(coicop_words = temp$words[i],
                                 ecoicop,
                                 coicop18 = c(temp$coicop[i], alt_coicop),
                                 coicop6=coicop6,
                                 coicop6_test=temp$coicop6[i],
                                 makstemp=maxtemp,
                                 makstemp_limit=temp$temp[i],
                                 varenavn=varenavn,
                                 ingredients=ingredients,
                                 ingredients_test = temp$ingreds[i]
    )
  }
  new_coicop
}



#' Lower level internal convert function
#'
#' @param coicop_words String with words to identify in the product name
#' @param coicop18 Vector of two: first is the COICOP to allocated given words,coicop 6,max temp found; second is the alternate.
#' @param coicop6_test String with Coicop 6 group or groups to check for.
#' @param makstemp Maximum temperature for storage (if available)
#' @param makstemp_limit Maximum temperature to check for.
#' @param ingredients string with list of ingredients
#' @param ingredients_test Whether to check ingredients
#' @inheritParams coicop_convert_single
#'
#' @return String with new coicop group
intern_convert <- function(coicop_words, ecoicop, coicop18,
                           coicop6=NULL, coicop6_test=NULL,
                           makstemp=NULL, makstemp_limit=NULL, varenavn=NULL,
                           ingredients=NULL, ingredients_test=FALSE

){
  if (is.na(varenavn)){
    print("The product name is missing for some items")
    #varenavn <- " "
  }
  if (length(varenavn) > 1){
    varenavn <- paste(varenavn, collapse = " ")
  }

  # Check if words are in name variables
  if (is.na(coicop_words)){
    cond_words <- FALSE
  } else {
    if (is.na(varenavn)){
      cond_words <- FALSE
    }
    cond_words <- stringr::str_detect(varenavn,
                             stringr::regex(paste(coicop_words, collapse = "|"),
                                   ignore_case = T))
  }

  # Check if words in ingredients
  if (ingredients_test == 1){
    ingredients = stringr::word(ingredients, 1)
    ingredients_test = TRUE
  }
  if (ingredients_test){
    cond_ingredients <- stringr::str_detect(ingredients,
                                   stringr::regex(paste(coicop_words, collapse = "|"),
                                         ignore_case = T))
  } else {
    cond_ingredients <- FALSE
  }

  # Check max temp
  if (is.na(makstemp_limit)){
    cond_temp <- FALSE
  } else {
    if(is.na(makstemp)){
      cond_temp <- FALSE
    } else {
    cond_temp <- as.numeric(makstemp) <= makstemp_limit
    }
  }

  # Check coicop 6
  if (is.na(coicop6_test)){
    cond_coicop6 <- FALSE
  } else {
    cond_coicop6 <- stringr::str_detect(coicop6, stringr::regex(coicop6_test,
                                     ignore_case = T))
  }

  ifelse(any(cond_words, cond_ingredients, cond_temp, cond_coicop6), coicop18[1], coicop18[2])

}


#' Convert from European COICOP to UN COICOP
#'
#' @param data Name of the data set
#' @param ecoicop Name of the variable for the European COICOP
#' @param varenavn Name of the variable for the product name(s)
#' @param coicop6 Name of the variable containing COICOP6
#' @param ingredients Name of the variable for the ingredients
#' @param maxtemp Name on the variable for the maximum storage temperature.
#'
#' @return UN COICOP (2018) classification
#' @export
coicop_convert <- function(data, ecoicop, varenavn=NULL, coicop6=NULL,
                           ingredients=NULL, maxtemp = NULL){

  # Load 1:1 coicop codes and coicop reference words and new coicop codes
  data("coi1", package = 'coicopconverter')
  data("coicop_ref", package = 'coicopconverter')

  # Convert to data frame
  data <- data.frame(data)

  # check variables
  if (missing(ecoicop) | !(ecoicop %in% names(data))){
    stop("The variable for ecoicop was missing or not found in the data")
  }
  ecoicop_vec = data[, ecoicop]

  if (missing(ingredients)){
    ingredients <- rep(" ", nrow(data))
  } else{
    ingredients_vec <- data[, ingredients]
    ingredients_vec[is.na(ingredients_vec)] <- " "
  }

  if (missing(coicop6)){
    coicop6_vec  <- rep(" ", nrow(data))
  } else {
    coicop6_vec = data[, coicop6]
  }

  if (length(varenavn)>1){
    stop("There should only be one variable for the product name")
  } else{
    varenavn_vec = data[, varenavn]
  }

  # IF no temperature variable is given, assume not frozen
  # Temperature only currently used to split pasta that is actually pre-made frozen meal.
  if (missing(maxtemp)){
    maxtemp_vec <- rep(10, )
  } else {
    maxtemp_vec = data[, maxtemp]
  }

  coicop <- rep(NA, nrow(data))
  for (j in 1:nrow(data)){
    coicop[j] <- coicop_convert_single(ecoicop_vec[j], coi1=coi1,
                                       coicop_ref=coicop_ref, varenavn=varenavn_vec[j],
                                       coicop6=coicop6_vec[j], ingredients= ingredients_vec[j],
                                       maxtemp = maxtemp_vec[j])
  }
  names(coicop) <- NULL
  bad <- sum(is.na(coicop))
  if (bad > 0){
    message("There were ", bad, " observations that could not be assigned to a coicop.")
  }
  coicop
}




