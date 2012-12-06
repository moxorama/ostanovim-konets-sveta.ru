# encoding: UTF-8

class Stopper < ActiveRecord::Base
  # attr_accessible :title, :body
   # attr_accessible :title, :body
  def self.attempts
    v = Stopper.first.value.to_i
    return v.to_s + " " + Russian::p(v, "попытка", "попытки", "попыток")
  end
end
