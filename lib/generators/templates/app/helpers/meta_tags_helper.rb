module MetaTagsHelper
  def iris_meta_tags(meta_tags = {})
    [
      set_title(meta_tags[:head_title]),
      meta_title(meta_tags[:head_title]),
      meta_description(meta_tags[:meta_description]),
      meta_keywords(meta_tags[:meta_keywords]),
      meta_author(meta_tags[:meta_author]),
      set_iris_css
    ].join("\n").html_safe
  end

  private

  def set_title(given_title)
    content_for?(:title) ? content_tag(:title, content_for(:account_name) + ' | ' + content_for(:title)) : (content_tag(:title, given_title) if !given_title.empty?)
  end

  def meta_title(given_meta_title)
    content_for?(:title) ? tag('meta', name: 'title', :content => content_for(:title)) : (tag('meta', :name => 'title', :content => given_meta_title) if !given_meta_title.empty?)
  end

  def meta_description(given_meta_description)
    content_for?(:meta_description) ? tag('meta', name: 'description', :content => content_for(:meta_description)) : (tag('meta', :name => 'description', :content => given_meta_description) if !given_meta_description.empty?)
  end

  def meta_keywords(given_meta_keywords)
    content_for?(:meta_keywords) ? tag('meta', name: 'keywords', :content => content_for(:meta_keywords)) : (tag('meta', :name => 'keywords', :content => given_meta_keywords) if !given_meta_keywords.empty?)
  end

  def meta_author(given_meta_author)
    content_for?(:meta_author) ? tag('meta', name: 'author', :content => content_for(:meta_author)) : (tag('meta', :name => 'author', :content => given_meta_author) if !given_meta_author.empty?)
  end

  def set_iris_css
    tag(:link, href: "https://cdn.jsdelivr.net/npm/iris-cms/templates/#{content_for(:iris_css)}.css", rel: 'stylesheet') if content_for?(:iris_css)
  end
end
