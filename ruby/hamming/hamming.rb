class Hamming

  def self.compute(dna_a, dna_b)
    strand_a = dna_a.chars
    strand_b = dna_b.chars
    strand_a
      .zip(strand_b)
      .count { |char1, char2| char1 != char2 }
  end

end