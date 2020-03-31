require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'
require './lib/apartment'
require './lib/building'

class BuildingTest < Minitest::Test

  def test_building_exists
    building = Building.new
    assert_instance_of Building, building
  end

  def test_it_has_empty_units
    building = Building.new
    building.units
    assert_equal [], building.units
  end

  def test_it_has_units
    building = Building.new
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    building.add_unit(unit1)
    building.add_unit(unit2)
    assert_equal [unit1, unit2], building.units
  end

  def test_is_has_renters
    building = Building.new
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    building.add_unit(unit1)
    building.add_unit(unit2)

    renter1 = Renter.new("Aurora")
    unit1.add_renter(renter1)
    assert_equal renter1, unit1.renter

    renter2 = Renter.new("Tim")
    unit2.add_renter(renter2)
    assert_equal renter2, unit2.renter

    assert_equal ["Aurora", "Tim"], building.renters
  end

    def test_it_has_average_renter
      building = Building.new
      unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
      unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
      building.add_unit(unit1)
      building.add_unit(unit2)

      renter1 = Renter.new("Aurora")
      unit1.add_renter(renter1)
      renter2 = Renter.new("Tim")
      unit2.add_renter(renter2)

      assert_equal 1099.5, building.average_rent
  end

  def test_it_has_rented_units
    building = Building.new
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    unit3 = Apartment.new({number: "C3", monthly_rent: 1150, bathrooms: 2, bedrooms: 2})
    unit4 = Apartment.new({number: "D4", monthly_rent: 1500, bathrooms: 2, bedrooms: 3})
    building.add_unit(unit1)
    building.add_unit(unit2)
    building.add_unit(unit3)

    assert_equal [], building.rented_units
  end

  def test_it_has_renter
    building = Building.new
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    unit3 = Apartment.new({number: "C3", monthly_rent: 1150, bathrooms: 2, bedrooms: 2})
    unit4 = Apartment.new({number: "D4", monthly_rent: 1500, bathrooms: 2, bedrooms: 3})
    building.add_unit(unit1)
    building.add_unit(unit2)
    building.add_unit(unit3)
    renter1 = Renter.new("Spencer")
    unit2.add_renter(renter1)

    assert_equal [unit2], building.rented_units
  end
end
