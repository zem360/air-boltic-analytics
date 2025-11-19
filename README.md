# Air Boltics Data Model Implementation

> The repo implements the data model designed for Air Boltic. [Data Model](WriteUp.md)

## How to run the project?

### Step 1: Clone the Repository

Start by cloning the project repository to your local machine:

```bash
git clone https://github.com/zem360/air-boltic-analytics.git

```

### Step 2: Set Up Python Virtual Environment

Create and activate a virtual environment to isolate project dependencies:

```bash
# Create virtual environment
python -m venv .venv

# Activate virtual environment
# On macOS/Linux:
source .venv/bin/activate
# On Windows:
.venv\Scripts\activate
```

### Step 3: Install Dependencies

Install the required Python packages and dbt dependencies:

```bash
# Install Python requirements
pip install -r requirements.txt

# Install dbt dependencies
dbt deps
```

### Step 4: Verify Configuration

Since this project uses DuckDB and includes the profile configuration in the repository, you can verify everything is set up correctly:

```bash
# Test database connection (should work out of the box)
dbt debug
```

DuckDB will automatically create a local database file when you run your first dbt command - no additional configuration needed!

### Step 5: Load Seed Data

Load your CSV files into the database using dbt seeds:

```bash
# Load seed data
dbt seed

# Verify seed data was loaded correctly
dbt seed --show
```

### Step 6: Run Models and Tests

Execute the dbt models:

```bash
# Run all models
dbt run --select staging
dbt run --select marts

```

### Step 7: Show Tables

Use the helper scripts to show all tables in marts.

```bash
python helper_functions/duck_show_models.py

```
