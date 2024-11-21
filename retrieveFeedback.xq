for $booking in doc("Booking.xml")/Booking/BookingEntry,
    $car in doc("cars.xml")//ClassicCar | doc("cars.xml")//ECar,
    $FeedbackReport in doc("Report.xml")//FeedbackReport,
    $payment in doc("Payment.xml")//Payment
  where $booking/carID = $car/@carID
  and $booking/bookingID = $payment/bookingID
  and $FeedbackReport/reports.Details/CustomerID = $booking/CustomerID
  and $FeedbackReport/reports.Details/CarID = $booking/carID
return
<result>
  {concat("User ID: ", string($booking/CustomerID), 
          " Cost: ", string($payment/cost), 
          " euros. ")}
  {concat("Car License Plate: ", string($car/car.licensePlate))}
  {concat("Feedback: ", 
          string($FeedbackReport/Rating), 
          ", ", 
          string($FeedbackReport/Comment))}
</result>
