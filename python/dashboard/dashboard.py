import plotly.express as px
from shiny.express import input, ui
from container import restrict_width




with restrict_width(sm=10, md=10, lg=8):
    #ui.page_opts(title = "Superstore Sales Data ", fillable = True)
    ui.h1(
        "Superstore Sales Data Dashboard",
        class_="text-lg-center text-left",
    )

