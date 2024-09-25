module PaymentEngine
  class PaymentProcessor
    def self.process_payment(payment)
      puts "Payment to process: #{payment}"
      new(payment).send(:create_payment)
    end

    private
    def initialize(payment)
      @payment = payment
      puts "Payment initiated: #{@payment}"
    end
    def create_payment
      puts "Payment to create: #{@payment}"
      sender   = Organisation.find_by(uuid: @payment[:sender_uuid])
      receiver = Organisation.find_by(uuid: @payment[:receiver_uuid])
      vendor   = Vendor.find_by(uuid: @payment[:vendor_uuid])
      amount   = @payment[:amount].to_f

      if sender.nil? || receiver.nil? || vendor.nil?
        puts "Invalid sender or receiver or vendor"
        puts "Sender: #{sender.inspect}"
        puts "Receiver: #{receiver.inspect}"
        puts "Vendor: #{vendor.inspect}"
        return { status: 'failed', message: 'Invalid sender or receiver or vendor' }
      end
      if sender.balance < amount
        puts "Insufficient balance"
        return { status: 'failed', message: 'Insufficient balance' }
      end

      ActiveRecord::Base.transaction do
        puts "Processing payment"
        sender.balance -= amount
        receiver.balance += amount
        sender.save!
        receiver.save!
        puts "Payment processed"
        Payment.create!(
          sender: sender,
          receiver: receiver,
          amount: amount,
          vendor: vendor,
          status: 'processed'

        )
        puts "Payment created"
      end
      { status: 'success', message: 'Payment processed successfully' }
    rescue ActiveRecord::RecordInvalid => e
      { status: 'failed', message: e.message }
    end
  end
end