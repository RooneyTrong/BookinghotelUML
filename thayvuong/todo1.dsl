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
                bookmanager = component "Booking Management" "Allows admin to view order information" "PHP"
                contactus = component "Contact Controller" "Allows customers to view the address" "PHP" 
            }
            spa = container "Single-Page Application" "Provides all Hotel reservation functionality via their browser" "PHP and Laravel"{
                home = component "Home Page" "Display the homepage of the website" "PHP and Laravel"
                book = component "Booking Controller" "Allows customers to book rooms by contacting them by phone number or email" "PHP and Laravel"
                ab = component "About Us Component" "Shows referral information and hotel address" "PHP and Laravel"
                collec = component "Collection Controller" "Show guests the hotel's achievements" "PHP and Laravel"
                conus = component "Contact Component" "Sends customer feedback by entering name, email, phone, message" "PHP and Laravel"
                in = component "Intro Component" "Shows the hotel's introduction video" "PHP and Laravel"
                type = component "Type Component" "Shows room information to customers" "PHP and Laravel"
                col = component "Colection Component" "Shows details of the hotel's titles and achievements" "PHP and Laravel"
            }
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
            database = container "Database" "Store customer information, booking date and time, room information,etc" "SQL Server"{
                tags "Database"
                custom = component "List Of Customers" "Stores customer information including name, phone, identity card" "SQL Server"
                his = component "List booking history" "Stores list of customer's booking history" "SQL Server"
                fedd = component "List feedback" "Stores customer feedback list" "SQL Server"
                duct = component "List Product" "Stores room list including room type, room rate" "SQL Server"
                valid = component "List Valid Rooms" "Stores list of rooms that are available, in use, in trouble" "SQL Server"
                emp = component "List Employee" "Stores employee list including employee information, job title" "SQL Server"
                payment = component "List Payment" "Stores list of customer invoice information" "SQL Server"
                reven = component "Revenue Statistics" "Statistical storage of all hotel revenue" "SQL Server"
                detai = component "Revenue Details" "Stores revenue details of each hotel by date month year" "SQL Server"
                info = component "List hotel information" "Stores all hotel information including address, phone, email, achievements" "SQL Server"
            }
        }
        author = softwareSystem "Authorized System" "Assign user rights with administrator"{
            authapi = container "Authorized Api" "Provides authentication and authorization functions via a JSON/HTTPS API" "PHP and Laravel"
            authdb = container "Database" "Stores the user information" "SQL Server"{
                tags "Database"
            }
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
            notidb = container "Notification Database" "Stores customer notifications"{
                tags "Database"
            }
        }
        manageSystem = person "Management"  "Store all hotel information about customer, room, booking date, etc"
    
        User -> hotelSystem "Request for booking"
        hotelSystem -> manageSystem "Send information"
        manageSystem -> hotelSystem "Reply information"
        hotelSystem -> notification "Send notification using"
        hotelSystem -> User "Comfirm detail"
        notification -> manageSystem "Sends report to"
        hotelSystem -> author "Sends request to the system"
        author -> hotelSystem "Reply"
        
        
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
        User -> contactus "Visits phuonganhhotel.com using" "Https"
        catalog -> central "Sends request"
        intro -> central "Sends request"
        contactus -> central "Sends request"
        central -> manager "Sends request"
        central -> spa "Delivers to the customer 's web browser"
        manager -> usermanager "Uses" "Https"
        manager -> promanager "Uses" "Https"
        manager -> employee "Uses" "Https"
        manager -> bookmanager "Uses" "Https"
        manager -> manageSystem "retrieves statistics from"
        central -> author "Sends request to the system"
        author -> central "Reply"

        hotelSystem -> authweb "Provides interface for users to log in"
        authweb -> authapi "Makes API calls to" "Json/Https" 
        authapi -> authdb "Reads from and writes to" "JDBC"
        
        server -> statis "Call api" "http + json"
        server -> notifi "Call api" "http + json"
        statis -> room "Uses" "Https"
        statis -> revenue "Uses" "Https"
        statis -> cus "Uses" "Https"

        webapp -> home "Delivers to the customer 's web browser"
        webapp -> book "Delivers to the customer 's web browser"
        webapp -> ab "Delivers to the customer 's web browser"
        webapp -> collec "Delivers to the customer 's web browser"
        webapp -> conus "Delivers to the customer 's web browser"
        home -> in "Uses" "Https"
        home -> type "Uses" "Https"
        collec -> col "Uses" "Https"
        in -> api "Makes API calls to" "Json/Https"
        type -> api "Makes API calls to" "Json/Https"
        col -> api "Makes API calls to" "Json/Https"
        book -> api "Makes API calls to" "Json/Https"
        conus -> api "Makes API calls to" "Json/Https"

        api -> custom "Reads from and writes to" "JDBC"
        api -> duct "Reads from and writes to" "JDBC"
        api -> emp "Reads from and writes to" "JDBC"
        api -> payment "Reads from and writes to" "JDBC"
        api -> reven "Reads from and writes to" "JDBC"
        api -> info "Reads from and writes to" "JDBC"
        custom -> his 
        custom -> fedd
        duct -> valid
        reven -> detai
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

        component spa "COMPONENT"{
            include *
        }

        component database "ComPonent"{
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

            element "Component" {
                background #85bbf0
                color #000000
            }
            
            element "Person" {
                shape person
                background #08427b
                color #ffffff
            }

            element "Database" {
                shape Cylinder
            }
        }
    }
}