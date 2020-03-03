require 'rails/generators/base'

module Iris
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates iris initializer, controllers, views, and routes."
      def install
        # Create initializer
        copy_file "config/initializers/iris.rb", "config/initializers/iris.rb"

        # Create controllers
        directory "app/controllers/iris", "app/controllers/iris"

        # Create views
        directory "app/views/iris", "app/views/iris"

        # Create default layout
        # directory "app/views/layouts/iris", "app/views/layouts/iris"

        # Add routes
        route %{
          scope :module => 'iris' do
            get '/blog' => 'posts#index', :as => :iris_blog
            get '/blog/:slug' => 'posts#show', :as => :iris_post
          end
        }

        puts "Success! Configure your API token in config/initializers/iris.rb, restart your server, and view your blog at /blog"
      end
    end
  end
end
