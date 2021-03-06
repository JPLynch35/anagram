class RemovalService
  def initialize(word=nil)
    @word = word
  end

  def remove_single_word
    Word.find_by_spelling(word).destroy
    redis_service(word).bust_cache
  end

  def remove_all_data
    conn = ActiveRecord::Base.connection
    conn.execute('TRUNCATE TABLE anagrams CASCADE')
    redis_service.clear_cache
  end

  private
  attr_reader :word

  def redis_service(word=nil)
    RedisService.new(word)
  end
end
