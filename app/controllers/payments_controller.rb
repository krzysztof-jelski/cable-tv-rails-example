class PaymentsController < ApplicationController
  def index
    @payments = Client.find(params[:client_id]).payments
  end
end
