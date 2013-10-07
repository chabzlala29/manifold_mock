require 'rails/generators'

module ManifoldMock
  module Generators
    class TemplateGenerator < Rails::Generators::Base
      ZB_TEMPLATES = ['banded','blog', 'feed', 'grid', 'orbit', 'banner-home', 'sidebar']
      BS_TEMPLATES = ['fixed', 'fluid']

      class_option :haml, type: :boolean, desc: "Generate HAML layout"
      class_option :framework, type: :string, default: "foundation"
      class_option :template, type: :string, default: "blog"

      def self.source_root
        @source_root ||= File.join(File.dirname(__FILE__), 'templates')
      end

      def create_template
        case options.framework
        when "foundation"
          if ZB_TEMPLATES.include?(options.template)
              haml_checker = (options.haml?)? 'erb' : 'haml'
              haml_checker2 = !(options.haml?)? 'erb' : 'haml'
              remove_file "app/views/layouts/application.html.#{haml_checker}"
              template "foundation/haml/#{options.template}.html.#{haml_checker2}", "app/views/layouts/application.html.haml"
          else
            raise "template not found."
          end
        when "bootstrap"
          Bundler.with_clean_env do
            remove_file "app/views/layouts/application.html.haml"
            remove_file "app/views/layouts/application.html.erb"
            run "rails g bootstrap:layout application #{options.template}"
          end
        else
          raise "framework not found."
        end
      end
    end
  end
end
