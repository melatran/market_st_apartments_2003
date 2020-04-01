class Building
  attr_reader :units, :renters

  def initialize
    @units = []
    # @renters = []
    # @rented_units = []
  end

  def add_unit(unit_number)
    @units << unit_number
  end

  def renters
    renters = @units.find_all do |unit|
      unit.renter != nil
    end
    renters.map do |unit|
      unit.renter.name
    end
  end

  def average_rent
    @units.sum {|unit| unit.monthly_rent.to_f} / @units.count
  end

  def rented_units
    rented_units_all = @units.find_all do |unit|
      unit.renter != nil
    end
    rented_units_all
  end

  def highest_rent
    rented_units.max_by do |unit|
      unit.monthly_rent
    end
  end

  def renter_with_highest_rent
    highest_rent.renter
  end
end
