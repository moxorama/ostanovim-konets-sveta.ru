# -*- encoding : utf-8 -*-
class StopperController < ApplicationController
  layout false
  def index
  end

  def stop_end_of_the_world
    @saver = Stopper.first
    @saver.update_attributes(:value => @saver.value + 1)
  end


end
