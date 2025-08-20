
**🗽 NYC Taxi Analytics with dbt + DuckDB**

This project demonstrates how to build an end-to-end analytics pipeline using dbt
 and DuckDB
, powered by the open NYC Yellow Taxi dataset.
It is designed as a hands-on learning project and can be run locally, free of cost.

**📂 Project Structure**
```
nyc_taxi_dbt/
├── models/
│   ├── staging/          # Raw taxi trip data cleaned & standardized
│   ├── intermediate/     # Business logic applied (durations, enriched data)
│   ├── marts/            # Final fact & dimension tables for analytics
│   └── schema.yml        # Tests & documentation for models
├── seeds/                # CSV seed files (reference data like taxi zones)
├── snapshots/            # Example snapshot for slowly changing data
├── target/               # Compiled dbt models (auto-generated)
├── nyc_taxi.duckdb       # Local DuckDB database file
├── dbt_project.yml       # Main dbt project config
└── README.md             # Project documentation (this file!)
```

⚙️ Setup Instructions
1. Clone the Repo
```
git clone https://github.com/<your-username>/nyc_taxi_dbt.git
cd nyc_taxi_dbt
```

2. Create a Virtual Environment
```
python3 -m venv .venv
source .venv/bin/activate
```

3. Install Dependencies
```
pip install dbt-duckdb duckdb
```

4. Load Seed Data
```
dbt seed
```

5. Run Models
```
dbt run
```

6. Test Data Quality
```
dbt test
```

7. Explore with Docs
```
dbt docs serve
```


👉 Open http://localhost:8080
 in your browser to view lineage graphs and documentation.

**📊 What This Project Does**

1. Staging models

        - Load raw taxi trip data
        - Standardize column names & data types

2. Intermediate models

        - Calculate trip durations
        - Enrich trips with extra features
        - Handle data cleaning (remove invalid rows)

3. Mart models

        - fct_trips: fact table of taxi trips
        - Ready for BI / analytics (look at revenue, distances, etc.)

4. Data Quality Tests (via dbt-expectations)

        - Ensure values are within realistic ranges (e.g., no negative trip distance)
        - Validate distributions (total amount, passenger counts, etc.)

**✅ Achievements So Far**

- Set up dbt + DuckDB locally (no cloud, free).
- Built a working data pipeline with staging → intermediate → marts.
- Added tests to ensure clean & reliable data.
- Verified results by querying DuckDB.
- Generated interactive docs to show lineage & model dependencies.

**🚀 Next Steps (Advanced Features)**

- Add unit tests for transformations.
- Implement snapshots for tracking slowly changing dimensions.
- Introduce macros to avoid repetitive SQL.
- Connect a BI tool (e.g., Metabase, Superset) to nyc_taxi.duckdb.

**📝 Notes**

All data is stored locally in the nyc_taxi.duckdb file.
No external warehouse or paid service is required.
Inspired by dbt best practices and open datasets.

✨ This project is great for learning dbt fundamentals and showcasing data engineering skills on a real-world dataset.
