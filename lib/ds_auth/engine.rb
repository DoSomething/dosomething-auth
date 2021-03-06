module DsAuth
  class Engine < ::Rails::Engine
    isolate_namespace DsAuth
    initializer "static assets" do |app|
      app.middleware.use ::ActionDispatch::Static, "#{root}/public"
    end
  end
end
