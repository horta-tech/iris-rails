module MetaTagsHelper
  def iris_meta_tags(meta_tags = {})
    [
      set_title(meta_tags[:head_title]),
      meta_title(meta_tags[:head_title]),
      meta_description(meta_tags[:meta_description]),
      meta_keywords(meta_tags[:meta_keywords])
    ].join("\n").html_safe
  end

  private

  def set_title(given_title)
    content_for?(:title) ? content_tag(:title, 'Iris | ' + content_for(:title)) : (content_tag(:title, given_title) if !given_title.empty?)
  end

  def meta_title(given_meta_title)
    content_for?(:title) ? tag('meta', :name => 'title', :content => content_for(:title)) : (tag('meta', :name => 'title', :content => given_meta_title) if !given_meta_title.empty?)
  end

  def meta_description(given_meta_description)
    content_for?(:meta_description) ? tag('meta', :name => 'description', :content => content_for(:meta_description)) : (tag('meta', :name => 'description', :content => given_meta_description) if !given_meta_description.empty?)
  end

  def meta_keywords(given_meta_keywords)
    content_for?(:meta_keywords) ? tag('meta', :name => 'keywords', :content => content_for(:meta_keywords)) : (tag('meta', :name => 'keywords', :content => given_meta_keywords) if !given_meta_keywords.empty?)
  end
end
