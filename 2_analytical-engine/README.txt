# 📊 README: 2\_analytical-engine

**Purpose:**
The `2_analytical-engine/` folder contains all scripts, reusable functions, and datasets used to process, transform, and analyze hydrologic and streamflow data for the COMID-QA project. This stage forms the core logic layer that connects raw data sources to reproducible outputs.

---

## 📁 Folder Structure

```
2_analytical-engine/
├── data/             # Processed inputs and outputs (e.g., matched COMIDs, daily flows)
├── notebooks/        # Quarto notebooks for exploration, mapping, and QA
├── scripts/          # Single-use scripts (e.g., USGS data downloader)
├── source/           # Reusable functions (e.g., match_comid)
├── tests/            # Lightweight test files to verify function behavior
├── COMID-QA.Rproj    # Project-level config
└── README.md         # This file
```

---

## 🧠 Key Components

### `source/match_comid.R`

Function to assign the nearest NHDPlus COMID to each input gaging station based on coordinates. Used for aligning observed and modeled streamflow data.

### `scripts/get_usgs_daily_flow_or.R`

Downloads daily discharge data for Oregon’s HCDN stations using `dataRetrieval`. Can be modified to handle other regions.

### `tests/test_match_comid.R`

Tests `match_comid()` with a small gage sample and verifies COMID assignment.

---

## 🔄 Workflow Overview

1. **Prepare** HCDN station list (filtered to Oregon)
2. **Match** to COMIDs using `match_comid()` and NHDPlusV2 shapefiles
3. **Download** daily flow using `dataRetrieval`
4. **Analyze or visualize** in notebooks

---

## 🔍 See Also

* Raw data sources live in `1_knowledge-base/datasets/raw_data/`
* Final products and visualizations move to `3_production_hub/` or `4_product_store/`

---

📌 Maintainer: Francisco J. Guerrero
🛠️ Last updated: \[Insert date here]
