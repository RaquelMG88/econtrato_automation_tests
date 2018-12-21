#language: pt

    Funcionalidade: Realizar Uma Compra Com Sucesso
        Eu como usuário do site, desejo realizar a compra
        de produtos com sucesso 

    Contexto: Acessar o site My Store
        Dado que eu esteja na página de compras

@compra_ok
    Cenário: Adicionar um produto ao carrinho e realizar a compra
        Quando selecionar um produto na loja virtual 
            E adicionar esse produto ao carrinho
            E efetuar meu cadastro no site de compras
            E realizar o pagamento
        Então eu finalizo o meu pedido com sucesso