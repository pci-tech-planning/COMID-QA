# match_comid.R

#' Match HCDN sites to nearest NHDPlusV2 COMID
#'
#' @param gage_df A data.frame or tibble with columns: station_id, latitude, longitude
#' @param nhd_path Path to NHDFlowline shapefile
#' @param max_distance Maximum allowable match distance in meters (optional)
#' @return A data.frame with original gage info, matched COMID, and match distance
#' 
#' @examples
#' gages <- data.frame(station_id = c("14306500"),
#'                     latitude = c(44.38595),
#'                     longitude = c(-123.8318))
#' nhd_path <- here::here("1_knowledge-base", "datasets", "raw_data",
#'                        "nhdplusv2_region17", "data", "NHDPlusPN",
#'                        "NHDPlus17", "NHDSnapshot", "Hydrography",
#'                        "NHDFlowline.shp")
#' match_comid(gages, nhd_path)

match_comid <- function(gage_df, nhd_path, max_distance = NULL) {
  stopifnot(all(c("station_id", "latitude", "longitude") %in% names(gage_df)))
  
  # Install and load librarian if needed
  if (!requireNamespace("librarian", quietly = TRUE)) {
    install.packages("librarian")
  }
  
  # Load required packages
  librarian::shelf(sf, dplyr)
  
  # Convert input points to sf
  gage_sf <- st_as_sf(gage_df,
                      coords = c("longitude", "latitude"),
                      crs = 4326)
  
  # Read NHDPlusV2 flowlines
  flowlines <- st_read(nhd_path, quiet = TRUE)
  
  # Transform gage points to match NHD CRS
  gage_sf <- st_transform(gage_sf, st_crs(flowlines))
  
  # Match gages to nearest COMID
  nearest_idx <- st_nearest_feature(gage_sf, flowlines)
  
  matched_comids <- flowlines$COMID[nearest_idx]
  match_distances <- st_distance(gage_sf, flowlines[nearest_idx, ], by_element = TRUE)
  match_distances <- as.numeric(match_distances)  # meters
  
  # Optionally filter by distance threshold
  if (!is.null(max_distance)) {
    matched_comids[match_distances > max_distance] <- NA
  }
  
  # Return matched table
  output <- gage_df %>%
    mutate(COMID = matched_comids,
           match_distance_m = round(match_distances, 2))
  
  return(output)
}


