class Building
  attr_accessor :building_name, :building_address, :apartments

  def initialize(name, address)
    @apartments = []
    @building_name = name
    @building_address = address
  end

  def view_apartments
    apartments.each do |apartment|
      puts "Number #{apartment.number}, #{apartment.renter.name}"
    end
  end


end
