class RemovalService
  def initialize(word=nil)
    @word = word
  end

  def remove_single_word
    Word.find_by_spelling(word).destroy
  end

  def remove_all_data
    conn = ActiveRecord::Base.connection
    conn.execute('TRUNCATE TABLE anagrams CASCADE')
  end

  private
  attr_reader :word
end
