#language: pt
@validacao_campos_obrigatorios
    Funcionalidade: Validar os campos do Registro de Contrato
        Eu como usuário do sistema, desejo validar o comportamento dos campos da tela
        

Contexto: Acessar o site do Tecnobank
    Dado que eu esteja na tela inicial do Tecnobank
    Quando eu clicar no botão Acesse o Sistema 
    E preencher os campos com dados válidos

Cenário: Validacao de campos do Registro do Contrato
    Dado que eu acesse o botão Registro de Contrato
    Quando preencher os dados do Registro do Contrato
    E não informar os campos do contrato do veiculo e clicar em registrar
    Então o sistema exibe as mensagens de preenchimento obrigatório dos campos


#@validacao_campo_email
#Cenário: Email inválido
#Dado que eu preencha o campo 

