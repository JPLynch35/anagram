class AnagramCreator
  def initialize(word)
    @word = word
  end

  def log_anagram
    anagram_key = AnagramKey.find_or_create_by(sorted_spelling: sort_letters)
    anagram_key.words.create(spelling: word)
  end

  private
  attr_reader :word

  def sort_letters
    word.chars.sort.join
  end
end
