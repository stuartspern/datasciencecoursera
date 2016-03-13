corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    ## initializing the correlation matrix
    correlation_v <- numeric(0)
    # adjust literal value of directory
    directory1 <- paste("./",directory, "/", sep="")
    
    # find all files in the directory folder
    all_files <- list.files(directory1)
    file_paths <- paste(directory1, all_files, sep="")
    # get # of files in folder
    ids<-length(all_files)
    #Looping thru all the directory files
    for (i in 1:ids) {
        current_file <- read.csv(file_paths[i], header=T, sep=",")
        ## if the number of complete observed cases meets the threshold, find the correlation between the pollutants for the given monitor AND
        ## append the results in the correlation matrix
        #if (nrow(data_without_na) > threshold) 
         if(sum(complete.cases(current_file))> threshold){
            correlation_v = c(correlation_v, cor(current_file$sulfate, current_file$nitrate, use="complete.obs"))
         }
    }
    
    return (correlation_v)   
}