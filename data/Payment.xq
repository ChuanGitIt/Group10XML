declare function local:all_payments()
{
for $j in doc("Payment.xml")
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
    {string($j/Payment.paymentID)}
    {concat(string($j/Payment.cost), " Euros")}
    {concat("Paid via ", string($j/Payment.cost))}
</Payment>
};

<all>
{local:all_Payments()}
{local:Payments_Over_30()}
</all>
