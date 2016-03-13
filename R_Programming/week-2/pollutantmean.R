pollutantmean <- function(directory, pollutant, id = 1:332) {

    mean_vector <- c()
    # adjust literal value of directory
    directory1 <- paste("./",directory, "/", sep="")
    # find all files in the specdata folder
    all_files <- list.files(directory1)
    file_paths <- paste(directory1, all_files, sep="")
    #Looping thru the directory files specified in the 'id' argument
    for(i in id) {
        current_file <- read.csv(file_paths[i], header=T, sep=",")
        data_without_na <- na.omit(current_file[,pollutant])
        mean_vector <- c(mean_vector, data_without_na)
    }
    result <- mean(mean_vector)
    return(result) 
}

