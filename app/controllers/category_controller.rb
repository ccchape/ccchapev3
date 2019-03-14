class CategoryController < ApplicationController
  def prodigio
    @page = :prodigio
    @users = User.prodigio
  end

  def junior
    @page = :junior
    @users = User.junior
  end

  def senior
    @page = :senior
    @users = User.senior
  end
end
