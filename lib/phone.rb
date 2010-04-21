class Phone
  attr_reader :country_code, :area_code, :number
  
  def initialize(contry_code, area_code, number)
    @contry_code, @area_code, @number = contry_code, area_code, number
  end
  
  def ==(value)
    @contry_code == value.contry_code && @area_code == value.area_code && @number == value.number
  end
  
  def to_s
    @number ? "+ #{@country_code} #{@area_code} #{@number}" : "n/a"
  end
end