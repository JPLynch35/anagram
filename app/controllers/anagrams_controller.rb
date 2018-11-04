class AnagramsController < ApplicationController
  def show
    render status: 200, json: AnagramKey.includes(:words).find_by_sorted_spelling(sorted_letters), input_word: params[:word], limit: params[:limit]
  end

  private

  def sorted_letters
    params[:word].chars.sort.join
  end
end
