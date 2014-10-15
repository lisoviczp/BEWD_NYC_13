class Person
  attr_accessor :name, :credit_score, :gender

  def initialize(renter_name, renter_credit_score, renter_gender)
    @name = renter_name
    @credit_score = renter_credit_score
    @gender = renter_gender
  end

end
