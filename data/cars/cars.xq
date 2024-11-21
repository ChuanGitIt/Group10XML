(:for clause, where clause:)
declare function local:all_cars()
{
 for $j in doc("cars.xml")//ClassicCar | doc("cars.xml")//ECar
return 
  <car>
      {string($j/car.model)}
      {concat(string($j/car.pricePerDay),string($j/car.location), "euros/day")}
  </car>
};

declare function local:cars_DublinCityCentre()
{
for $car in doc("cars.xml")//ClassicCar | doc("cars.xml")//ECar
where $car/car.location = " Dublin City Centre "
return 
<car>
    {concat(string($car/car.model),string($car/car.pricePerDay),"euros/day")}
</car>
};

declare function local:all_brands()
{
  for $brand in doc("cars.xml")//car.brand
  return $brand
};

(:
{local:all_cars()}
{local:all_brands()}
{local:cars_DublinCityCentre()}
:)

<all>
{local:cars_DublinCityCentre()}
</all>
