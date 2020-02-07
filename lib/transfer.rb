
require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end

  def execute_transaction
   
    if @sender.balance < @amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."

    elsif @status == "pending" && @sender.status == "open" && @sender.status == @receiver.status
      #doing transfer 
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
end