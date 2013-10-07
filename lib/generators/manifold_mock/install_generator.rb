#lib/generators/gemname/install_generator.rb
require 'rails/generators'
require File.expand_path('../utils', __FILE__)

module ManifoldMock
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include ManifoldMock::Utils

      desc "Install ManifoldMock"
      class_option :framework, :type => :string, :default => "foundation", 
        :desc => "Specify Front-End framework"
      class_option :haml, :type => :boolean
      class_option :fluid, :type => :boolean
      class_option :fixed, :type => :boolean

      def self.source_root
        @source_root ||= File.join(File.dirname(__FILE__), 'templates')
      end

      def install
        say "Hello, Manifold Mock will help you set up your template"
        installed_gems Gem::Specification.map { |g| g.name }
        install_framework framework: options.framework, haml: options.haml, fluid: options.fluid,
          fixed: options.fixed
      end
    end
  end
end
