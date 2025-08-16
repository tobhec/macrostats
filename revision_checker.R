indic1copy <- indic1
indic2copy <- indic2

vintages <- list(indic1copy, indic2copy)

# --- Calculate differences (new - old), preserve first column (Country/ID) ---
calc_abs_diff <- function(new_table, old_table) {
  # Get numeric columns only
  num_cols <- names(new_table)[sapply(new_table, is.numeric)]
  
  # Start diff table with the ID column from new_table
  diff_table <- data.table(ID = new_table[[1]])
  setnames(diff_table, "ID", names(new_table)[1])  # keep same name (e.g. Country)
  
  # Add numeric differences
  for (col in num_cols) {
    diff_table[[col]] <- new_table[[col]] - old_table[[col]]
  }
  
  return(diff_table)
}

# Apply to each pair of tables in the lists
diff_list <- Map(calc_abs_diff, indics, vintages)


# --- Function to compare and flag revisions ---
check_for_revisions <- function(dt) {
  id_col <- names(dt)[1]
  
  # Boolean table: TRUE if abs(diff) > 0.5
  diff_flags <- abs(dt[, -1, with = FALSE]) > 0.5
  
  # Put ID column back in front
  revision_table <- as.data.frame(cbind(dt[[1]], diff_flags))
  setnames(revision_table, "V1", id_col)  # restore proper column name
  
  return(revision_table)
}

# Apply function to each diff_table
revision_list <- Map(check_for_revisions, diff_list)

