class WordsController < ApplicationController
  def create
    request_payload = JSON.parse request.body.read
    creator = AnagramCreator.new(request_payload['words'])
    creator.log_anagrams
    head :created
  end

  def destroy
    Word.find_by_spelling(params[:word]).destroy
    head :no_content
  end
end
