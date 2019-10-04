require_relative "scraper.rb"

class Hiking::CLI

attr_accessor :scrape, :input
attr_reader :state, :trails

  def call
    puts "                                                                   "
    puts "                --------------------------------                   "
    puts "                Featured Hiking Trails in the US                   "
    puts "                --------------------------------                   "
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
    #input = Integer(gets) rescue false

    while input != 000
      input = gets.chomp.to_i
      case input
      when 1..51
      state_info(input)
      puts "Your menu options are loading..."
      scrape_trails(input)
      state_sub_menu
      when 000
      goodbye
      else
      invalid_entry
      end
    end
  end

  def state_sub_menu
    puts "                                                                   "
    puts "Would you like more information about these featured trails?"
    puts "                                                                   "
    puts "Enter 1 for yes, or 2 to return to the main menu."
    puts "                                                                   "
    response = gets.chomp.to_i
    case response
    when 1
      list_trails
      trail_sub_menu
    when 2
      list_states
    else
      invalid_entry
      state_sub_menu
      end
    end

    def trail_sub_menu
      puts "                                                                   "
      puts "Have you found your next hike yet?"
      puts "If so, type 1 for yes, and press the return key TWICE"
      puts "to exit the program and start hiking!"
      puts "                                                                   "
      puts "If you'd like to continue searching for hikes in a different state,"
      puts "please press 2 to return to the main menu."
      puts "                                                                   "
      leave_or_stay = gets.chomp.to_i
      case leave_or_stay
      when 1
        #response = "000"
        #input = "000"
        #do nothing, return to menu loop
      when 2
        list_states
      else
        invalid_entry
        trail_sub_menu
        end
      end

      def state_list_sub_menu
        puts "                                                                   "
        puts "What state would you like to hike in?"
        puts "                                                                   "
        puts "Enter the state number and press the return key,"
        puts "or type '000' and press the return key to quit the program:"
        puts "                                                                   "
      end

  def scrape_states
    @scrape = Hiking::Scraper.scrape
  end

  def list_states
    puts "                                                                   "
    puts "List of US States (and DC)"
    puts "                                                                   "
    @state = Hiking::State.list_states
    @state.each do |k,v|
      puts "#{k} - #{v}"
    end
    state_list_sub_menu
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
    puts "                        Featured Trails                            "
    puts "                --------------------------------                   "
    puts "                                                                   "
    @trails = Hiking::Trails.list_trails.compact
    @trails.each do |k, v|
      puts "#{k} - #{v}miles"
      puts "                                                                   "
    end
  end

      def invalid_entry
        puts "                                                                   "
        puts "**       Your entry wasn't valid. Please try again.       **       "
        puts "                                                                   "
      end

      def goodbye
        puts "                                                                   "
        puts "Goodbye! Enjoy your hike!"
        puts "                                                                   "
      end
end
