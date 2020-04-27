#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

dataStr <- function(package="datasets", ...)
{
    d <- data(package=package, envir=new.env(), ...)$results[,"Item"]
    d <- sapply(strsplit(d, split=" ", fixed=TRUE), "[", 1)
    d <- d[order(tolower(d))]
    d
}


# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Dataset Explorer"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
        selectInput("dataset", "Dataset:", 
                    choices=dataStr()),
        helpText("Please select in the list above, the dataset "),
        hr(),
        numericInput("nbRows", "Number of rows to view:", 10),
        helpText("Please select in the list above, the nb. of rows to display in  the 'Data' tab")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      
        tabsetPanel(
            tabPanel("Description", verbatimTextOutput("description")),
            tabPanel("Structure", verbatimTextOutput("structure")),
            tabPanel("Data", tableOutput("view")),
            tabPanel("Summary", verbatimTextOutput("summary"))
        ),
        
        helpText("Please click on the tab headers 'Description','Structure', 'Data', 'Summmary', to display the related infos")
    )
  )
))
