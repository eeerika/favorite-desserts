library(tidyverse)
library(here)
library(janitor)

iconic <- read_csv(here("iconic_desserts.csv"))
fave <- read_csv(here("favorite_desserts.csv")) %>%
  clean_names()

fave_test <- read_csv(here("favorite_desserts_test.csv")) %>%
  clean_names()

matches <- c()

for (i in seq_along(fave_test$favorite_dessert)) {
  for (j in seq_along(iconic$dessert)) {
    if (fave_test$favorite_dessert[i] == iconic$dessert[j]) {
      matches <- append(matches, fave_test$favorite_dessert[i])
    }
  }
}


if (length(matches) == 0) {
  message("No matches.")
}

if (length(matches) != 0) {
  print(matches)
}
