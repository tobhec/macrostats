library(blastula)
library(glue)
library(knitr)
body_text <- "## Daily Data Update "
index <- 0

for (indic in indics) {
  index <- index + 1
  
  # Get the corresponding revised table (TRUE/FALSE same size as indic)
  revision_table <- revision_list[[index]]   # you’d keep these in a parallel list
  
  # Make a copy to modify for coloring
  indic_colored <- indic
  
  # Replace revised cells with span-wrapped HTML
  for (j in seq_along(indic[, -1])) {
    indic_colored[[j+1]] <- ifelse(
      revision_table[[j]], 
      sprintf("<span style='background-color:orange;'>%s</span>", indic[[j+1]]),
                                                            as.character(indic[[j+1]])
    )
  }
  
  diff_table <- diff_list[[index]]
  
  revision_sentences <- ""
  row_ids <- diff_table[[1]]   # assume first column is the row identifier
  
  for(row_index in seq_len(nrow(diff_table))) {
    for(column_index in seq_len(ncol(diff_table[, -1]))) {
      if (revision_table[row_index, column_index]) {
        # Get the value from diff_table (skip first column for column_index offset)
        value <- diff_table[[column_index + 1]][row_index]
        
        # Get identifiers for row and column
        row_label <- row_ids[row_index]
        col_label <- names(diff_table)[column_index + 1]
        
        revision_sentences <- paste0(
          revision_sentences,
          sprintf(
            "%s, %s has been revised by %.2f.<br>",
            row_label,
            col_label,
            value
          )
        )
      }
    }
  }
  
  
  # Build HTML table (escape = FALSE to allow <span> rendering)
  table <- kable(indic_colored, format = "html", escape = FALSE)
  
  # Build part of email body
  part <- glue("
  <span style='color:blue; font-weight:bold;'>{names(indics)[index]}</span>
  {table}
  {revision_sentences}
  
  [See full dataset here]({links[[index]]})
  
  --------------------------------------------------------
  ")
  
  body_text <- paste0(body_text, "\n\n", part)
}

email <- compose_email(body = md(body_text))
email


