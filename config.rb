require 'slim'

###
# Page options, layouts, aliases and proxies
###

ignore 'REAMDME.md'

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :layouts_dir, 'layouts'

activate :external_pipeline,
  name: :gulp,
  command: build? ? './node_modules/gulp/bin/gulp.js build' : './node_modules/gulp/bin/gulp.js watch',
  source: ".tmp/dist",
  latency: 0.25

configure :build do
  ignore /stylesheets\/.*\.scss/
  ignore /javascripts\/(?!bundle).*\.js/
end


## GitHub Flavored Markdown
set :markdown, :tables => true, :autolink => true, :gh_blockcode => true, :fenced_code_blocks => true
set :markdown_engine, :redcarpet

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy '/this-page-has-no-template.html', '/template-file.html', locals: {
#  which_fake_page: 'Rendering a fake page with a local variable' }

###
# Helpers
###

helpers do
  def hostUrl link
    'https://zacky1972.github.io/KK-SHiFT' + link
  end
end

# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
  # リポジトリ名を host に設定しておく
  # こうすることで stylesheet_link_tag などで展開されるパスが
  # https://zacky1972.github.io/KK-SHiFT/stylesheets/*.css
  # のようになる
  activate :asset_hash
  activate :asset_host, :host => 'https://zacky1972.github.io/KK-SHiFT'
end

# デプロイの設定
# 今回は gh-pages を使用するので branch に 'gh-pages' を設定する
activate :deploy do |deploy|
  deploy.build_before = true
  deploy.deploy_method = :git
  deploy.branch = 'gh-pages'
end
