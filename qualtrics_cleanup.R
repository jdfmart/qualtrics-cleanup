# The following script takes a dataset downloaded from a Qualtrics survey and performs a set of steps to clean it up. 
# This includes removing the first row (which contains the question text), removing 17 columns that come in every Qualtrics file, removing "timing" variables by multiple keywords (e.g., "RT", "Timing", etc.), adding a "Participant ID" column, and exporting the cleaned dataset to an excel file.

# If qualtrics changes the name of any of its default columns, you may need to adjust the script accordingly.
# Let me know if it happens so I can update the script and shiny app.

# Installing relevant packages
install.packages("tidyverse")
install.packages("readxl")
install.packages("writexl")

# Loading relevant packages
library(tidyverse)
library(readxl)
library(writexl)

# Loading the data
data <- read_excel("data.xlsx")

# Removes the second line (contains question text)
data <- data[-1,]

# Removing 17 useless columns that come in every Qualtrics file
data <- select(data,
               -c(StartDate,
                  EndDate,
                  Status,
                  IPAddress,
                  Finished,
                  RecordedDate,
                  ResponseId,
                  RecipientLastName,
                  RecipientFirstName,
                  RecipientEmail,
                  LocationLatitude,
                  LocationLongitude,
                  ExternalReference,
                  DistributionChannel,
                  UserLanguage))

# Removing "timing" variables by multiple keywords (e.g., "RT", "Timing", etc.)
data <- select(data, -contains(c("First Click", "Last Click", "Page Submit", "Click Count", "RT", "Timing", "Click")))

# Adding a "Participant ID" column
data <- mutate(data, ID = row_number())

# Move ID to the start
data <- select(data, c(ID, everything()))

# Exporting to an excel file
write_xlsx(data, "data_clean.xlsx")