class Iris::PostsController < Iris::BaseController
  def index
    @posts = Iris::Post.all
  end

  def show
    @post = Iris::Post.find(params[:slug])
  end
end
