class AnagramCreator
  def initialize(words)
    @words = words
  end

  def log_anagrams
    words.each do |word|
      anagram_key = AnagramKey.find_or_create_by(sorted_spelling: sort_letters(word))
      anagram_key.words.find_or_create_by(spelling: word)
    end
  end

  private
  attr_reader :words

  def sort_letters(word)
    word.chars.sort.join
  end
end
