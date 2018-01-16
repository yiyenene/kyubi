module Kyubi
  module Catalog
    class << self
      def stylesheet_exist?(controller, action)
        exist = @stylesheets[controller].include?(action)
        return exist if exist || !Rails.env.development?
        load # reload
        @stylesheets[controller].include?(action)
      end

      def javascript_exist?(controller, action)
        exist = @javascripts[controller].include?(action)
        return exist if exist || !Rails.env.development?
        load
        @javascripts[controller].include?(action)
      end

      def load
        initialize_value
        root = Rails.root.join(Rails.application.config.kyubi.asset_root)
        Dir.glob("#{root}/*").each do |d|
          dir_name = d.split("/").last
          Dir.entries(d).each do |f|
            next if [".", ".."].include?(f)
            file, ext = f.split(".") # TOOD: better method
            @stylesheets[dir_name] << file if Rails.application.config.kyubi.stylesheet_ext.include?(ext)
            @javascripts[dir_name] << file if Rails.application.config.kyubi.javascript_ext.include?(ext)
          end
        end
      end

      private

        def initialize_value
          @stylesheets = Hash.new { |h, k| h[k] = [] }
          @javascripts = Hash.new { |h, k| h[k] = [] }
        end
    end
  end
end
