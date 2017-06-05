# These are global arrays that contain objects of their respective classes.
# Think of this as your database.

$markets
$properties
$weekly_reports

class WeeklyReport

  # belongs_to :property

  attr_accessor :property_id, :week_of_year, :beds_leased

  def initialize(property_id, week_of_year, beds_leased)

    @property_id = property_id
    @week_of_year = week_of_year
    @beds_leased = beds_leased

  end

  def property
    # TODO
  end

end

class Property

  # belongs_to :market
  # has_many :weekly_reports

  @@id = 0

  attr_accessor :id, :market_id, :name, :beds_total

  def initialize(name, market_id, beds_total)
    @id = @@id += 1
    @name = name
    @market_id = market_id
    @beds_total = beds_total
  end

  def weekly_reports
    # TODO
  end

  def beds_leased(week)
    # TODO
  end


end

class Market

  # has_many :properties

  attr_accessor :id, :name

  @@id = 0

  def initialize(name)
    @id = @@id += 1
    @name = name
  end

  def properties
    # TODO
  end

  def beds_leased(week)
    # TODO
  end

  def beds_total
    # TODO
  end

end


$m1 = Market.new('East Carolina University')
$m2 = Market.new('DePaul University')

$p1 = Property.new('33 East', $m1.id, 400)
$p2 = Property.new('58 West', $m1.id, 500)
$p3 = Property.new('1237 West', $m2.id, 300)

$markets = [$m1, $m2]
$properties = [$p1, $p2, $p3]
$weekly_reports = []

[$p1, $p2, $p3].each do |property|
  for i in 1..20
    $weekly_reports << WeeklyReport.new(property.id, i, i*2)
  end
end


puts "\n\n WEEKLY REPORT PROPERTY: ('33 East')\n\n----"
pp $weekly_reports.first.property
puts "----\n\n"

puts "\n\n PROPERTY WEEKLY REPORTS: (count = 20, property_id = 1)\n\n----"

weekly_reports = $p1.weekly_reports

if weekly_reports && weekly_reports.count > 0
  pp "COUNT: #{weekly_reports.count}"
  pp "PROPERTY_ID: #{weekly_reports.first.property_id}"
else
  pp "NO WEEKLY REPORTS"
end

puts "----\n\n"

puts "\n\n PROPERTY BEDS LEASED: (SHOULD EQ 110) \n\n----"
pp $p1.beds_leased(10)
puts "----\n\n"

puts "\n\n MARKET PROPERTIES: ('33 East' and '58 West')\n\n----"
pp $m1.properties
puts "----\n\n"

puts "\n\n MARKET BEDS TOTAL: (SHOULD BE EQ 900)\n\n----"
pp $m1.beds_total
puts "----\n\n"

puts "\n\n MARKET BEDS LEASED: (SHOULD BE EQ 220)\n\n----"
pp $m1.beds_leased(10)
puts "----\n\n"