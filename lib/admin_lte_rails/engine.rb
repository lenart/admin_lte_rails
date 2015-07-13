require "rails-assets-admin-lte"

module AdminLteRails
  module Rails
    class Engine < ::Rails::Engine
      initializer "admin_lte.precompile", group: :all do |app|
        app.config.assets.precompile += %w( admin_lte_rails.css admin_lte_rails.js )
        # app.config.assets.precompile << /\.(?:svg|eot|woff|ttf)\z/
        # app.config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
      end

      initializer "admin_lte.add_helpers" do
        ActionView::Base.send :include, AdminLteRails::NavigationHelper
      end
    end
  end
end
