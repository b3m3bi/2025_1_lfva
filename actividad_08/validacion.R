## install.packages("tidyverse")
## install.packages("janitor")

library(tidyverse)
library(janitor)

data <- read_csv("trafico experiment-table.csv",
         skip = 6) |> 
  janitor::clean_names()

data |>
  filter(step == max(data$step)) |>
  ggplot(aes(x = numero_de_carros, y = cuenta_global)) + 
  geom_point(alpha = 1) +
  facet_grid( labeller = label_bquote( col = numero_de_carros == .(numero_de_carros), row = cuenta_global == .(cuenta_global))) +
  labs(x = expression(rho), y = expression("q")) 
 

       