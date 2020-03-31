class Apartment
  attr_reader :number, :monthly_rent, :bathrooms, :bedrooms, :renter

  def initialize(apartment)
    @number = apartment[:number]
    @monthly_rent = apartment[:monthly_rent]
    @bathrooms = apartment[:bathrooms]
    @bedrooms = apartment[:bedrooms]
    @renter = apartment[:renter]
  end

  def add_renter(renter)
    @renter = renter
  end
end
