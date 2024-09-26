module PaymentEngine
  class PaymentProcessor
    def self.process_payment(payment)
      new(payment).send(:create_payment)
    end

    private

    def initialize(payment)
      @payment = payment
    end

    def create_payment
      sender = Organisation.find_by(uuid: @payment[:sender_uuid])
      receiver = Organisation.find_by(uuid: @payment[:receiver_uuid])
      vendor = Vendor.find_by(uuid: @payment[:vendor_uuid])
      amount = @payment[:amount].to_f

      if sender.nil? || receiver.nil? || vendor.nil?
        return { status: 'failed', message: 'Invalid sender or receiver or vendor' }
      end
      return { status: 'failed', message: 'Insufficient balance' } if sender.balance < amount

      ActiveRecord::Base.transaction do
        sender.balance -= amount
        receiver.balance += amount
        sender.save!
        receiver.save!
        Payment.create!(
          sender: sender,
          receiver: receiver,
          amount: amount,
          vendor: vendor,
          status: 'processed'

        )
      end
      { status: 'success', message: 'Payment processed successfully' }
    rescue ActiveRecord::RecordInvalid => e
      { status: 'failed', message: e.message }
    end
  end
end