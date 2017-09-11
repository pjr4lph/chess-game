# PHASE 2
def convert_to_int(str)
  begin
    Integer(str)
  rescue ArgumentError
    nil
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]
class CoffeeError < StandardError
end

class NotFruitError < StandardError
end

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise CoffeeError
  else
    raise NotFruitError
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  begin
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue CoffeeError
    puts "Please give me fruit only"
    retry
  rescue NotFruitError
    puts "You didn't give me coffee or fruit!!!"
  end
end

# PHASE 4
class TooSoon < StandardError
end

class NeedName < StandardError
end

class NeedFun < StandardError
end

class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    raise NeedName if @name.length < 1
    @yrs_known = yrs_known
    raise TooSoon if @yrs_known < 5
    @fav_pastime = fav_pastime
    raise NeedFun if @fav_pastime.length < 1
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known} years. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end
