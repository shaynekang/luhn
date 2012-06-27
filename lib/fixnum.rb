require 'credit_card'

class Fixnum
  def to_credit_card
    CreditCard.new(self)
  end

  def luhn?
    to_credit_card.valid?
  end
end