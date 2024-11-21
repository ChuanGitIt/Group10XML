(:for clause, let clause:)
declare function local:all_reports() {
    for $reportGroup in doc("Report.xml")/Report/reports
    let $bookingID := $reportGroup/@bookingID
    return 
        concat(
            "Booking ID: ", $bookingID, "&#xA;",
            string-join(
                for $report in $reportGroup/*
                let $reportID := $report/@reportID
                let $reportType := $report/reports.ReportType
                let $reportDate := $report/reports.ReportDate
                let $description := $report/reports.Details/Description
                return concat(
                    "  ", $reportID, " ", $reportType, " ", 
                    $reportDate, ". ", 
                    $description, "&#xA;"
                ),
                ""
            ),
            "&#xA;"
        )
};

<all>
    {local:all_reports()}
</all>
