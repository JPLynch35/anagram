class AnagramsController < ApplicationController
  def show
    render status: 200, json: anagram_presenter.display_anagrams
  end

  def destroy
    conn = ActiveRecord::Base.connection
    conn.execute('TRUNCATE TABLE anagrams CASCADE')
    head :no_content
  end

  private

  def anagram_presenter
    AnagramPresenter.new(params[:word], params[:limit])
  end
end
