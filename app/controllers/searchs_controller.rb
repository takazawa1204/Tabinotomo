class SearchsController < ApplicationController
  def search
    @content = params["content"]
    @recourds = search_for(@content)
  end
  
  private
  

  def search_for(content)
    Itenerary.where("title LIKE ?", "%"+content+"%")
  end
end