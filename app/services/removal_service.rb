class RemovalService
  include CounterCache
  include Sort

  def initialize(word=nil)
    @word = word
  end

  def remove_single_word
    Word.destroy(anagram_service.retrieve_id)
    Rails.cache.write(sort_letters(word), sorted_letters_cache_number(word).to_i + 1)
  end

  def remove_all_data
    conn = ActiveRecord::Base.connection
    conn.execute('TRUNCATE TABLE anagrams CASCADE')
    Rails.cache.clear
  end

  private
  attr_reader :word

  def anagram_service
    AnagramService.new(word)
  end
end
