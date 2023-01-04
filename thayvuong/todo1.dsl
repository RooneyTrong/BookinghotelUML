workspace {
    model {
        
        User = person "Customer"  "An online booking customer"
        hotelSystem = softwareSystem "Hotel Reservation System"  "Allows customers to view customer information, reservation information and confirm details."{
            webapp = container "Web Application" "Delivers hotel infomation and the Hotel reservation single page application" "PHP and Laravel"{
                manager = component "Dashboard Management" "Allows management to view customer information, hotel information" "PHP"
                catalog = component "Product Catalog" "Allows customers to view product catalog" "PHP"
                intro = component "Introduction Controller" "Allows customers to view referral information" "PHP"
                usermanager = component "User Management" "Allows management to view customer information" "PHP"
                promanager = component "Product Management" "Allows management to view hotel information" "PHP"
                central = component "Central Controller" "Central controller connected to services" "PHP"
                employee = component "Employee Management" "Allows admin to view and edit employee information" "PHP"
                bookmanager = component "Booking Management" "Allow admin to view order information" "PHP"
            }
            spa = container "Single-Page Application" "Provides all Hotel reservation functionality via their browser" "PHP and Laravel"
            api = container "Api Application" "Provides Hotel reservation functionality via a JSON/HTTPS API " "PHP and Laravel"{
                login = component "Login Controller" "Allows users to sign in to application" "Laravel,REST"
                about = component "About Controller" "Allow users to view hotel referral information" "Laravel, REST"
                request = component "Requests Controller" "Allow users to submit booking requests" "Laravel,REST"
                detail = component "Collection Controller" "Allows users to view the hotel's achievements" "Laravel,REST"
                contact = component "Contact Controller" "Allow customers to view the address and send feedback to the hotel" "Laravel,REST"
                product = component "Product Controller" "Allows users to view room types, room rates, services" "Laravel,REST"
                auth = component "Auth" "User authorization and authentication" "PHP"
                noti = component "Notification model" "Send notifications to customers" "PHP"
                ct = component "Contact model" "Allows to send feedback and view the address" "PHP"
                pro = component "Product model" "Show room information, price,..." "PHP"
            }
            database = container "Database" "Store customer information, booking date and time, room information,etc" "SQL Server"
        }
        author = softwareSystem "Authorized System" "Assign user rights with administrator"{
            authapi = container "Authorized Api" "Provides authentication and authorization functions via a JSON/HTTPS API" "PHP and Laravel"
            authdb = container "Database" "Stores the user information" "SQL Server"
            authweb = container "Web Appication" "Provide interface for user to login" "PHP"
        } 
        notification = softwareSystem "Notification System" "Send SMS to customers: successful booking, room problems, etc"{
            server = container "Mail Server" "Allows receiving and sending notifications" "PHP"
            notiapi = container "Notifications Api" "Public streaming interface to deliver push notifications to subcribers" "PHP and Laravel"{
                statis = component "Statistical Controller" "Provides statistical function" "Laravel"
                room = component "Room Statistics Component" "Provides room statistics function by date month year" "Laravel"
                revenue = component "Revenue Statistics Component" "Provides revenue statistics function by day month year" "Laravel"
                cus = component "Customer Statistics Component" "Provides customer statistics function by day month year"
                notifi = component "Notification Controller" "Provides notification function"
                contac = component "Contact Component" "Provides customer contact function" "Laravel"
                
            }
            notidb = container "Notification Database" "Stores customer notifications"
        }
        manageSystem = person "Management"  "Store all hotel information about customer, room, booking date, etc"
    
        User -> hotelSystem "Request for booking"
        hotelSystem -> manageSystem "Send information"
        manageSystem -> hotelSystem "Reply information"
        hotelSystem -> notification "Send notification using"
        hotelSystem -> User "Comfirm detail"
        notification -> manageSystem "Sends report to"
        
        
        User -> webapp "Visits phuonganhhotel.com using" "Https"
        User -> spa "View room information and make a reservation"
        spa -> api "Makes API calls to" "Json/Https"
        api -> database "Reads from and writes to" "JDBC"
        webapp -> spa "Delivers to the customer 's web browser"
        manageSystem -> webapp "retrieves statistics from"
        api -> notification "Sends SMS using"
        notification -> User "Sends notification to"


        spa -> login "Makes API calls to" "Json/Https"
        spa -> about "Makes API calls to" "Json/Https"
        spa -> request "Makes API calls to" "Json/Https"
        spa -> detail "Makes API calls to" "Json/Https"
        spa -> contact "Makes API calls to" "Json/Https"
        spa -> product "Makes API calls to" "Json/Https"
        login -> auth "Uses"
        request -> noti "Uses"
        contact -> ct "Uses"
        product -> pro "Uses"
        auth -> database "Reads from and writes to" "JDBC"
        ct -> database "Reads from and writes to" "JDBC"
        pro -> database "Reads from and writes to" "JDBC"
        about -> database "Reads from and writes to" "JDBC"
        detail -> database "Reads from and writes to" "JDBC"
        noti -> notification "Send SMS using"
        
        hotelSystem -> server "Send notification using"
        server -> User "Send notification to"
        server -> notiapi "Call api" "http + json"
        notiapi -> notidb "Reads from and writes to" "JDBC"
        notiapi -> manageSystem "Sends report to"
        
        
        User -> catalog "Visits phuonganhhotel.com using" "Https"
        User -> intro "Visits phuonganhhotel.com using" "Https"
        catalog -> central ""
        intro -> central ""
        central -> manager ""
        central -> spa "Delivers to the customer 's web browser"
        manager -> usermanager "Uses" "Https"
        manager -> promanager "Uses" "Https"
        manager -> employee "Uses" "Https"
        manager -> bookmanager "Uses" "Https"
        manager -> manageSystem "retrieves statistics from"

        hotelSystem -> author "Sends request to the system"
        author -> hotelSystem "Reply"

        hotelSystem -> authweb "Provides interface for users to log in"
        authweb -> authapi "Makes API calls to" "Json/Https" 
        authapi -> authdb "Reads from and writes to" "JDBC"
        
        server -> statis "Call api" "http + json"
        server -> notifi "Call api" "http + json"
        statis -> room "Uses" "Https"
        statis -> revenue "Uses" "Https"
        statis -> cus "Uses" "Https"
    }
    
    views {
        systemContext hotelSystem "SystemContext" {
            include *
            animation {
            hotelSystem
            User
            manageSystem
        }
        
        }
        
        container hotelSystem "Containers"{
            include *
            animation {
            webapp
            spa
            api
            database

        }
        
        }
        container notification "Container"{
            include *
        }

        container author "container"{
            include *
        }

        component api "Component"{
            include *
        }
        
        component webapp "Components"{
            include *
        }
        
        component notiapi "component"{
            include *
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

            element "Database" {
                shape Cylinder
            }
            element "Component" {
                background #85bbf0
                color #000000
            }
            
            element "Person" {
                shape person
                background #08427b
                color #ffffff
            }
        }
    }
}