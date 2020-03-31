class Building
  attr_reader :units
  def initialize
    @units = []
  end

  def add_unit(unit_number)
    @units << unit_number
  end

  def add_renter(renter_name)
    @units << apartment.renter_name
  end
end
