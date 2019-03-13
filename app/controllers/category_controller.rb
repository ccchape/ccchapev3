class CategoryController < ApplicationController
  def prodigio
    @page = :prodigio
  end

  def junior
    @page = :junior
  end

  def senior
    @page = :senior
  end
end
