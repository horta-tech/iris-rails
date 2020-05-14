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
    if content_for?(:title)
      content_tag(:title, content_for(:account_name) + ' | ' + content_for(:title))
    elsif !(given_title.empty? || given_title.nil?)
      content_tag(:title, given_title)
    end
  end

  def meta_title(given_meta_title)
    if content_for?(:title)
      tag('meta', name: 'title', :content => content_for(:title))
    elsif !(given_meta_title.empty? || given_meta_title.nil?)
      tag('meta', :name => 'title', :content => given_meta_title)
    end
  end

  def meta_description(given_meta_description)
    if content_for?(:meta_description)
      tag('meta', name: 'description', :content => content_for(:meta_description))
    elsif !(given_meta_description.empty? || given_meta_description.empty?)
      tag('meta', :name => 'description', :content => given_meta_description)
    end
  end

  def meta_keywords(given_meta_keywords)
    if content_for?(:meta_keywords)
      tag('meta', name: 'keywords', :content => content_for(:meta_keywords))
    elsif !(given_meta_keywords.empty? || given_meta_keywords.nil?)
      tag('meta', :name => 'keywords', :content => given_meta_keywords)
    end
  end

  def meta_author(given_meta_author)
    if content_for?(:meta_author)
      tag('meta', name: 'author', :content => content_for(:meta_author))
    elsif !(given_meta_author.empty? || given_meta_author.nil?)
      tag('meta', :name => 'author', :content => given_meta_author)
    end
  end

  def set_iris_css
    tag(:link, href: "https://cdn.jsdelivr.net/npm/iris-cms/templates/#{content_for(:iris_css)}.css", rel: 'stylesheet') if content_for?(:iris_css)
  end
end
