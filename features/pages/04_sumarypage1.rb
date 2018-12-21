class SumaryPage
    
    elementos = [ 
        :excluir, :btn_check,
    ]
    
    attr_reader *elementos           

    include Capybara::DSL

    def initialize
        @excluir    = "a[title='Delete']"
        @btn_check  = "a[class='button btn btn-default standard-checkout button-medium']"
    end

        def checkout
            assert_text('Blouse')
            find(btn_check).click
        end
end


class SigninPage

    elementos = [ 
        :email_create, :btn_create, :email, :password, :btn_entrar,
        :radio_mr, :radio_ms, :first_name, :last_name, :senha,
        :dia_niver, :mes_niver, :ano_niver, :check_newsletter, :check_receive,
        :addrees, :city, :state, :zipcode, :country, :add_inf, :cel_phone, :assign, :btn_register,

    ]

    attr_reader *elementos           

    include Capybara::DSL

    def initialize
        @email_create   = "input[id='email_create']"
        @btn_create     = "button[id='SubmitCreate']"
        @email          = "input[id='email']"
        @password       = "input[id='passwd']"
        @btn_entrar     = "button[id='SubmitLogin']"

        @radio_mr       = "label[for='id_gender1']"
        @radio_ms       = "label[for='id_gender2']"
        @first_name     = "input[id='customer_firstname']"
        @last_name      = "input[id='customer_lastname']"
        @senha          = "input[id='passwd']"
        @dia_niver      = "div[id='uniform-days']"
        @mes_niver      = "div[id='uniform-months']"
        @ano_niver      = "div[id='uniform-years']"
        @check_newsletter   = "div[id='uniform-newsletter']"
        @check_receive  = "div[id='uniform-optin']"     
        @addrees        = "input[id='address1']"
        @city           = "input[id='city']"
        @state          = "div[id='uniform-id_state']"
        @zipcode        = "input[id='postcode']" 
        @country        = "div[id='uniform-id_country']"
        @add_inf        = "textarea[id='other']"
        @cel_phone      = "input[name='phone_mobile']"
        @assign         = "input[id='alias']"
        @btn_register   = "button[class='btn btn-default button button-medium']"
    end
    
        def criar_conta
            find(email_create).set "#{Faker::Name.first_name}@mailinator.com"
            find(btn_create).click
        end

            def preencher_cadastro
                find(radio_mr).click();
                find(first_name).set Faker::Name.first_name 
                find(last_name).set Faker::Name.last_name
                find(senha).set "123456"
                find(dia_niver).select ('21')
                find(mes_niver).select ('April')
                find(ano_niver).select ('1980')
                find(check_newsletter).click
                find(addrees).set Faker::Address.street_name
                find(city).set Faker::Address.city
                find(state).select ('Florida') 
                find(zipcode).set "43199"
                find(country).select ('United States')
                find(add_inf).set "Testes Campo Area"
                find(cel_phone).set Faker::PhoneNumber.cell_phone
                find(btn_register).click
            end

                def conta_existente
                    find(email).set        "email.teste@mailinator.com"   
                    find(password).set      "123456"
                    find(btn_entrar).click
                end
end


