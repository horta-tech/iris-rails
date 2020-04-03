class IrisRails::PostsController < IrisRails::BaseController
  def index
    response = IrisRails::Post.all
    @posts, @account = response

    @first_posts = @posts.first(3)
    @highlighted_posts = @posts[3, 3]
    @more_posts = @posts[6, @posts.size - (@posts.length.odd? ? 9 : 6)]
    if @posts.length.odd? && (@posts.length >= 9)
      @last_posts = @posts.last(3)
    elsif @posts.length == 7
      @last_posts = []
      @last_posts << @posts.last
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
