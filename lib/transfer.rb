class Transfer

  attr_accessor :sender, :receiver, :status, :amount
  def initialize(p1, p2, amount)
    @sender = p1
    @receiver = p2
    @status = 'pending'
    @amount = amount
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if @status == 'pending' && (@sender.balance >= @amount) && self.valid?
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = 'complete'
    else #!(self.valid?)
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == 'complete'
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = "reversed"
    end
  end
end
