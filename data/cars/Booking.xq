let $allBookings := doc("Booking.xml")//BookingEntry
return
<Results>
    <AllBookings>
        {
            for $entry in $allBookings
            let $details := fn:string-join((
                "Booking ID:", $entry/@bookingID,
                "User ID:", $entry/userID,
                "Cost:", $entry/cost,
                "Status:", $entry/status
            ), " ")
            return <Booking>{$details}</Booking>
        }
    </AllBookings>
    
    <FilteredBookings>
        {
            for $entry in $allBookings
            let $cost := xs:decimal($entry/cost)
            let $status := $entry/status
            where $cost < 150 and $status = "Completed"
            let $details := fn:string-join((
                "Booking ID:", $entry/@bookingID,
                "User ID:", $entry/userID,
                "Cost:", $entry/cost,
                "Status:", $entry/status
            ), " ")
            return <Booking>{$details}</Booking>
        }
    </FilteredBookings>
</Results>
