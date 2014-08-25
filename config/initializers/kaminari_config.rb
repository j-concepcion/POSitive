Kaminari.configure do |config|
  config.default_per_page = Base::Settings.kaminari.default_per_page
  # config.max_per_page = nil
  config.window = Base::Settings.kaminari.window
  config.outer_window = Base::Settings.kaminari.outer_window
  config.left = Base::Settings.kaminari.left
  config.right = Base::Settings.kaminari.right
  config.page_method_name = Base::Settings.kaminari.page_method_name
  config.param_name = Base::Settings.kaminari.param_name
end
