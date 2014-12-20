library(shiny)

shinyServer(function(input, output) {
    
    model_data = reactive({
        # Get the relevant columns
        x = anscombe[[paste0('x', input$dataset)]]
        y = anscombe[[paste0('y', input$dataset)]]
        
        # Fit a linear model
        m = lm(y ~ x)
        
        # Return the list
        list(
            x = x,
            y = y,
            m = m
        )
    })
    
    output$plot <- renderPlot({
        
        # Get the vars
        x = model_data()$x
        y = model_data()$y
        m = model_data()$m
        
        # Plot 'canvas'
        plot(
            0, type = 'n',
            xlim = c(0,20), ylim = c(0,20),
            xlab = 'x', ylab = 'y',
            asp = 1, frame.plot = F
        )
        
        # Draw the line
        abline(m, lty = 2, col = 'dodgerblue')
        
        # Plot the points
        points(x, y, pch = 19, col = 'dark grey')
        
    },
        width = 500,
        height = 500
    )
    
    output$summary <- renderPrint({
        summary(model_data()$m)
    })
    
    output$diag <- renderPlot({
        par(mfrow = c(2,2))
        plot(model_data()$m)
    },
        width = 500,
        height = 500
    )
    
    output$text <- renderText({
        includeHTML(paste0('www/text', input$dataset, '.html'))
    })
    
})
