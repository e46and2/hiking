class CLI

attr_reader :states, :state_list, :state_card

  def call
    puts "Find Hiking Trails in Your State"
    #list_states
    #state_abbrv
    #Hiking::Scraper.scrape
    menu
  end

  def menu
    input = nil
    while input != "exit"
      puts "What state do you want to hike in? Enter the number:"
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

  def list_states
    @state_card = Scraper.all.states
    #puts state_list
  end

def state_abbrv
 puts "AL"
end

end
