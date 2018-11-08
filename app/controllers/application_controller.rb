class ApplicationController < ActionController::API
  def removal_service(word = nil)
    RemovalService.new(word)
  end
end
