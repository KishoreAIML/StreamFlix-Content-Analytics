import os
import yaml
from pathlib import Path


ROOT_DIR = Path(__file__).resolve().parents[1]
print(ROOT_DIR)

with open(ROOT_DIR/"config.yaml", "r") as file:
    config = yaml.safe_load(file)

Database = config["Paths"]["Database"]
Cunnector = config["Files"]["Cunnector"]
Reports = config["Paths"]["Reports"]