class AnagramCreator
  include CounterCache
  include Sort
  
  def initialize(words)
    @words = words
  end

  def log_anagrams
    words.each do |word|
      anagram = retrieve_or_create_anagram(word)
      find_or_create_word(anagram, word)
      Rails.cache.write(sort_letters(word), sorted_letters_cache_number(word).to_i + 1)
    end
    
  end

  private
  attr_reader :words

  def retrieve_or_create_anagram(word)
    Rails.cache.fetch(sort_letters(word) + sorted_letters_cache_number(word)) do
      Anagram.includes(:words).find_or_create_by(sorted_spelling: sort_letters(word))
    end
  end

  def find_or_create_word(anagram, word)
    unless anagram.words && anagram.words.find_by_spelling(word)
      anagram.words.create(spelling: word)
      Rails.cache.write(sort_letters(word), sorted_letters_cache_number(word).to_i + 1)
    end
  end
end
