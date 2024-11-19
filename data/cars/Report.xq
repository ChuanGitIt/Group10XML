declare function local:all_reports() {
    for $reportGroup in doc("Report.xml")/Report/reports
    let $bookingID := $reportGroup/@bookingID
    return 
        concat(
            "Booking ID: ", $bookingID, "&#xA;", (: Newline for booking group header :)
            string-join(
                for $report in $reportGroup/*
                let $reportID := $report/@reportID
                let $reportType := $report/reports.ReportType
                let $reportDate := $report/reports.ReportDate
                let $description := $report/reports.Details/Description
                return concat(
                    "  ", $reportID, " ", $reportType, " ", 
                    $reportDate, ". ", 
                    $description, "&#xA;" (: Newline for each report :)
                ),
                ""
            ),
            "&#xA;" (: Extra newline to separate booking groups :)
        )
};

<all>
    {local:all_reports()}
</all>
