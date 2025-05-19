# test_match_comid.R

# 📌 This script tests the match_comid() function using one Oregon HCDN gage.
# It is intended for use inside the COMID-QA/2_analytical-engine/tests/ folder.

if (!requireNamespace("librarian", quietly = TRUE)) install.packages("librarian")
librarian::shelf(here,testthat)


# Load the function from source
source(here::here("2_analytical-engine", "source", "match_comid.R"))

# Define a test gage (Alsea River near Tidewater, OR)
gages <- data.frame(
  station_id = "14306500",
  latitude   = 44.38595,
  longitude  = -123.8318
)

# Path to the NHDPlusV2 flowline shapefile (Region 17)
nhd_path <- here::here(
  "1_knowledge-base", "datasets", "raw_data",
  "nhdplusv2_region17", "data", "NHDPlusPN",
  "NHDPlus17", "NHDSnapshot", "Hydrography",
  "NHDFlowline.shp"
)

# Run the matching function
result <- match_comid(gages, nhd_path)

# Print result
dprint <- function(df) print(knitr::kable(df))
dprint(result)

# Optional: test threshold
testthat::expect_true(!is.na(result$COMID))
testthat::expect_lt(result$match_distance_m, 1000)  # e.g., within 1 km

message("✅ match_comid() test complete.")