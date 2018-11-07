class WordsController < ApplicationController
  def create
    request_payload = JSON.parse request.body.read
    creator = AnagramCreator.new(request_payload['words'])
    creator.log_anagrams
    head :created
  end

  def destroy
    removal_service.remove_single_word
    head :no_content
  end

  private

  def removal_service
    RemovalService.new(params[:word])
  end
end
