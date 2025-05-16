# COMID-QA

**COMID-QA** is a reproducible codebase for harmonizing and validating the spatial correspondence between observed and modeled hydrologic datasets in Oregon. It supports the development of Technical Assistance Packages (TAPs) by ensuring accurate alignment of streamflow locations across three key systems:

---

## 🎯 Purpose

This project aligns:

1. **USGS HDCN Gaging Stations**  
   High-quality reference gages used as ground truth for hydrologic variability.

2. **National Water Model (NWM) COMIDs**  
   Unique stream segment identifiers used in NWM retrospective simulations.

3. **NHM-PRMS HRUs**  
   Hydrologic Response Units from the calibrated Precipitation-Runoff Modeling System, used in the National Hydrologic Modeling Infrastructure.

By linking these spatial representations, COMID-QA enables valid and transparent comparisons of observed streamflow with simulated data from NWM and NHM-PRMS.

---

## 🧭 Why It Matters

Streamflow comparisons across modeling systems require confidence that all sources refer to the **same hydrologic location**. Without careful COMID and HRU matching:
- Time series comparisons can be misleading
- Climate signal attribution becomes unreliable
- TAP recommendations risk being misaligned with reality

COMID-QA provides spatial QA/QC and diagnostic tools to prevent this.

---

## 📁 Repo Structure

```
COMID-QA/
├── data/                  ← Input files (e.g., lat/lon, gage IDs, HRU shapefiles)
├── R/                     ← Core matching + plotting functions
├── notebooks/             ← Quarto notebooks for validation and analysis
├── tests/                 ← Unit tests for COMID and HRU matching
├── .gitignore
└── README.md
```

---

## 🛠 Key Components

### `match_comid.R`
- Matches USGS gage coordinates to closest NWM COMIDs
- Flags mismatches or ambiguous assignments

### `match_hru.R`
- Matches gages or COMIDs to calibrated NHM-PRMS HRUs
- Supports shapefile or CSV input

### `validate_comid_map.R`
- Generates interactive or static maps of stream networks and matched locations
- Used for visual confirmation of alignment

---

## 📊 Streamflow Evaluation Workflows

Once COMIDs and HRUs are harmonized, streamflow comparisons will assess:
- Agreement in magnitude and variability
- Spectral structure (FFT)
- Mode decomposition (EMD)
- Long-term trends and bias (residual analysis)

---

## 🔜 Immediate Tasks

- [ ] Initialize repo and input folders
- [ ] Add HDCN gage sample data
- [ ] Build prototype `match_comid()` function
- [ ] Test visual validation for 1–2 gage locations

---

For questions or collaboration, contact Francisco Guerrero.
