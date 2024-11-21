(:built-in, let clause, for clause:)
declare function local:all_formatted_names() {
    for $driver in doc("customer.xml")/customer/Driver
    let $firstnames := 
    if(fn:count($driver/customer.name/firstname) > 1) then
        fn:concat($driver/customer.name/firstname[1], " ", $driver/customer.name/firstname[2])
    else
        fn:concat($driver/customer.name/firstname[1])
    return 
    <FormattedDriverName>
    {fn:upper-case($driver/customer.name/surname)}, {$firstnames} 
    </FormattedDriverName>
};

declare function local:count_drivers() {
    let $driverCount := fn:count(doc("customer.xml")/customer/Driver)
    return 
    <DriverCount>
    {
        $driverCount
    }
    </DriverCount>
};

declare function local:driver_under_21() {
    for $driver in doc("customer.xml")/customer/Driver
    where $driver/customer.driverAge < 21.00
    return
    <Driver>
        <Name>
        {$driver/customer.name/surname}, {$driver/customer.name/firstname}
        </Name>
        <LicenseNumber>
        {
            $driver/customer.driversLicenseNumber
        }
        </LicenseNumber>
        <Phone>
        {
            $driver/customer.phone
        }
        </Phone>
        <Age>
        {
            $driver/customer.driverAge
        }
        </Age>
    </Driver>
};

<all>
{local:all_formatted_names()}
{local:count_drivers()}
{local:driver_under_21()}
</all>