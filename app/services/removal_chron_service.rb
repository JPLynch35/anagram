class RemovalChronService
  def cleanup_anagrams
    Anagram.all.each do |anagram|
      anagram.destroy if anagram.words == []
    end
  end
end
