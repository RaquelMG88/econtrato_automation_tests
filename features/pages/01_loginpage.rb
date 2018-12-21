class AcessPage
  include Capybara::DSL

  def url
    visit '/' 
  end
end

