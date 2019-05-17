#language: pt

    Funcionalidade: Validar os campos do Registro de Contrato
        Eu como usuário do sistema, desejo validar o comportamento da tela
        utilizando algumas consultas

Contexto: Acessar a site do Tecnobank
    Dado que eu esteja na tela inicial do Tecnobank
    Quando eu clicar no botão Acesse o Sistema 
    E preencher os campos com dados válidos

@contratosucesso
Cenário: Registro de Contrato válido
    Quando eu clicar no botão Registro de Contrato
    E preencher os dados do contrato do veiculo 
    E informar todos dados do Registro de Contrato
    Então o contrato é incluido com sucesso






