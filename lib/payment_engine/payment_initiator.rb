module PaymentEngine
  class PaymentInitiator
    def self.initiate_payment(payment)
      PaymentEngine::PaymentProcessor.process_payment(payment)

    rescue ActiveRecord::RecordInvalid => e
      e.messages
    end

    def self.refund_payment(payment)
      payment = Payment.find(payment[:payment_id])
      refund = payment.dup
      refund.sender_id = payment.receiver_id
      refund.receiver_id = payment.sender_id

      result = PaymentEngine::PaymentProcessor.process_payment(payment)
      payment..update_attribute(:status, 'refunded') if result[:status] == 'success'

      return result

    rescue ActiveRecord::RecordInvalid => e
      e.messages
    end
  end




end