module PaymentEngine
  class PaymentQuery
    def self.index(query_params = {})
      if query_params.present? && query_params[:organisation_id].present?
        Payment.where('sender_id = ? OR receiver_id =?', query_params[:organisation_id], query_params[:organisation_id])
      else
        Payment.all
      end
    end

    def self.find_payment(payment_id)
      Payment.find(payment_id)
    end
  end
end