###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration

configure :development do
  # Reload the browser automatically whenever files change
  activate :livereload
end

###
# Helpers
###

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
  # set :http_prefix, '/offcourse-documentation-middleman/'
end

# Activate the blog gems for both the story and the articles

activate :blog do |blog|
  blog.name = "blocks"
  blog.sources = "content/story-blocks/{title}.html"
  blog.permalink = "story/{title}.html"
end

activate :blog do |blog|
  blog.name = "publications"
  blog.sources = "content/publications/{title}.html"
  blog.permalink = "publications/{title}.html"
end

activate :blog do |blog|
  blog.name = "projects"
  blog.sources = "content/projects/{title}.html"
  blog.permalink = "projects/{title}.html"
end
