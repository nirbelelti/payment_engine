module PaymentEngine
  class PaymentInitiator
    def self.initiate_payment(payment)
      PaymentEngine::PaymentProcessor.process_payment(payment)
    rescue ActiveRecord::RecordInvalid => e
      e.messages
    end

    def self.refund_payment(payment)
      payment = Payment.find(payment[:id])
      return { status: 'failed', message: 'Payment not found' } if payment.nil?
      return { status: 'failed', message: 'Payment already refunded' } if payment.status == 'refunded'

      refund = {
        sender_uuid: payment.sender.uuid,
        receiver_uuid: payment.receiver.uuid,
        vendor_uuid: payment.vendor.uuid,
        amount: payment.amount
      }

      result = PaymentEngine::PaymentProcessor.process_payment(refund)
      payment.update_attribute(:status, 'refunded') if result[:status] == 'success'

      return result
    rescue ActiveRecord::RecordInvalid => e
      e.messages
    end
  end
end
