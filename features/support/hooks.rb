require 'selenium-webdriver'

Before do
    page.driver.browser.manage.window.maximize
    @acesso = AcessPage.new
    @home = HomePage.new
    @result = ResultadoBusca.new
    @sumary = SumaryPage.new 
    @conta = SigninPage.new
    @endereco = AdreessPage.new
    @remessa = ShippingPage.new
    @pagamento = PaymentPage.new
    @confirma = EvidenciaPage.new
end
  
After do
    Capybara.reset_sessions!
end

# time out
Capybara.default_max_wait_time = 30

#captura evidencia
After do |scenario|
    nome_cenario = scenario.name.tr(' ', '_').downcase!
    nome_cenario = nome_cenario.gsub(/([_@#!%()\-=;><,{}\~\[\]\.\/\?\"\*\^\$\+\-]+)/, '')
    screenshot = "logs/shots/#{nome_cenario}.png"
    page.save_screenshot(screenshot)
    embed(screenshot, 'image/png', 'Clique aqui para ver a evidência!')
end