module LinksHelper
  def longify(link)
    redirect_link_url(link.slug, subdomain: link.subdomain)
  end
  
  def calc_percentage_increase(link)
    number_to_percentage(longify(link).length.to_f / link.uri.length * 100 - 100)
  end
end
