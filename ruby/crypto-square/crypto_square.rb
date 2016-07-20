require 'pry'

class Crypto
  attr_reader :strange_characters

  def initialize(strange_characters)
    @strange_characters = strange_characters
  end

  def normalize_plaintext
    strange_characters.gsub(/\W/, '').downcase
  end

  def plaintext_segments
    plaintext_chars_sliced.map(&:join)
  end

  def ciphertext
    plaintext_chars_sliced.each do |char|
      (size - char.size).times { char << ' ' }
    end
      .transpose
      .join
      .gsub(' ', '')
  end

  def size
    rows_size
  end

  def rows_size
    sqrt.ceil
  end

  def plaintext_chars
    normalize_plaintext.chars
  end

  def plaintext_chars_sliced
    plaintext_chars.each_slice(rows_size).to_a
  end

  def sqrt
    Math.sqrt(normalize_plaintext.size)
  end
end
