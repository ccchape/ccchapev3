class CategoryController < ApplicationController
  def prodigio
    @page = :prodigio
    pp User.all
  end

  def junior
    @page = :junior
  end

  def senior
    @page = :senior
  end
end
