require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'
require './lib/apartment'

class RenterTest < Minitest::Test
  def test_it_exists
    renter1 = Renter.new("Jessie")
    assert_instance_of Renter, renter1
  end

  def test_renter_has_name
    renter1 = Renter.new("Jessie")
    assert_equal "Jessie", renter1.name
  end

  def test_apartment_exists
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    
    assert_instance_of Apartment, unit1
  end
end
