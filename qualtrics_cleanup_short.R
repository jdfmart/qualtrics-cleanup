# The following script takes a dataset downloaded from a Qualtrics survey and performs a set of steps to clean it up. 
# This includes removing the first row (which contains the question text), removing 17 columns that come in every Qualtrics file, removing "timing" variables by multiple keywords (e.g., "RT", "Timing", etc.), adding a "Participant ID" column, and exporting the cleaned dataset to an excel file.

# If qualtrics changes the name of any of its default columns, you may need to adjust the script accordingly.
# Let me know if it happens so I can update the script and shiny app.

data_compact <- read_excel("data.xlsx") %>% 
  .[-1,] %>% 
  select(-c(StartDate,
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
            UserLanguage)) %>% 
  select(-contains(c("First Click", "Last Click", "Page Submit", "Click Count", "RT", "Timing", "Click"))) %>% 
  mutate(ID = row_number()) %>% 
  select(c(ID, everything())) %>%
  write_xlsx("data_clean.xlsx")