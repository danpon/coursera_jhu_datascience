#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(stringr)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
    
    # Return the requested dataset ----
    # Note that we use eventReactive() here, which depends on
    # input$update (the action button), so that the output is only
    # updated when the user clicks the button
    
    #datasetInput <- eventReactive(input$update, {
    #    get(input$dataset)
    #    }, ignoreNULL = FALSE)
    
    datasetInput <- reactive({
        datasetInput <- get(input$dataset)
    })

    
    # Generate the description of the dataset ----
    output$description <- renderPrint({
        indice <- which(data(package="datasets", envir=new.env())$results[,3]==input$dataset)
        str_remove(data(package="datasets", envir=new.env())$results[indice,4],"Title")
    })
        
    # Generate the structure of the dataset ----
    output$structure <- renderPrint({
        dataset <- datasetInput()
        str(dataset)
    })
    

    # Show the first "n" observations ----
    # The use of isolate() is necessary because we don't want the table
    # to update whenever input$obs changes (only when the user clicks
    # the action button)
    output$view <- renderTable({
        head(datasetInput(), n = input$nbRows)
    })
    
    # Generate a summary of the dataset ----
    output$summary <- renderPrint({
        dataset <- datasetInput()
        summary(dataset)
    })
  
})
