require_relative "scraper.rb"

class Hiking::CLI

attr_accessor :scrape, :input
attr_reader :state, :trails

  def call
    puts "--------------------------------"
    puts "Find Hiking Trails in Your State"
    puts "--------------------------------"
    puts "                                                                   "
    puts "Take a look at the list below to find the number for your selection"
    puts "                                                                   "
    puts "To exit, type '000' and press the return key"
    puts "                                                                   "

    scrape_states
    list_states
    menu
  end

  def menu
    @input = input
    input = nil
    while input != 000
      puts "                                                                   "
      puts "What state would you like to hike in?"
      puts "Enter the state number and press the return key,"
      puts "or type '000' and press the return key to quit the program:"
      puts "                                                                   "
      input = gets.chomp.to_i
      case input
      when 1..51
      state_info(input)
      scrape_trails(input)
      sub_menu
      when 000
      goodbye
      else
      puts "                                                                   "
      puts "Your entry wasn't valid. Please try again."
      puts "                                                                   "
      end
    end
  end

  def goodbye
    puts "                                                                   "
    puts "Enjoy your hike!"
    puts "                                                                   "
  end

  def scrape_states
    @scrape = Hiking::Scraper.scrape
  end

  def list_states
    @state = Hiking::State.list_states
    @state.each do |k,v|
      puts "#{k} - #{v}"
    end
  end

  def state_info(input)
    puts "                                                                   "
    @state = Hiking::State.list_hikes_and_trails(input)
    puts "                                                                   "
  end

  def scrape_trails(input)
    @trails = Hiking::Scraper.scrape_trails(input)
  end

  def list_trails
    puts "                                                                   "
    @trails = Hiking::Trails.list_trails
    puts "Featured Trails"
    puts "                                                                   "
    @trails.each do |trail|
      puts "#{trail}"
      puts "                                                                   "
    end
  end

  def sub_menu
    puts "                                                                   "
    puts "Would you like more information about hiking trails in this state?"
    puts "Enter 1 to see a list of featured trails, or 2 to return to the main menu"
    puts "                                                                   "
    response = gets.chomp.to_i
    case response
    when 1
      list_trails
    when 2
      list_states
    else
      puts "                                                                   "
      puts "Your entry wasn't valid. Please try again."
      puts "                                                                   "
      end
    end
end
