############################################################
# 01_import_clean_data.R
#
# Purpose:
# Import the manually coded study files, clean construct
# labels, and create a list of variables appearing across
# the studies.
#
# Each Excel file represents one study:
#   Sheet 1 = study-level moderators
#   Sheet 2 = correlations, means, SDs, reliabilities,
#             and measurement information
#
# The original coding sheets were manually checked before
# running this analysis.
############################################################


library(readxl)


############################################################
# File paths
############################################################

# config.R contains the local path to the private coding files.
# This file is not uploaded to GitHub.

source("config.R")

main_o <- RAW_DATA_DIR
main_n <- file.path("data", "processed")

if (!dir.exists(main_n)) {
  dir.create(main_n, recursive = TRUE)
}


############################################################
# Read all coded study files
############################################################

filenameswext <- list.files(
  path = main_o,
  pattern = "\\.xlsx$"
)

filenames <- gsub("\\.xlsx$", "", filenameswext)


# mod = moderator information from the first sheet

mod <- vector("list", length(filenames))

for (i in 1:length(filenames)) {

  mod[[i]] <- read_excel(
    file.path(main_o, filenameswext[i]),
    sheet = 1,
    col_names = FALSE
  )

  print(i)
}


# cor = correlations and measurement information
# from the second sheet

cor <- vector("list", length(filenames))

for (i in 1:length(filenames)) {

  cor[[i]] <- read_excel(
    file.path(main_o, filenameswext[i]),
    sheet = 2,
    col_names = TRUE
  )

  print(i)
}


############################################################
# Clean construct names
############################################################

mod2 <- mod
cor2 <- cor

for (i in 1:length(filenames)) {

  # Convert construct names to lower case

  cor2[[i]][[2]] <- tolower(cor2[[i]][[2]])


  # Remove punctuation that was used inconsistently
  # across coding sheets

  cor2[[i]][[2]] <- gsub("[():,\\-]", "", cor2[[i]][[2]])


  # Remove extra spaces

  cor2[[i]][[2]] <- gsub("\\s+", " ", cor2[[i]][[2]])
  cor2[[i]][[2]] <- trimws(cor2[[i]][[2]])
}


############################################################
# Correct known coding inconsistencies
############################################################

# These replacements were part of the original coding and
# data-cleaning process. They standardize inconsistent or
# overly long construct labels before broader construct
# grouping is performed in the next stage of the analysis.

for (i in 1:length(filenames)) {


  # Commitment

  cor2[[i]][[2]] <- gsub(
    "career commitment",
    "job commitment",
    cor2[[i]][[2]],
    fixed = TRUE
  )

  cor2[[i]][[2]] <- gsub(
    "brand commitment",
    "organizational commitment",
    cor2[[i]][[2]],
    fixed = TRUE
  )


  # Leadership support

  cor2[[i]][[2]] <- gsub(
    "leadership consideration",
    "perceived supervisor support",
    cor2[[i]][[2]],
    fixed = TRUE
  )


  # Long or inconsistent construct labels

  cor2[[i]][[2]] <- gsub(
    "intention to quit intention to leave propensity to leave withdrawal cognition",
    "intention1 to leave",
    cor2[[i]][[2]],
    fixed = TRUE
  )

  cor2[[i]][[2]] <- gsub(
    "organizational identification employing company identification",
    "organizational1 identification",
    cor2[[i]][[2]],
    fixed = TRUE
  )

  cor2[[i]][[2]] <- gsub(
    "trust manager trust in supervisor supervisory trust leader trust and support",
    "trust1 manager",
    cor2[[i]][[2]],
    fixed = TRUE
  )

  cor2[[i]][[2]] <- gsub(
    "participation in decision making decision control participation",
    "participation in decision making",
    cor2[[i]][[2]],
    fixed = TRUE
  )

  cor2[[i]][[2]] <- gsub(
    "percieved organizational fit personorganization fit",
    "organizational1 fit",
    cor2[[i]][[2]],
    fixed = TRUE
  )

  cor2[[i]][[2]] <- gsub(
    "performance feedback the extent they know about their performance",
    "performance feedback",
    cor2[[i]][[2]],
    fixed = TRUE
  )

  cor2[[i]][[2]] <- gsub(
    "alternative attractiveness relationship with manager",
    "alternative attractiveness",
    cor2[[i]][[2]],
    fixed = TRUE
  )


  # Sales management controls

  cor2[[i]][[2]] <- gsub(
    "export sales management control activity information",
    "control activity information",
    cor2[[i]][[2]],
    fixed = TRUE
  )

  cor2[[i]][[2]] <- gsub(
    "export sales management control activity punishment",
    "control activity punishment",
    cor2[[i]][[2]],
    fixed = TRUE
  )

  cor2[[i]][[2]] <- gsub(
    "export sales management control capabiltiy information",
    "control capabiltiy information",
    cor2[[i]][[2]],
    fixed = TRUE
  )

  cor2[[i]][[2]] <- gsub(
    "export sales management control capabiltiy punishment",
    "control capabiltiy punishment",
    cor2[[i]][[2]],
    fixed = TRUE
  )

  cor2[[i]][[2]] <- gsub(
    "export sales management control capabiltiy reward",
    "control capabiltiy reward",
    cor2[[i]][[2]],
    fixed = TRUE
  )


  # Other constructs

  cor2[[i]][[2]] <- gsub(
    "frontline deviance salespeople doing unethical things",
    "frontline deviance",
    cor2[[i]][[2]],
    fixed = TRUE
  )

  cor2[[i]][[2]] <- gsub(
    "managerial respect manager respects employee",
    "manager respects employee",
    cor2[[i]][[2]],
    fixed = TRUE
  )

  cor2[[i]][[2]] <- gsub(
    "organizational deviance avoid working by doing unseenables",
    "organizational deviance",
    cor2[[i]][[2]],
    fixed = TRUE
  )

  cor2[[i]][[2]] <- gsub(
    "reverse of aggressive selling practice first firm then customer",
    "reverse of aggressive selling",
    cor2[[i]][[2]],
    fixed = TRUE
  )

  cor2[[i]][[2]] <- gsub(
    "sum of stressors conflictambiguityoverloadworkfamily",
    "sum of stressors",
    cor2[[i]][[2]],
    fixed = TRUE
  )

  cor2[[i]][[2]] <- gsub(
    "transaction specific assets possessed by salespeople",
    "transaction assets salespeople",
    cor2[[i]][[2]],
    fixed = TRUE
  )

  cor2[[i]][[2]] <- gsub(
    "uncontrollable negative critical sales events",
    "negative sales events",
    cor2[[i]][[2]],
    fixed = TRUE
  )

  cor2[[i]][[2]] <- gsub(
    "uncontrollable posetive critical sales events",
    "posetive sales events",
    cor2[[i]][[2]],
    fixed = TRUE
  )

  cor2[[i]][[2]] <- gsub(
    "technoeducation",
    "technoeduc",
    cor2[[i]][[2]],
    fixed = TRUE
  )

  print(i)
}


############################################################
# Create list of variables appearing across studies
############################################################

all_var_all_papers2 <- c()

for (i in 1:length(filenames)) {

  all_var_all_papers2 <- c(
    all_var_all_papers2,
    cor2[[i]][[2]]
  )
}


variable_frequency <- table(all_var_all_papers2)

variable_frequency <- sort(
  variable_frequency,
  decreasing = TRUE
)

all_variables <- data.frame(
  variable = names(variable_frequency),
  frequency = as.numeric(variable_frequency),
  stringsAsFactors = FALSE
)


############################################################
# Save cleaned objects for the next analysis steps
############################################################

cleaned_study_data <- list(
  study_names = filenames,
  moderators = mod2,
  correlations = cor2,
  variable_frequency = all_variables
)


saveRDS(
  cleaned_study_data,
  file = file.path(
    main_n,
    "01_cleaned_study_data.rds"
  )
)


write.csv(
  all_variables,
  file = file.path(
    main_n,
    "01_variable_frequency.csv"
  ),
  row.names = FALSE
)


############################################################
# End
############################################################

print(
  paste(
    length(filenames),
    "study files imported and cleaned."
  )
)
