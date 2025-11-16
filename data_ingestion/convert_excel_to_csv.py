from pathlib import Path
import pandas as pd


input_path = Path("data_ingestion/input/Air Boltic data.xlsx")

excel_data = pd.ExcelFile(input_path)


for sheet in excel_data.sheet_names:
    output_path = Path(f"data_ingestion/output/{sheet}.csv")
    df = pd.read_excel(
        excel_data, 
        sheet_name=sheet, 
        engine="openpyxl"
        )
    df.to_csv(output_path, index=False)