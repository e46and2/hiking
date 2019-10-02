require_relative "scraper.rb"

class Hiking::CLI

attr_accessor :scrape
attr_reader :state

  def call
    puts "--------------------------------"
    puts "Find Hiking Trails in Your State"
    puts "--------------------------------"
    puts "Take a look at the list below to find the number for your selection"
    puts "                                                                   "
    #list_states
    #state_abbrv
    scrape_states
    list_states
    menu
  end

  def menu
    input = nil
    while input != "exit"
      puts "What state would you like to hike in? Enter the state number here:"
      input = gets.strip
      case input
      when "1"
      list_states
      when "Matches"
      state_abbrv
      when "exit"
      goodbye
      else
      puts "Your entry wasn't valid. Please try again."
      end
    end
  end

  def goodbye
    puts "Enjoy your hike!"
  end

  def scrape_states
    @scrape = Hiking::Scraper.scrape
  end

  def list_states
    @state = Hiking::State.list_states
    @state.each do |k,v|
      puts "#{k}. #{v}"
    end
  end

end
