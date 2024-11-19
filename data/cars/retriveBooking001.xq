for $booking in doc("Booking.xml")/Booking/BookingEntry,
$car in doc("cars.xml")//ClassicCar | doc("cars.xml")//ECar
where $booking/carID = $car/@carID
return
<booking>
  {concat("Customer ID :",string($booking/CustomerID)," Cost:",string($booking/cost)," ")}
  
  {concat(string($car/car.model)," ",string($car/car.pricePerDay),"euros/day",string($car/car.location))}
  {$booking/status}
</booking>
