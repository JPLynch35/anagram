class AnagramService
  include Sort

  def initialize(word)
    @word = word
  end

  def create_anagram_and_word
    anagram = Anagram.find_or_create_by(sorted_spelling: sort_letters(word))
    anagram.words.find_or_create_by(spelling: word)
  end

  def retrieve_anagram_words
    sort_by_spellings.pluck(:spelling)
  end

  private
  attr_reader :word

  def sort_by_spellings
    if search_database.nil?
      []
    else
      search_database.words.sort_by(&:spelling)
    end
  end

  def search_database
    @anagrams ||= Anagram.includes(:words).find_by_sorted_spelling(sort_letters(word))
  end
end
