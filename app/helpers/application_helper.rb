module ApplicationHelper
  def active?(page)
    @page == page ? "active" : ""
  end

  def link_participar(text="Como participar?",nav=true)
    if nav
      link_to text, {:controller => :welcome, :action => :participar}, {:class => "nav-link"}
    else
      link_to text, {:controller => :welcome, :action => :participar}
    end
  end

  def link_prodigio
    link_to "Categoria Prodígio", {:controller => :category, :action => :prodigio}, {:class => "nav-link"}
  end

  def link_senior
    link_to "Categoria Sênior", {:controller => :category, :action => :senior}, {:class => "nav-link"}
  end

  def link_junior
    link_to "Categoria Júnior", {:controller => :category, :action => :junior}, {:class => "nav-link"}
  end
end
