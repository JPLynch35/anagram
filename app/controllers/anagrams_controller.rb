class AnagramsController < ApplicationController
  def show
    render status: 200, json: AnagramKey.includes(:words).find_by_sorted_spelling(sorted_letters), input_word: params[:word], limit: params[:limit], serializer: AnagramKeySerializer
  end

  def destroy
    conn = ActiveRecord::Base.connection
    conn.execute('TRUNCATE TABLE anagram_keys CASCADE')
  end

  private

  def sorted_letters
    params[:word].chars.sort.join
  end
end
