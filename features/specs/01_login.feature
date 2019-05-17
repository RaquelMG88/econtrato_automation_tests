#language: pt

Funcionalidade: Fazer um login

Contexto: Acessar a site do Tecnobank
    Dado que eu esteja na tela inicial do Tecnobank

@codigoinvalido
Cenário: Código inválido
    Quando eu clicar no botão Acesse o Sistema 
    E preencher o campo código com dados inválidos
    Então o sistema deve exibir alerta de  Código Inexistente  

@logininvalido
 Cenário: Login inválido
    Quando eu clicar no botão Acesse o Sistema 
    E preencher o campo login com dados inválidos
    Então o sistema deve exibir alerta de Usuário Inexistente 

@loginsucesso
Cenário: Login sucesso
    Quando eu clicar no botão Acesse o Sistema 
    E preencher os campos com dados válidos
    Então deve exibir a home logada 


@senhaincorreta 
Cenário: Senha incorreta 
    Quando eu clicar no botão Acesse o Sistema 
    E preencher os campos código e login com dados validos 
    E preencher a senha com dados inválidos 
    Então deve exibir mensagem de alerta
    




