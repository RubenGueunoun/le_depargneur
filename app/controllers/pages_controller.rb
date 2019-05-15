class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :token_already_used]

  def home
  end

  def token_already_used
  end

  def pre_created
  end
end
