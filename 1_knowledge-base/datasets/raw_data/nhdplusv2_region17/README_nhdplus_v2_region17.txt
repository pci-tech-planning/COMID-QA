📄 README: NHDPlusV2 Region 17 Flowlines

Dataset Title: NHDPlusV2 Region 17 - Pacific Northwest (Flowlines & Attributes)

Source: USGS National Hydrography Dataset Plus Version 2 (NHDPlusV2)

Region: VPU 17 (Pacific Northwest, includes Oregon)

Download URL: https://www.epa.gov/waterdata/nhdplus-national-data

Download Date: 2025-05-16

📁 Directory Structure

nhdplusv2_region17/
├── data/
│   ├── NHDFlowline.shp
│   ├── NHDFlowline.dbf
│   ├── NHDFlowline.shx
│   ├── ...
├── metadata/
│   ├── nhdplus_field_descriptions.txt
│   └── citation.txt
└── README.txt ← this file

📦 Contents Description

data/

Contains shapefiles and attribute tables associated with the flowline network for Region 17. This includes the primary spatial layer used to match lat/lon coordinates of stream gages to COMIDs.

NHDFlowline.shp: Polyline geometries of stream segments

NHDFlowline.dbf: Attributes for each segment (e.g., COMID, ReachCode, StreamLevel, LengthKm)

Optional enrichment:

PlusFlowlineVAA.dbf: May contain modeled flow and network structure attributes

metadata/

nhdplus_field_descriptions.txt: Dictionary of fields from the shapefile and relevant attribute tables

citation.txt: USGS-provided citation text (or generated manually)

🎯 Intended Use

This dataset is used to:

Match Hydro-Climatic Data Network (HCDN) gaging station coordinates to the nearest stream segment

Retrieve the corresponding COMID for integration with modeled streamflow datasets (e.g., NWM, PRMS)

Support spatial validation and QA of hydrologic modeling locations

🔍 Notes

Data is projected in [EPSG TBD] — confirm via sf::st_crs()

Flowlines do not include modeled streamflow estimates — these are added later via enrichment tables (e.g., enhd_nhdplusatts.csv or EROMExtension.dbf)

📚 Citation

U.S. Geological Survey (2016). National Hydrography Dataset Plus (NHDPlus) Version 2.1. Accessed from https://www.epa.gov/waterdata/nhdplus-national-data

📌 Maintained as part of the COMID-QA technical workflow

For questions, contact: Francisco J. Guerrero

🛠️ Last updated: [Insert date here]

Contact:
Francisco Guerrero - francisco.j.guerrero@water.oregon.gov
