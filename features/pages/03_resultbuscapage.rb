class ResultadoBusca
    
    elementos = [ 
        :produto_escolhido, :add_cart, :more, :checkout,
    ]
    
    attr_reader *elementos           

    include Capybara::DSL

    def initialize
        @produto_escolhido   = "img[title='Blouse']"
        @more                = "a[title='View']"
        @add_cart            = "p[id='add_to_cart']"
        @checkout            = "a[class='btn btn-default button button-medium']"
    end

        def seleciona_produto
            find(produto_escolhido).hover
            find(more).click
            find(add_cart).click
            find(checkout).click
        end
end


