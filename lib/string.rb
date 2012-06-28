require 'fixnum'

class String
  def luhn?
    to_i.luhn?
  end
end