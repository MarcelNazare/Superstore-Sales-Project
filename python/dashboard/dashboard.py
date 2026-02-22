import plotly.express as px
from shiny.express import input, ui
from shinywidgets import render_plotly



with restrict_width(sm=10, md=10, lg=8):
    ui.h1(
        "How Does Regularization Strength Affect Coefficient Estimates?",
        class_="text-lg-center text-left",
    )
ui.page_opts(title = "Superstore Sales Data ", fillable = True)
