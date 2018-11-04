class AnagramKeySerializer < ActiveModel::Serializer
  attributes :anagrams

  def anagrams
    if self.object.present?
      all_anagrams = get_word_spellings
      all_anagrams.delete(instance_options[:input_word])
      reduce_to_limit(all_anagrams.sort)
    else
      []
    end
  end

  private

  def get_word_spellings
    self.object.words.pluck(:spelling)
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
