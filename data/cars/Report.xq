for $report in doc("car_report.xml")/reports/*
let $reportID := $report/@reportID,
    $reportDate := $report/reports.ReportDate,
    $reportType := $report/reports.ReportType,
    $status := $report/reports.Details/@status,
    $description := $report/reports.Details/Description,
    $customerID := $report/reports.Details/CustomerID,
    $bookingID := $report/reports.Details/BookingID,
    $carID := $report/reports.Details/CarID,
    $rating := if ($report/name() = "FeedbackReport") then $report/FeedbackReport.rating else (),
    $comment := if ($report/name() = "FeedbackReport") then $report/FeedbackReport.comment else (),
    $Amount := if ($report/name() = "PaymentReport") then $report/PaymentReport.Amount else(),
    $Method := if ($report/name() = "PaymentReport") then $report/PaymentReport.Method else(),
    $InvoiceID := if ($report/name() = "InvoiceReport") then $report/InvoiceReport.InvoiceID else(),
    $TotalAmount := if ($report/name() = "InvoiceReport") then $report/InvoiceReport.TotalAmount else(),
    $Message := if ($report/name() = "NotificationReport") then $report/NotificationReport.Message else(),
    $Target := if ($report/name() = "NotificationReport") then $report/NotificationReport.Target else()
    
return
    (
        if ($report/name() = "MaintenanceReport") then
            (
                "We have a maintenance report with details:",
                <MaintenanceReport>
                    <ReportID>{ $reportID }</ReportID>
                    <ReportDate>{ $reportDate/text() }</ReportDate>
                    <ReportType>{ $reportType/text() }</ReportType>
                    <Status>{ $status }</Status>
                    <Description>{ $description/text() }</Description>
                    <CustomerID>{ $customerID/text() }</CustomerID>
                    <BookingID>{ $bookingID/text() }</BookingID>
                    <CarID>{ $carID/text() }</CarID>
                </MaintenanceReport>
            )
        else if ($report/name() = "FeedbackReport") then
            (
                "We have a feedback report with details:",
                <FeedbackReport>
                    <ReportID>{ $reportID }</ReportID>
                    <ReportDate>{ $reportDate/text() }</ReportDate>
                    <ReportType>{ $reportType/text() }</ReportType>
                    <Status>{ $status }</Status>
                    <Description>{ $description/text() }</Description>
                    <CustomerID>{ $customerID/text() }</CustomerID>
                    <BookingID>{ $bookingID/text() }</BookingID>
                    <CarID>{ $carID/text() }</CarID>
                    <Rating>{ $rating/text() }</Rating>
                    <Comment>{ $comment/text() }</Comment>
                </FeedbackReport>
            )
        else if ($report/name() = "PaymentReport") then
            (
                "We have a Payment report with details:",
                <PaymentReport>
                    <ReportID>{ $reportID }</ReportID>
                    <ReportDate>{ $reportDate/text() }</ReportDate>
                    <ReportType>{ $reportType/text() }</ReportType>
                    <Status>{ $status }</Status>
                    <Description>{ $description/text() }</Description>
                    <CustomerID>{ $customerID/text() }</CustomerID>
                    <BookingID>{ $bookingID/text() }</BookingID>
                    <CarID>{ $carID/text() }</CarID>
                    <Amount>{ $Amount/text() }</Amount>
                    <Method>{ $Method/text() }</Method>
                </PaymentReport>
            )
            
          else if ($report/name() = "InvoiceReport") then
            (
                "We have a Invoice report with details:",
                <InvoiceReport>
                    <ReportID>{ $reportID }</ReportID>
                    <ReportDate>{ $reportDate/text() }</ReportDate>
                    <ReportType>{ $reportType/text() }</ReportType>
                    <Status>{ $status }</Status>
                    <Description>{ $description/text() }</Description>
                    <CustomerID>{ $customerID/text() }</CustomerID>
                    <BookingID>{ $bookingID/text() }</BookingID>
                    <CarID>{ $carID/text() }</CarID>
                    <InvoiceID>{ $InvoiceID/text() }</InvoiceID>
                    <TotalAmount>{ $TotalAmount/text() }</TotalAmount>
                </InvoiceReport>
            )
            
          else if ($report/name() = "NotificationReport") then
            (
                "We have a Notification report with details:",
                <NotificationReport>
                    <ReportID>{ $reportID }</ReportID>
                    <ReportDate>{ $reportDate/text() }</ReportDate>
                    <ReportType>{ $reportType/text() }</ReportType>
                    <Status>{ $status }</Status>
                    <Description>{ $description/text() }</Description>
                    <CustomerID>{ $customerID/text() }</CustomerID>
                    <BookingID>{ $bookingID/text() }</BookingID>
                    <CarID>{ $carID/text() }</CarID>
                    <Message>{ $InvoiceID/text() }</Message>
                    <Target>{ $TotalAmount/text() }</Target>
                </NotificationReport>
            )

    )
