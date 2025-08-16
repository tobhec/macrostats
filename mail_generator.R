library(blastula)
library(glue)
library(knitr)

body_text <- "## Daily Data Update "
index <- 0
for (indic in indics) {
  index <- index + 1
  table <- kable(indic, format = "html")
  part <- glue("
  <span style='color:blue; font-weight:bold;'>{names(indics)[index]}</span>
  {table}
  {names(indics)[number]} grew by <span style='background-color:#90EE90;'>2.3%</span> compared to 2022.
  
  [See full dataset here]({links[[index]]})
  ")
  body_text <- paste0(body_text, "\n\n", part)
  
}

email <- compose_email(body = md(body_text))
email
