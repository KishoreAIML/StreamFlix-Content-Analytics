#importing required libraries
import os
import traceback
import logging
from dotenv import load_dotenv
from sqlalchemy import create_engine
from urllib.parse import quote_plus

load_dotenv()

logging.basicConfig(
    level = logging.INFO,
    format = "%(asctime)s - %(levelname)s - %(message)s"
)

#geting enviromental variables of database
logging.info("loading ENV variables...")
USERNAME = os.getenv("DB_USERNAME")
PASSWORD = os.getenv("DB_PASSWORD")
HOST = os.getenv("DB_HOST")
PORT = os.getenv("DB_PORT")
DB_NAME = os.getenv("DB_NAME")

if not USERNAME:
    raise ValueError("Missing DATABASE USERNAME in Enviromental Varialbes")
if not PASSWORD:
    raise ValueError("Missing DATABASE PASSWORD in Enviromental Varialbes")
if not HOST:
    raise ValueError("Missing DATABASE HOST in Enviromental Varialbes")
if not PORT:
    raise ValueError("Missing DATABASE PORT in Enviromental Varialbes")
if not DB_NAME:
    raise ValueError("Missing DATABASE DB_NAME in Enviromental Varialbes")

try:
    DM_PASSWORD = quote_plus(PASSWORD)
    DB_URL = f"postgresql://{USERNAME}:{DM_PASSWORD}@{HOST}:{PORT}/{DB_NAME}"
    logging.info("URL CREATED!!")
    logging.info("Creating DB Engine...")
    engine = create_engine(DB_URL)
    logging.info("Engine Created!!")
except OperationalError as e:
    logging.error("Database connection failed!!!")
    logging.error("Traceback:-")
    logging.error(traceback.format_exc())
    logging.error("error:", e)
except Exception as e:
    logging.error("Database connection failed!!!")
    logging.error("Traceback:-")
    logging.error(traceback.format_exc())
    logging.error("error:", e)





