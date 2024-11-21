(:for clause:)
declare function local:getAllBookings() {
    for $booking in doc("Booking.xml")/Booking/BookingEntry
    return $booking
};

declare function local:getAllBookingIDs() {
    for $booking in doc("Booking.xml")/Booking/BookingEntry 
    return $booking/bookingID
};

declare function local:getConfirmedBookings() {
    for $booking in doc("Booking.xml")/Booking/BookingEntry
    where $booking/status = "Confirmed"
    return $booking
};

<all>
{local:getAllBookings()}
{local:getAllBookingIDs()}
{local:getConfirmedBookings()}
</all>
