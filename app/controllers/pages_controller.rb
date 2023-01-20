class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home about]
  def home
    @colors = ['#0476f1', '#cbbada', '#e7e5e6', '#f4c524']
  end

  def about
  end
end
