class AnagramCreator
  def initialize(words)
    @words = words
  end

  def log_anagrams
    words.each do |word|
      anagram_service(word).create_anagram_and_word
      redis_service(word).bust_cache
    end
  end

  private
  attr_reader :words

  def anagram_service(word)
    AnagramService.new(word)
  end
  
  def redis_service(word)
    RedisService.new(word)
  end
end
