class AnagramPresenter
  def initialize(word, limit=nil)
    @word = word
    @limit = limit
    @redis_service = RedisService.new(word)
    @collection = {}
  end

  def display_anagrams
    collection[:anagrams] = set_limit
    collection
  end

  private
  attr_reader :word, :limit, :redis_service, :collection
  
  def set_limit
    if limit
      remove_self.take(limit.to_i)
    else
      remove_self
    end
  end
  
  def remove_self
    redis_service.fetch_cache.reject { |anagrams| anagrams == word }
  end
end
