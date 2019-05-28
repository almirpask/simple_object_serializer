require 'rails'

module SimpleObjectSerializer
  class Railtie < ::Rails::Railtie
    initializer 'simple_object_serializer.setup_view_helpers', after: :load_config_initializers, group: :all do
      ActiveSupport.on_load(:action_view) do
        include ::SimpleObjectSerializer::ViewHelper
      end
    end
  end
end
