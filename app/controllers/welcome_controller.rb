require 'ostruct'

class WelcomeController < ApplicationController
  def index
    @setting = (Settings.find_by(key: 'home_page') || OpenStruct.new).value || " "
  end

  def who_are_we
    @setting = (Settings.find_by(key: 'who_are_we') || OpenStruct.new).value || " "
  end

  def innovate_together
    @setting = (Settings.find_by(key: 'innovate_together') || OpenStruct.new).value || " "
  end
end
