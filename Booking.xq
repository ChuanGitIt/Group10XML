declare function local:getAllBookings() {
    for $booking in doc("Bookings.xml")/Booking/BookingEntry
    return $booking
};

declare function local:getAllBookingIDs() {
    for $booking in doc("Bookings.xml")/Booking/BookingEntry
    return $booking/@bookingID
};

declare function local:getConfirmedBookings() {
    for $booking in doc("Bookings.xml")/Booking/BookingEntry
    where $booking/status = "Confirmed"
    return $booking
};

(: 
local:getAllBookings()
local:getAllBookingIDs()
local:getConfirmedBookings()
:)
