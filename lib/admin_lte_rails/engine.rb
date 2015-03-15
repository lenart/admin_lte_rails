module AdminLteRails
  module Rails
    class Engine < ::Rails::Engine
      initializer 'admin_lte.precompile', group: :all do |app|
        app.config.assets.precompile += %w( admin_lte.css admin_lte.js )
        app.config.assets.precompile += %w( ckeditor/* )
      end

      initializer 'admin_lte.add_helpers' do
        ActionView::Base.send :include, AdminLteRails::NavigationHelper
      end
    end
  end
end