module Kyubi
  class Railtie < Rails::Railtie
    config.kyubi = ActiveSupport::OrderedOptions.new

    config.kyubi.asset_root = "app/assets/views"

    config.kyubi.stylesheet_ext = %w[css less sass scss]
    config.kyubi.javascript_ext = %w[js coffee]

    initializer :kyubi_append_assets_path, after: :append_assets_path do |app|
      app.config.assets.paths += Dir.glob(Rails.root.join("#{app.config.kyubi.asset_root}/*"))
    end

    initializer :kyubi_append_precompile, after: :set_default_precompile do |app|
      app.config.assets.precompile << ->(_path, file) { file.start_with?(Rails.root.join(app.config.kyubi.asset_root).to_s) }
    end

    config.after_initialize do |_app|
      ActiveSupport.on_load(:action_view) do
        include Kyubi::TagHelper
      end

      Kyubi::Catalog.load
    end
  end
end
