RSpec.configure do |config|
  config.before(cat_load: true, type: :feature) do
    @cat_l = Catalog_load.new
    @cat_l.load
  end
end
