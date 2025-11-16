from pathlib import Path

import pandas as pd
import json

input_path = Path("data_ingestion/input/aeroplane_model.json")
output_path = Path("data_ingestion/output/aeroplane_model.csv")



with open(input_path, "r") as json_file:
    data = json.load(json_file)


rows = []
for manufacturer, models in data.items():
    for model, specs in models.items():
        row = {"manufacturer": manufacturer, "model": model}
        row.update(specs)
        rows.append(row)


df = pd.DataFrame(rows)

df.to_csv(output_path, index=False)
