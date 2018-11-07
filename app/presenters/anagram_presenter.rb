class AnagramPresenter
  def initialize(word, limit=nil)
    @service ||= AnagramService.new(word, limit)
    @collection = Hash.new
  end

  def display_anagrams
    collection[:anagrams] = convert_to_spellings
    collection
  end

  private
  attr_reader :service, :collection

  def convert_to_spellings
    service.retrieve_anagrams.map(&:spelling)
  end
end
