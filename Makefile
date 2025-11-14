run-dashboard:
	@shiny run --reload --launch-browser python/scripts/dashboard.py

run-main:
	@uv run python/scripts/main.py

activate:
	@.venv\Scripts\activate.bat