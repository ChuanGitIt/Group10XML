declare function local:all_payments()
{
for $j in doc("Payment.xml")/Payments
return 
  <Payment>
      {string($j/Payment.paymentID)}
      {concat(string($j/Payment.cost),string($j/Payment.bookingID), " Euros")}
  </Payment>
};

declare function local:Payments_Over_30()
{
for $Payment in doc("Payment.xml")
where $Payment/Payment.cost > 30.00
return 
<Payment>
    {string($Payment/Payment.paymentID)}
    {concat(string($Payment/Payment.cost), " Euros")}
    {concat("Paid via ", string($Payment/Payment.cost))}
</Payment>
};

<all>
{local:all_payments()}
{local:Payments_Over_30()}
</all>
