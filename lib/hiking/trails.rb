class Hiking::Trails

attr_accessor :trail_name
attr_reader :state


@@all = []

def initialize(trail_name=nil)
  @trail_name = trail_name
  @@all << self
end

def self.all
  @@all
end

def self.list_trails
  trail_list = []
  @@all.each do |list|
    trail_list<< list.trail_name
  end
trail_list
end

end
