class AnagramsController < ApplicationController
  def show
    render status: 200, json: AnagramKey.find_by_sorted_spelling(sorted_letters), input_word: params[:word]
  end

  private

  def sorted_letters
    params[:word].chars.sort.join
  end
end
