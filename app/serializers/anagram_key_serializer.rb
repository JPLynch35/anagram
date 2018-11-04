class AnagramKeySerializer < ActiveModel::Serializer
  attributes :anagrams

  def anagrams
    all_anagrams = get_word_spelling
    all_anagrams.delete(instance_options[:input_word])
    all_anagrams.sort
  end

  private

  def get_word_spelling
    self.object.words.map do |word|
      word.spelling
    end
  end
end
