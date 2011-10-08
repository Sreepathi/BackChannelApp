Sass::Plugin.options.merge!(
  :template_location => 'public/stylesheets/sass',
  :css_location => '/app/assests/stylesheets'
)

Rails.configuration.middleware.delete('Sass::Plugin::Rack')
Rails.configuration.middleware.insert_before('Rack::Sendfile', 'Sass::Plugin::Rack')

Rails.configuration.middleware.insert_before('Rack::Sendfile', 'Rack::Static',
    :urls => ['/custom'],
    :root => "#{Rails.root}")