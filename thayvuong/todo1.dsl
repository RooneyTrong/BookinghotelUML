workspace {
    model {
        User = person "Customer"  "Customer's name"
        hotelSystem = softwareSystem "He thong quan ly khach san"  "Quan ly cac dich vu cua khach hang"
        manageSystem = softwareSystem "Ban quan ly"  "Quan ly thong tin khach san"
        notiSystem = softwareSystem "Thong bao"  "Tra loi yeu cau khach hang va thanh toan"
    
        User -> hotelSystem "book"
        hotelSystem -> manageSystem "request"
        hotelSystem -> notiSystem "inform"
        notiSystem -> User "reply"
    }
    
    views {
        systemContext hotelSystem "HotelABC" {
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