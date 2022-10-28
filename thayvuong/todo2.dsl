workspace {

    model {
        u = person "User"
        s = softwareSystem "Internet Booking Software System" {
            webapp = container "Web Application"
            spa = container "Single-Page Application"
            api = container "Api Application"
            database = container "Database"
        }

        u -> webapp "Uses"
        u -> spa "View"
        webapp -> spa "Delivers to customers web browser"
        spa -> api "Makes api calls to"
        api -> database "Reads from and writes to"
    }

    views {
        container s {
            include *
            autoLayout 
        }
        styles {
            element "Software System" {
                background #1168bd
                color #ffffff
            }

            element "Person" {
                shape person
                background #08427b
                color #ffffff
            }
        }
    }
    
}
