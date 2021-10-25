class SearchsController < ApplicationController
  def search
    @content = params["content"]
    recourds = search_for(@content)
    @recourds = Kaminari.paginate_array(recourds).page(params[:page]).per(5)
  end

  private

  def search_for(content)
    Itenerary.where("title LIKE ?", "%" + content + "%")
  end
end
