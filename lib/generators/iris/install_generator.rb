require 'rails/generators/base'

module Iris
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates iris initializer, controllers, views, and routes."
      def install
        # Create initializer
        copy_file "config/initializers/iris_rails.rb", "config/initializers/iris_rails.rb"

        # Create controllers
        directory "app/controllers/iris_rails", "app/controllers/iris_rails"

        # Create views
        directory "app/views/iris_rails", "app/views/iris_rails"

        # Create helper
        copy_file "app/helpers/meta_tags_helper.rb", "app/helpers/meta_tags_helper.rb"

        # Create iris_rails model
        copy_file "../lib/iris_rails.rb", "lib/iris_rails.rb"

        # Create default layout
        # directory "app/views/layouts/iris", "app/views/layouts/iris"

        # Add routes
        route %{
          scope :module => 'iris_rails' do
            get '/blog' => 'posts#index', :as => :iris_blog
            get '/blog/:slug' => 'posts#show', :as => :iris_post
          end
        }

        puts "Success! Configure your API token in config/initializers/iris_rails.rb, restart your server, and view your blog at /blog"
      end
    end
  end
end
