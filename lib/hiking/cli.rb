require_relative "scraper.rb"

class Hiking::CLI

attr_accessor :scrape, :input
attr_reader :state

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
      input = gets.chomp.to_i
      case input
      when 1..51
      state_info(input)
      when 000
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
      puts "#{k} - #{v}"
    end
  end

  def state_info(input)
    puts "                                                                   "
    @state = Hiking::State.list_hikes_and_trails(input)
    puts "                                                                   "
    puts "Would you like more information about hiking trails in this state?"
    puts "Enter 1 for more information, or 2 to return to the main menu"
    response = gets.chomp.to_i
    case response
    when 1
      puts "Here is more information"
    when 2
      list_states
      menu
    else
      puts "Your entry wasn't valid. Please try again."
      end
    end


end
