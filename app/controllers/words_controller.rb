class WordsController < ApplicationController
  def create
    anagram_creator.log_anagrams
    head :created
  end

  def destroy
    removal_service.remove_single_word
    head :no_content
  end

  private

  def anagram_creator
    request_payload = JSON.parse request.body.read
    creator = AnagramCreator.new(request_payload['words'])
  end

  def removal_service
    RemovalService.new(params[:word])
  end
end
