class Building
  attr_reader :units, :rented_units, :renters

  def initialize
    @units = []
    @renters = []
    @rented_units = []
  end

  def add_unit(unit_number)
    @units << unit_number
  end

  def add_renter(renter)
    @renters << renter
  end

  def average_rent (payment)
    @units.select do |unit|
      unit.rent == payment
    end
    @monthly_rent.to_f/2
  end

  def rent_units
    @rented_units << renters
  end
end
