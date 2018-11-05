class AnagramsController < ApplicationController
  def show
    render status: 200, json: Anagram.find_by_sorted_spelling(sorted_letters), input_word: params[:word], limit: params[:limit], serializer: AnagramSerializer
  end

  def destroy
    conn = ActiveRecord::Base.connection
    conn.execute('TRUNCATE TABLE anagrams CASCADE')
  end

  private

  def sorted_letters
    params[:word].chars.sort.join
  end
end
