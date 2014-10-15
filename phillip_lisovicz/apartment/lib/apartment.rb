class Apartment
  attr_accessor :apartment_number, :apartment_square_feet, :apartment_bedrooms, :apartment_bathrooms, :renter, :rent

  def initialize(apartment_number, apartment_square_feet, apartment_bedrooms, apartment_bathrooms)
    @apartment_number = apartment_number
    @apartment_square_feet = apartment_square_feet
    @apartment_bedrooms = apartment_bedrooms
    @apartment_bathrooms = apartment_bathrooms
  end

  def number
    @apartment_number
  end


end
