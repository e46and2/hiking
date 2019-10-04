class Hiking::Trails

attr_accessor :trail_name, :distance
attr_reader :state


@@all = []

def initialize(trail_name=nil, distance=nil)
  @trail_name = trail_name
  @distance = distance
  @@all << self
end

def self.all
  @@all
end

# def self.list_trails
#   trail_list = []
#   @@all.each do |list|
#     trail_list << list.trail_name
#   end
# trail_list.reject!(&:empty?)
# end
#
# end

def self.list_trails
list_trails = {}
  @@all.each do |list|
    list_trails[list.trail_name] = list.distance
  end
list_trails
end
 
end
