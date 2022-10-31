workspace {
    model {
        User = person "Customer"  "An online booking customer"
        hotelSystem = softwareSystem "Hotel Reservation System"  "Allows customers to view customer information, reservation information and confirm details."{
             webapp = container "Web Application" "Delivers hotel infomation and the Hotel reservation single page application" "Java and Spring MVC"
            spa = container "Single-Page Application" "Provides all Hotel reservation functionality via their browser" "Javascript and ReactJs"
            api = container "Api Application" "Provides Hotel reservation functionality via a JSON/HTTPS API " "Java and Spring MVC"
            database = container "Database" "Store customer information, booking date and time, room information,etc" "SQL Server"
            mobile = container "Mobile App" "Provides a limited subset of the Hotel reservation functionality to customers via their mobile device" "React Native"
        }
        
        manageSystem = person "Management"  "Store all hotel information about customer, room, booking date, etc"
    
        User -> hotelSystem "request for booking"
        hotelSystem -> User "comfirm details"
        hotelSystem -> manageSystem "send information"
        manageSystem -> hotelSystem "reply information"
        
        
        User -> webapp "Visits Khachsanphuonganh.com using" "Https"
        User -> spa "View room information and make a reservation"
        User -> mobile "View room information and make a reservation"
        spa -> api "Makes API calls to" "Json/Https"
        api -> database "Reads from and writes to" "JDBC"
        webapp -> spa "Delivers to the customer 's web browser"
        mobile -> api "Makes API calls to" "Json/Https"
    }
    
    views {
        systemContext hotelSystem "SystemContext" {
            include *
            animation {
            hotelSystem
            User
            manageSystem
        }
        autolayout lr
        }
        
        container hotelSystem "Containers"{
            include *
            animation {
            webapp
            spa
            mobile
            api
            database
        }
        autoLayout
        }
        
        styles {
            element "Software System" {
                background #1168bd
                color #ffffff
            }
            
            element "Container" {
                background #438dd5
                color #ffffff
            }

            element "Mobile App" {
                shape MobileDeviceLandscape
            }
            
            element "Person" {
                shape person
                background #08427b
                color #ffffff
            }
            element "User" {
                background #08427b
            }
        }
    }
}