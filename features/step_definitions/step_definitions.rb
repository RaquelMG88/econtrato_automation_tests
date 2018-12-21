Dado("que eu esteja na página de compras") do
    @acesso.url
end
  
Quando("selecionar um produto na loja virtual") do
    @home.buscar_produto
end
  
Quando("adicionar esse produto ao carrinho") do
    @result.seleciona_produto
    @sumary.checkout
end
  
Quando("efetuar meu cadastro no site de compras") do
    @conta.criar_conta
    @conta.preencher_cadastro
    @endereco.confirmar_endereco
    @remessa.aceitar_termos
end
  
Quando("realizar o pagamento") do
    @pagamento.pagar_cheque
end
  
Então("eu finalizo o meu pedido com sucesso") do
    @confirma.confirmacao
    @confirma.confirma_compra
end