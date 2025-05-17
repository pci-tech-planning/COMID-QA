Hydro-Climatic Data Network (HCDN-2009) – Reference Gage Metadata

Source:
  U.S. Geological Survey – Office of Surface Water
  https://water.usgs.gov/osw/hcdn-2009/

Description:
  This dataset includes metadata for reference stream gaging stations across the United States that are part of the Hydro-Climatic Data Network 2009 (HCDN-2009).
  The HCDN was developed to provide streamflow records minimally affected by human activities, suitable for hydrologic and climate variability studies.

Folder Contents:
  - data/: Raw Excel file with gage metadata
  - scripts/: Data retrieval code using `dataRetrieval`
  - source/: One-time cleaning function for standardizing and filtering HCDN records
  - metadata/: Data dictionary and citation

Download Method:
  Manual download from USGS HCDN-2009 website as of [INSERT DATE].
  Planned automation via RSelenium.

Usage Notes:
  - Column names have been standardized using `janitor::clean_names()`
  - Latitude and longitude are used to assign NWM COMIDs via `nhdplusTools::discover_nhdplus_id()`
  - Oregon subset used for TAP evaluation is stored in `2_analytical-engine/COMID-QA/data/`

Contact:
Francisco Guerrero - francisco.j.guerrero@water.oregon.gov
