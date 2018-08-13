class Bottles
  def song
    verses(99, 0)
    end

  def verses(starting, ending)
    starting.downto(ending).collect { |i| verse(i) }.join("\n")
  end

  def verse(number)
    bottle_number = BottleNumber.for(number)
    next_bottle_number = BottleNumber.for(bottle_number.successor)

    "#{bottle_number} ".capitalize +
        "of beer on the wall, " \
    "#{bottle_number} of beer.\n" \
    "#{bottle_number.action}, " \
    "#{next_bottle_number} of beer on the wall.\n"
  end

  def container(number)
    BottleNumber.new(number).container
  end

  def quantity(number)
    BottleNumber.new(number).quantity
  end

  def pronoun(number)
    BottleNumber.new(number).pronoun
  end

  def action(number)
    BottleNumber.new(number).action
  end

  def successor(number)
    BottleNumber.new(number).successor
  end

  def bottle_number_for(number)
    case number
    when 0
      BottleNumber0
    when 1
      BottleNumber1
    else
      BottleNumber
    end.new(number)
  end

end

class BottleNumber
  attr_reader :number
  def initialize(number)
    @number = number
  end

  def to_s
    "#{quantity} #{container}"
  end

  def container
    "bottles"
  end

  def quantity
    number.to_s
  end

  def pronoun
    "one"
  end

  def action
    "Take #{pronoun} down and pass it around"
  end

  def successor
    number - 1
  end

  def self.for(number)
    case number
    when 0
      BottleNumber0
    when 1
      BottleNumber1
    else
      BottleNumber
    end.new(number)
  end

end


class BottleNumber0 < BottleNumber
  def quantity
    "no more"
  end

  def action
    "Go to the store and buy some more"
  end

  def successor
    99
  end
end

class BottleNumber1 < BottleNumber
  def container
    "bottle"
  end

  def pronoun
    "it"
  end

end