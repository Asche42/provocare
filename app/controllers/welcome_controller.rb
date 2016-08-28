class WelcomeController < ApplicationController
  def index
    @setting = Settings.find_by(key: 'home_page')&.value || " "
    @last_article = Article.last || Article.new
  end

  def who_are_we
    @setting = Settings.find_by(key: 'who_are_we')&.value || " "
  end

  def innovate_together
    @setting = Settings.find_by(key: 'innovate_together')&.value || " "
  end
end
