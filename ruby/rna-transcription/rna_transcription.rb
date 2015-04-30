class Complement
  @dna_to_rna = {"G" => "C", "C" => "G", "A" => "U", "T" => "A"}
  @rna_to_dna = @dna_to_rna.invert

  def self.of_dna(dna_strand)
    raise ArgumentError if dna_strand.include?('U')
    self.transcribe(dna_strand, @dna_to_rna)
  end

  def self.of_rna(rna_strand)
    raise ArgumentError if rna_strand.include?('T')
    self.transcribe(rna_strand, @rna_to_dna)
  end

  private

  def self.transcribe(strand, strand_hash)
    strand.gsub!(/\S/) { |m| strand_hash[m] }
  end

end
