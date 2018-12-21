class HomePage
    
    elementos = [ 
        :search, :btn_busca, :women, :dresses, :t_shirts,
        :top_blouse,
    ]
    
    attr_reader *elementos
  
    include Capybara::DSL
  
    def initialize
        @search      = "input[id='search_query_top']"
        @btn_busca   = "button[name='submit_search']" 
        @women       = "a[title='Women']"
        @top_blouse  = "a[title='Blouses']"
        @dresses     = "a[title='Dresses']"
        @t_shirts    = "a[title='T-shirts']"
    end
  
        def buscar_produto
            find(@search).set "blouses"
            find(btn_busca).click
        end
            def bucar_produto_women
                find(women).hover
                find(top_blouse).click
            end
end
