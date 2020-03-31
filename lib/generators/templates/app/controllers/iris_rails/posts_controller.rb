class IrisRails::PostsController < IrisRails::BaseController
  def index
    response = IrisRails::Post.all
    @posts, @account = response
    if @posts.length.odd?
      @last3 = 3
    end
  end

  def show
    response = IrisRails::Post.find(params[:slug])
    @post, @related_posts, @account = response
    @author = author_name_or_email(@post.author)
  end

  private

  def author_name_or_email(author)
    if author['first_name'] || author['last_name']
      "#{author['first_name'] } #{author['last_name'] }"
    else
      author['email']
    end
  end
end
