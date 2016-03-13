complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    ## initializing the output dataframe
    dataframe = NULL   
    # adjust literal value of directory
    directory1 <- paste("./",directory, "/", sep="")
    # find all files in the directory folder
    all_files <- list.files(directory1)
    file_paths <- paste(directory1, all_files, sep="") 
    #Looping thru the directory files specified in the 'id' argument
    for (i in id) {
        current_file <- read.csv(file_paths[i], header=T, sep=",")
        data_without_na <- na.omit(current_file)
        data_without_na_matrix = as.matrix(data_without_na)
        # fill each row with iterator # and number of complete rows of data
        dataframe = rbind(dataframe, c(i,nrow(data_without_na_matrix)))
    }
    dataframe = data.frame(dataframe)  # convert matix back to data frame 
    names(dataframe) = c('id', 'nobs') # set the column names of the data frame
    return (dataframe) 
} 