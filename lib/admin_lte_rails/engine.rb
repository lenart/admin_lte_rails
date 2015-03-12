module AdminLteRails
  module Rails
    class Engine < ::Rails::Engine
      initializer 'Template precompile hook', group: :all do |app|
        app.config.assets.precompile += %w(admin_lte.css admin_lte.js)
      end
    end
  end
end