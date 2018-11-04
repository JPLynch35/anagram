class WordsController < ApplicationController
  def create
    request_payload = JSON.parse request.body.read
    creator = AnagramCreator.new(request_payload['words'])
    creator.log_anagrams
    head :created
  end
end
