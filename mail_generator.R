library(blastula)
library(glue)
library(knitr)

body_text <- "## Daily Data Update "
number <- 0
for (i in indics) {
  number <- number + 1
  table <- kable(i, format = "html")
  part <- glue("
  <span style='color:blue; font-weight:bold;'>{names(indics)[number]}</span>
  {table}

  {names(indics)[number]} grew by <span style='background-color:#90EE90;'>2.3%</span> compared to 2022. 
  ")
  body_text <- paste0(body_text, "\n\n", part)
  
}

email <- compose_email(body = md(body_text))
email
