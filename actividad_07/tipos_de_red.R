## install.packages("tidyverse")
## install.packages("janitor")

library(tidyverse)
library(janitor)

data <- read_csv("polarizacion_extension_redes experiment_gamma_homofilia-table.csv",
         skip = 6) |> 
  janitor::clean_names()

data |>
  filter(step == max(data$step)) |>
  ggplot(aes(x = gamma, y = psi)) + 
  geom_point(alpha = 0.5) +
  facet_grid( tipo_red ~ h, labeller = label_bquote( col = h == .(h), row = tipo_red == .(tipo_red))) +
  labs(x = expression(gamma), y = expression(Psi)) +
  scale_x_continuous(breaks = seq(0,1, by=0.2))

       
