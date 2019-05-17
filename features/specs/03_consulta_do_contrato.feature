#language: pt

    Funcionalidade: Consulta Registro de Contrato
        Eu como usuário do sistema, desejo validar o comportamento da tela
        utilizando algumas consultas

Contexto: Acessar a site do Tecnobank
    Dado que eu esteja na tela inicial do Tecnobank
    Quando eu clicar no botão Acesse o Sistema 
    E preencher os campos com dados válidos

@consultasucesso
Cenário: Consulta Registro do Contrato válido
    Quando eu clicar no botão Consulta  Registro do Contrato
    E preencher os dados de consulta do contrato 
    E clicar no botão visualizar 
    Então o sistema exibe a tela Consulta Registro de Contrato

@consultadadosinvalidos
Cenário: Consulta de Registro de Contrato com dados inválidos
    Quando eu clicar no botão Consulta de Contrato
    E preencher os dados de Consulta de Registro de Contrato com dados inválidos
    Então o sistema deve exibir alerta de contrato não localizado

@gerarexcel
Cenário: Gerar Excell
    Quando eu clicar no botão Consulta de Contrato
    E preencher os dados de Consulta de Registro de Contrato com dados válidos
    E clicar no botão Gerar Excel
    Então o sistema deve gerar o arquivo xls

@imprimir
Cenário: Imprimir 
    Quando eu clicar no Consulta de Contrato
    E preencher os dados de Consulta de Contrato  
    Quando clicar no botão Imprimir
  



