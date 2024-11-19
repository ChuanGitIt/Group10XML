declare function local:all_reports() {
    for $booking in doc("Booking.xml")/Booking/BookingEntry
    let $bookingID := $booking/@bookingID
    let $customerID := $booking/CustomerID
    let $customer := doc("Customer.xml")/customer/Driver[@CustomerID = $customerID]
    let $reports := doc("Report.xml")/Report/reports[@bookingID = $bookingID]
    where $booking/CustomerID = $customer/@CustomerID
    return
        concat(
            "Booking ID: ", $bookingID, "&#xA;",
            "     Customer Name: ", 
            string-join(($customer/customer.name/firstname, $customer/customer.name/surname), " "), "&#xA;",
            "     Booking Details: Start Time: ", $booking/startTime/text(),
            ", End Time: ", $booking/endTime/text(), ",", "&#xA;",
            "     Cost: ", $booking/cost/text(), ",", "&#xA;",
            "     Status: ", $booking/status/text(), "&#xA;",
            "     Reports relating to Booking/Customer: &#xA;",
            if (exists($reports/*)) then
                string-join(
                    for $report in $reports/*
                    let $reportID := $report/@reportID
                    let $reportType := $report/reports.ReportType
                    let $reportDate := $report/reports.ReportDate
                    let $description := $report/reports.Details/Description
                    let $status := $report/reports.Details/@status
                    return concat(
                        "      ", $reportID, " ", $reportType, " ", $reportDate, ". ", 
                        $description, " (Status: ", $status, ")", "&#xA;"
                    ),
                    ""
                )
            else
                "       Non-Available&#xA;",
            "&#xA;",
            "&#xA;"
        )
};

<all>
    {local:all_reports()}
</all>
