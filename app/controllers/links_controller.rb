class LinksController < ApplicationController
  def new
    @link = Link.new
  end
  
  def create
    @theme = Theme.find(params[:link][:theme])
    @link = @theme.links.find_or_initialize_by_uri(params[:link][:uri])
    
    @link.save ? redirect_to(@link) : render(:new)
  end
  
  def index
    @links = Link.order('clicks_count DESC').paginate(page: params[:page], per_page: 20)
  end
  
  def show
    @link = Link.find(params[:id])
  end
  
  def redirect
    link = Link.find_by_subdomain_and_slug!(request.subdomain, params[:id])
    link.clicks.create!(ip: request.remote_ip, user_agent: request.user_agent, referer: request.referer)
    redirect_to link.uri, status: :moved_permanently
  end
end
