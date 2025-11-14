# app.py
from shiny import App, render, ui

# Define the UI
app_ui = ui.page_fluid(
    ui.h1("Hello Shiny for Python!"),
    ui.input_slider("n", "Number of bins:", 1, 50, 25),
    ui.output_text("txt")
)

# Define the server logic
def server(input, output, session):
    @output
    @render.text
    def txt():
        return f"Slider value is: {input.n()}"

# Create the app object
app = App(app_ui, server)

