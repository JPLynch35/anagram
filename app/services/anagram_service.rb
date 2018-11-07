class AnagramService
  def initialize(word, limit=nil)
    @word = word
    @limit = limit
  end

  def retrieve_anagrams
    if limit
      sort_anagrams.take(limit.to_i)
    else
      sort_anagrams
    end
  end

  private
  attr_reader :word, :limit

  def sort_anagrams
    remove_self.sort_by(&:spelling)
  end

  def remove_self
    if retrieve_all_anagrams.present?
      retrieve_all_anagrams.words.reject { |word_object| word_object.spelling == word }
    else
      []
    end
  end

  def retrieve_all_anagrams
    @anagram ||= Anagram.includes(:words).find_by_sorted_spelling(sorted_letters)
  end

  def sorted_letters
    word.chars.sort.join
  end
end
