require 'pry'

class BoardCase

  attr_accessor :id, :value
  def initialize(id, value = " ")
    @id = id
    @value = value
  end
end
