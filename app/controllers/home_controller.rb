class HomeController < ApplicationController
  # TODO: 下記コードは恐らくphoto_new2がマージされていないためエラーになる
  # before_action :forbid_login_user, {only: [:top]}

  def top
  end

  def about
  end
end
