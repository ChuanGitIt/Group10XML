(:built-in, for clause:)
declare function local:all_payments() {
    for $j in doc("Payment.xml")/Payments/Payment
    return 
    <Payment>
        {string($j/@paymentID), " "}
        {concat($j/cost, "€. Booking id:"), string ($j/bookingID), "
"}
    </Payment>
};

declare function local:Payments_Over_150() {
    for $Payment in doc("Payment.xml")/Payments/Payment
    where xs:decimal($Payment/cost) > 150.00
    return 
    <Payment>
        {string($Payment/@paymentID), " "}
        {fn:string-join(($Payment/cost, "€ "))}
        {fn:string-join(("Paid via ", $Payment/method)), "
"}
    </Payment>
};

<all>
{local:all_payments()}
{local:Payments_Over_150()}
</all>
