-- Loading raw dataset csv files from data/raw to defined table schemas
-- Using COPY commant
-- unsing postgresql

\copy subscribers FROM 'C:/Users/KISHORE/OneDrive/Pictures/Documents/internmo/StreamFlix-Content-Analytics/data/raw/subscribers.csv' WITH(FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', ESCAPE '"')

\copy titles FROM 'C:/Users/KISHORE/OneDrive/Pictures/Documents/internmo/StreamFlix-Content-Analytics/data/raw/titles.csv' WITH(FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', ESCAPE '"')

\copy watch_history FROM 'C:/Users/KISHORE/OneDrive/Pictures/Documents/internmo/StreamFlix-Content-Analytics/data/raw/watch_history.csv' WITH(FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', ESCAPE '"')

\copy ratings FROM 'C:/Users/KISHORE/OneDrive/Pictures/Documents/internmo/StreamFlix-Content-Analytics/data/raw/ratings.csv' WITH(FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', ESCAPE '"')

\copy reviews FROM 'C:/Users/KISHORE/OneDrive/Pictures/Documents/internmo/StreamFlix-Content-Analytics/data/raw/reviews.csv' WITH(FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', ESCAPE '"')

\copy watchlist FROM 'C:/Users/KISHORE/OneDrive/Pictures/Documents/internmo/StreamFlix-Content-Analytics/data/raw/watchlist.csv' WITH(FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', ESCAPE '"')