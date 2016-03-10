module Vasari
  class Engine < ::Rails::Engine
    isolate_namespace Vasari
    require 'paperclip'
  end
end
