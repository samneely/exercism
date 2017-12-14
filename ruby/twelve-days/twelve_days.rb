module Ordinality
  refine Numeric do
    ORDINALS = {
      1 => "first",
      2 => "second",
      3 => "third",
      4 => "fourth",
      5 => "fifth",
      6 => "sixth",
      7 => "seventh",
      8 => "eighth",
      9 => "ninth",
      10 => "tenth",
      11 => "eleventh",
      12 => "twelfth"
    }

    def to_ordinal
      ORDINALS.fetch(self) do
        raise ArgumentError, "No ordinal defined for #{self}"
      end
    end
  end
end

class TwelveDays
  using Ordinality

  def self.song
    1.upto(12).reduce("") { |song, day| song += verse_for(day) }
  end

  def self.verse_for(day)
    verse = "On the #{day.to_ordinal} day of Christmas my true love gave to me, #{gifts_for(day)}."
    if day == 12
      verse << "\n"
    else
      verse << "\n\n"
    end
  end

  def self.gifts_for(day)
    gifts = [
      "twelve Drummers Drumming",
      "eleven Pipers Piping",
      "ten Lords-a-Leaping",
      "nine Ladies Dancing",
      "eight Maids-a-Milking",
      "seven Swans-a-Swimming",
      "six Geese-a-Laying",
      "five Gold Rings",
      "four Calling Birds",
      "three French Hens",
      "two Turtle Doves"
    ].last(day - 1).join(", ")
    gifts << ", and " unless day == 1
    gifts << "a Partridge in a Pear Tree"
  end
end

module BookKeeping
  VERSION = 2
end
