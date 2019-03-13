class WelcomeController < ApplicationController
  def index
    @page = :root
  end
  def participar
    @page = :participar
  end
  def formulario
    @page = :formulario
  end
end
