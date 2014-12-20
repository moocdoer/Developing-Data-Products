library(shiny)

shinyUI(fluidPage(#theme = 'united.css',
    
    titlePanel('The dangers of R Squared by the Anscombe Quartet'),
    
    sidebarLayout(
    
        # Sidebar with a slider input for number of bins
        sidebarPanel(
            
            # Radio buttons chooser
            radioButtons(
                inputId = 'dataset',
                label = 'Choose the dataset to view a scatterplot, summary of the model and diagnostic plots.\n\nDataset:',
                choices = c(
                    'Linear Relationship' = 1,
                    'Non Linear Relationship' = 2,
                    'Linear with Outlier' = 3,
                    'Linearity induced by Outlier' = 4
                )
            )
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            htmlOutput('text'),
            plotOutput('plot', width = 'auto', height = 'auto'),
            pre(textOutput('summary')),
            plotOutput('diag')
        )
    )
))
