run-dashboard:
	@shiny run --reload --launch-browser python/dashboard/dashboard.py

run-main:
	@uv run python/scripts/main.py

activate:
	@.venv\Scripts\activate.bat

data2db:
	@uv run python/scripts/load_to_postgres.py

data2csv:
	@uv run python/scripts/data_to_csv.py

freeze:
	@pip freeze > requirements.txt