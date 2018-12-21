class AdreessPage
    
    elementos = [ 
        :btn_avancar,
    ]
    
    attr_reader *elementos           

    include Capybara::DSL

    def initialize
        @btn_avancar    = "button[name='processAddress']"
    end
 
        def confirmar_endereco
            find(btn_avancar).click
            sleep 2    
        end
end


class ShippingPage
    
    elementos = [ 
        :aceitar_termos, :confirma_check,
    ]
    
    attr_reader *elementos           

    include Capybara::DSL

    def initialize
        @aceitar_termos = "div[id='uniform-cgv']"   
        @confirma_check = "button[class='button btn btn-default standard-checkout button-medium']"   
    end

        def aceitar_termos
            execute_script('window.scroll(0,250);')
            within("p[class='checkbox']") do
                find("div[id='uniform-cgv']" ).click();
            end
            find(confirma_check).click 
        end
end

class PaymentPage
    
    elementos = [ 
        :pay_bank, :pay_check, :confirma_pagto,
    ]
    
    attr_reader *elementos           

    include Capybara::DSL

    def initialize
        @pay_bank = "a[title='Pay by bank wire']"
        @pay_check = "a[title='Pay by check.']"
        @confirma_pagto = "button[class='button btn btn-default button-medium']"    
    end  

        def pagar_transferencia
            find(pay_bank).click
            find(confirma_pagto).click
            sleep 2
        end

            def pagar_cheque
                find(pay_check).click
                find(confirma_pagto).click
                sleep 2 
            end
end

class EvidenciaPage

    elementos = [ 
        :back_orders, :pay_check, :confirma_pagto,
    ]
    
    attr_reader *elementos           

    include Capybara::DSL

    def initialize
        @back_orders = "a[title='Back to orders']"
        @pay_check = "a[title='Pay by check.']"
        @confirma_pagto = "button[type='submit']"    
    end
        
        def confirmacao
            assert_text('Your order on My Store is complete.')
            execute_script('window.scroll(0,350);')
            save_screenshot("data/#{Time.now.strftime('%HH%MM%SS')}pedido.png")  
        end
        
        def confirma_compra
            find(back_orders).click
            assert_text('ORDER HISTORY')
            save_screenshot("data/#{Time.now.strftime('%HH%MM%SS')}pedido.png")
        end
end
      


