class Raindrops
  require 'prime'

  @raindrop_sounds = { 3 => "Pling", 5 => "Plang", 7 => "Plong" }

  def self.convert(number)
    sound = self.get_raindrop_sound(number)
    sound.empty?? number.to_s : sound
  end

  private

  def self.get_raindrop_sound(number)
    Prime.prime_division(number)
         .map(&:first)
         .map { |factor| @raindrop_sounds[factor] }
         .join
  end

end
