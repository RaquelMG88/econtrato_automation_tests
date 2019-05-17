#language: pt

    Funcionalidade: Registro Aditivo de Contrato
        Eu como usuário do sistema, desejo validar o comportamento da tela
        
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

# @contratosucesso
# Cenário: Consulta de Registro de Contrato inválido
#     Quando eu clicar no botão Registro de Contrato
#     E preencher os dados do contrato do veiculo 
#     E informar todos dados do Registro de Contrato
#     Então o contrato é incluido com sucesso





