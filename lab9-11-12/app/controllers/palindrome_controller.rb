# app/controllers/palindrome_controller.rb

class PalindromeController < ApplicationController
  before_action :authorize

  def input
    begin
      a = params[:value].to_i
    rescue # must be error only on Complex data
      p 'PalindromeController: Input data error'
      p a
    end
    a = 0 if a < 0
    respond_to do |format|
      format.html
      format.json do
        render json: { solution: Answer.where(query: a).first_or_create.get_solution.each { |x| x[0] = x[0].to_s } }
      end
    end
    # p Answer.last
    # p ActiveSupport::JSON.decode(Answer.last.solution)
    # p JSON.parse(Answer.all.to_json).to_xml
  end
end
