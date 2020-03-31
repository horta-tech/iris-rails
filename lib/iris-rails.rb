require 'rails'
require 'active_support/core_ext/numeric/time'
require 'active_support/dependencies'
require 'json'
require 'rest-client'

module IrisRails
  class << self
    attr_accessor :api_token
  end

  @api_url = 'https://iriscms.herokuapp.com/api/v1/'

  def self.indexUrl
    @api_url + 'posts?api_key=' + self.api_token
  end

  def self.postUrl(slug)
    @api_url + "posts/#{slug}?api_key=" + self.api_token
  end

  def self.infoUrl
    @api_url + 'account-info?api_key=' + self.api_token
  end

  class Error < StandardError; end
  # Your code goes here...
  def self.perform
    "performing"
  end

	class Account
		attr_accessor :account_name
		attr_accessor :template
		attr_accessor :type
		attr_accessor :account_title
		attr_accessor :account_description
		attr_accessor :account_keyword

		def initialize(attr = {})
      @account_name = attr[:account_name]
      @template = attr[:template]
      @type = attr[:type]
      @account_title = attr[:account_title]
      @account_description = attr[:account_description]
      @account_keyword = attr[:account_keyword]
		end
	end

  class Post
    @headers = {'Content-Type':'application/x-www-form-urlencoded'}
    attr_accessor :main_title
    attr_accessor :slug
    attr_accessor :created_at
    attr_accessor :updated_at
    attr_accessor :banner_image
    attr_accessor :banner_text
    attr_accessor :secondary_title
    attr_accessor :first_introduction
    attr_accessor :internal_links
    attr_accessor :second_introduction
    attr_accessor :call_to_action_content
    attr_accessor :call_to_action_link
    attr_accessor :call_to_action_link_description
    attr_accessor :closure_text
    attr_accessor :published
    attr_accessor :keyphrase
    attr_accessor :meta_description
    attr_accessor :seo_title
    attr_accessor :publish_date
    attr_accessor :published_at
    attr_accessor :score
    attr_accessor :author_id
    attr_accessor :author
		attr_accessor :ordered_topics

    def initialize(attr = {})
      @main_title = attr["main_title"]
      @slug = attr["slug"]
      @created_at = attr["created_at"]
      @updated_at = attr["updated_at"]
      @banner_image = attr["banner_image"]
      @banner_text = attr["banner_text"]
      @secondary_title = attr["secondary_title"]
      @first_introduction = attr["first_introduction"]
      @internal_links = attr["internal_links"]
      @second_introduction = attr["second_introduction"]
      @call_to_action_content = attr["call_to_action_content"]
      @call_to_action_link = attr["call_to_action_link"]
      @call_to_action_link_description = attr["call_to_action_link_description"]
      @closure_text = attr["closure_text"]
      @published = attr["published"]
      @keyphrase = attr["keyphrase"]
      @meta_description = attr["meta_description"]
      @seo_title = attr["seo_title"]
      @publish_date = attr["publish_date"]
      @published_at = attr["published_at"]
      @score = attr["score"]
      @author_id = attr["author_id"]
      @author = attr["author"]
			@ordered_topics = attr["ordered_topics"]
    end

    def self.find(slug)
      url = IrisRails.postUrl(slug)
      response = RestClient.get(url, @headers)
      response = JSON.parse(response.body)
      puts 'data'
      post = self.new(response['data'])
			related_posts = []
			response['related_posts'].each do |related_post|
				related_posts << self.new(related_post)
			end
			post.author = response['data']['author']
			account = IrisRails::Account.new(
				{account_name: response['account_name'],
				template: response['template']}
			)
			return post, related_posts, account
    end

    def self.all
      url = IrisRails.indexUrl
      response = RestClient.get(url, @headers)
      response = JSON.parse(response.body)
      puts response
			posts = []
			response['data'].each do |post|
				posts << self.new(post)
			end
			account = IrisRails::Account.new(
				{account_name: response['account_name'],
				template: response['template'],
				account_title: response['account_title'],
				account_description: response['account_description'],
				account_keyword: response['account_keyword']}
			)
			return posts, account
    end
  end
end
