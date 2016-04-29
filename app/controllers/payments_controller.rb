class PaymentsController < ApplicationController
  def index
    @client = fetch_client
    @payments = @client.payments
  end

  private

  def fetch_client
    Client.find(params[:client_id])
  end
end
