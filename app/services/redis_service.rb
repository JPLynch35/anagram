class RedisService
  include Sort

  def initialize(word=nil)
    @word = word
  end

  def fetch_cache
    Rails.cache.fetch([sorted_word, cache_count]) do
      anagram_service.retrieve_anagram_words
    end
  end

  def bust_cache
    Rails.cache.write(sorted_word, cache_count + 1)
  end

  def clear_cache
    Rails.cache.clear
  end

  private
  attr_reader :word

  def sorted_word
    sort_letters(word)
  end

  def cache_count
    Rails.cache.read(sorted_word).to_i
  end

  def anagram_service
    AnagramService.new(word)
  end
end
