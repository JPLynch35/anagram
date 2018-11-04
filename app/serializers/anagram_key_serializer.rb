class AnagramKeySerializer < ActiveModel::Serializer
  attributes :anagrams

  def anagrams
    all_anagrams = self.object.words.map do |word|
      word.spelling
    end
    all_anagrams.delete(instance_options[:input_word])
    all_anagrams.sort
  end
end
