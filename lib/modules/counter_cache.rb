module CounterCache
  def sorted_letters_cache_number(word)
    @num ||= Rails.cache.read(sort_letters(word))
    if @num
      @num.to_s
    else
      '1'
    end
  end
end
