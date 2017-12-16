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

module TwelveDaysVerseFactory
  refine Numeric do
    def to_twelve_days_verse
      begin
        Object.const_get("TwelveDaysVerse#{self}")
      rescue
        TwelveDaysVerse
      end.new(self)
    end
  end
end

class TwelveDaysVerse
  using Ordinality

  attr_reader :day

  def initialize(day)
    @day = day
  end

  def to_s
    verse << "\n\n"
  end

  protected

  def verse
    "On the #{day.to_ordinal} day of Christmas my true love gave to me, #{gifts_for(day)}."
  end

  def gifts_for(day)
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

class TwelveDaysVerse12 < TwelveDaysVerse
  def to_s
    verse << "\n"
  end
end

class TwelveDays
  using TwelveDaysVerseFactory

  def self.song
    1.upto(12).reduce("") { |song, day| song += day.to_twelve_days_verse.to_s }
  end
end

module BookKeeping
  VERSION = 2
end
