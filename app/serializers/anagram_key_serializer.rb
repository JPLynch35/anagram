class AnagramKeySerializer < ActiveModel::Serializer
  attributes :anagrams

  def anagrams
    all_anagrams = get_word_spellings
    all_anagrams.delete(instance_options[:input_word])
    reduce_to_limit(all_anagrams.sort)
  end

  private

  def get_word_spellings
    self.object.words.map do |word|
      word.spelling
    end
  end

  def reduce_to_limit(anagrams)
    if instance_options[:limit]
      limit = instance_options[:limit].to_i
      anagrams.take(limit)
    else
      anagrams
    end
  end
end
