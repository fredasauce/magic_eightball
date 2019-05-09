require "pry"
require "colorize"

class Answers
  attr_accessor :ans

  def initialize(ans)
    @ans = ans
  end

end

class UserAnswers < Answers
end


class MagicEightball

  def initialize
    @og_answers = [
      Answers.new("It is certain"),
      Answers.new("As I see it, yes"),
      Answers.new("Don't count on it"),
      Answers.new("Most likely"),
      Answers.new("Ask again later"),
      Answers.new("Yes, definitely"),
      Answers.new("Outlook not so good"),
      Answers.new("No way in hell"),
      Answers.new("Yes"),
      Answers.new("Nope")
    ]
    @user_answers = []
    @all_answers = [@og_answers, @user_answers]
    @og_answers_clone = []
    
    greeting
    main_menu
  end


  def greeting
    puts "Welcome to the Magic Eightball!!"
    main_menu
  end

  def main_menu
    puts "1) Ask me a question"
    puts "2) Create your own answers"
    puts "3) View all answers"
    puts "4) Reset all answers"
    puts "5) Quit"
    choice = gets.to_i
    case choice
      when 1
        puts "Ask me a yes/no question:"
        q = gets.strip
        puts "Magic Eightball says: #{@all_answers.flatten.sample.ans}"
        main_menu
      when 2
        create_answers
        main_menu
      when 3
        @all_answers.flatten.each do |a|
        puts "#{a.ans}"
        end
        main_menu
      when 4
        puts "My answers were the best, huh?"
        @user_answers.clear
        main_menu
      when 5
        puts "Goodbye!"
        exit
      else
        puts "Invalid Entry. Try again."
        main_menu
    end
  end

  def create_answers
    print "New answer: "
    input = gets.strip
    @og_answers_clone = @og_answers.map do |x| x.ans end#.downcase or after .map (just need to sanitize the caps in the array and all of the user's input.)
    if @og_answers_clone.include?(input)
     
      # @og_answers.each do |o|
      #   o.include?(@input)
      # end
      puts "Answer already exists, try again."
      create_answers
   # elsif (@user_answers.include?(input))
      # @user_answers.each do |u|
      #   u.include?(@input)
      # end 
     # puts "Answer already exists, try again."
    #create_answers
    else
      @user_answers << UserAnswers.new(input)
    end
  end
    
end

MagicEightball.new