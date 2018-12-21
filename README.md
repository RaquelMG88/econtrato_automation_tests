# Desafio de Automação DBServer

**Pré-Requisitos**

*Intalação do Ruby - Versão 2.3 ou superior

Bibliotecas principais do projeto, já existentes no Gemfile

*Cucumber

*Capybara

*Rspec

*Bundle

Driver 

*Chromedriver

Testes executados no ambiente Windows e MacOS, via navegador Chrome, após a execução na pasta raiz do projeto
é criado o arquivo "report.html" que pode ser vizualizado via web com a evidencia foco em anexo. São salvas automaticamente na pasta "logs" dentro do projeto.
As evidencias de execução ficam salvas na pasta "data" dentro do projeto, com a hora que foi realizado a compra.

**Baixar o projeto**

    git clone https://github.com/carvahpkd/desafio_dbserver.git

**Executar o comando para baixar as bibliotecas do projeto**

    bundle install

**Executar o projeto via console**

    cucumber
    bundle exec cucumbers
    cucumber -t @compra_ok

![evidencia_console](https://user-images.githubusercontent.com/21012745/50319411-65c8f480-04ae-11e9-8c0f-2e257d1ab7c7.jpg)
