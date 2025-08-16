indic1copy <- indic1
indic2copy <- indic2

vintages <- list(indic1copy, indic2copy)

# Get diff size
calc_abs_diff <- function(new_table, old_table) {
  num_cols <- names(new_table)[sapply(new_table, is.numeric)]
  diff_table <- copy(new_table)
  diff_table[, (num_cols) := lapply(num_cols, function(col) new_table[[col]] - old_table[[col]])]
  return(diff_table)
}

# Apply to each pair of tables in the lists
diff_list <- Map(calc_abs_diff, indics, vintages)

# Result
diff_list


# Function to compare two tables
check_for_revisions <- function(dt) {
  diff <- abs(dt[, -1]) > 0.5   # exclude first column
  cbind(ID = dt$ID, diff)                      # keep ID column
}

# Apply function to each pair of tables
revision_list <- Map(check_for_revisions, diff_list)
