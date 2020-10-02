#Importing data to tibble
data_import <- function(csv){
new_data <- read_csv(file = csv, col_names = TRUE)
    return(new_data)
}