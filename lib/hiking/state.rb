class Hiking::State

attr_accessor :state_name, :total_featured_hikes, :total_trails, :url, :number

  @@all = []

def initialize(number=nil, state_name=nil, total_featured_hikes=nil, total_trails=nil, url=nil)
  @number = number
  @state_name = state_name
  @total_featured_hikes = total_featured_hikes
  @total_trails = total_trails
  @url = url
  @@all << self
  @@all
end

def self.all
@@all
end

def self.list_states
list_states = {}
  @@all.each do |list|
    list_states[list.number] = list.state_name
  end
list_states
end

def self.list_hikes_and_trails

end


end
