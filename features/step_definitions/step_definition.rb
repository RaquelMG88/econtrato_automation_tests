# ======== LOGIN ===========

Dado("que eu esteja na tela inicial do Tecnobank") do
  visit "http://homologacao.tecnobank.com.br"
end

Quando("eu clicar no botão Acesse o Sistema") do
  find("a[href='/Login']").click
end

Quando("preencher o campo código com dados inválidos") do
  find("input[id='txtCdEntidade']").set "000"
  find("input[id='txtLogin']").set "rmendes"
  find("button[class='btn btn-lg btn-login']").click
end

Então("o sistema deve exibir alerta de  Código Inexistente") do
  expect(page).to have_content "Código Inexistente. Contate o suporte para maiores informações."
end

Quando("preencher o campo login com dados inválidos") do
  find("input[id='txtCdEntidade']").set "1001"
  find("input[id='txtLogin']").set "rmendss"
  find("button[class='btn btn-lg btn-login']").click
end

Então("o sistema deve exibir alerta de Usuário Inexistente") do
  expect(page).to have_content "Usuário Inexistente. Contate o suporte para maiores informações."
end

Quando("preencher os campos código e login com dados validos") do
  find("input[id='txtCdEntidade']").set "1001"
  find("input[id='txtLogin']").set "rmendes"
  find("button[class='btn btn-lg btn-login']").click
end

Quando("preencher a senha com dados inválidos") do
  find("input[value='2']").click
  find("input[value='3']").click
  find("input[value='0']").click
  find("input[value='4']").click
  find("input[value='1']").click
  find("input[value='7']").click
  find("input[id='Body_btnEntrar']").click
  page.execute_script("$('.bootbox-close-button').click();")
end

Então("deve exibir mensagem de alerta") do
  page.driver.browser.switch_to.alert.accept
end

Quando("preencher os campos com dados válidos") do
  find("input[id='txtCdEntidade']").set "1001"
  find("input[id='txtLogin']").set "rmendes"
  find("button[class='btn btn-lg btn-login']").click
  find("input[value='2']").click
  find("input[value='3']").click
  find("input[value='0']").click
  find("input[value='4']").click
  find("input[value='1']").click
  find("input[value='6']").click
  find("input[id='Body_btnEntrar']").click
  page.execute_script("$('.bootbox-close-button').click();")
end

Então("deve exibir a home logada") do
  expect(page).to have_content "Seja bem vindo, "
end

# ======== Registro de Contrato ===========

Quando("eu clicar no botão Registro de Contrato") do
  find("a[href='/eContrato/frmRegistroContrato.aspx']").click
end

Quando("preencher os dados do contrato do veiculo") do
  find("select[id='Body_ddlDsUf']").find("option", text: "SP").select_option
  sleep 3
  find("input[id='Body_txtDsFiltro']").set "LTEMAGEM1303"
  find("input[id='Body_btnPesquisarGravame']").click
  sleep 3
end

Quando("informar todos dados do Registro de Contrato") do
  #dados veiculo
  find("input[name$=txtDsMarca]").set ["Honda", "Toyota", "Fiat", "Ford", "GM"].sample
  find("input[name$=txtDsModelo]").set ["FOX", "UNO", "PALIO", "CIVIC"].sample
  find("select[name$=ddlEspecies]").find("option", text: "Automóvel").select_option

  #dados do contrato
  "0-1-1-2-2-0-2-4".reverse!.split("-").each do |digito|
    find("input[name$=txtDtContrato]").set digito
    sleep 0.5
  end
  find("input[name$=txtNuParcelas]").set "36"

  #dados complementares do contrato
  find("input[name$=txtVlTaxaMora]").set "2"
  find("input[name$=txtVlTaxaMulta]").set "2"
  find("input[name$=txtVlTaxaJurosMes]").set "1"
  find("input[name$=txtVlTaxaContrato]").set "2"
  find("input[name$=txtVlIOF]").set "2"
  find("input[name$=txtVlTaxaJurosAno]").set "8"
  find("input[name$=txtDsIndice]").set "2"
  find("input[name$=txtVlComissao]").set "40"
  find("input[name$=txtDsPenalidade]").set "2"
  find("input[name$=txtNmRecebedorPgto]").set "1"
  find("input[name$=txtNuDocRecebedor]").set "00000014141"
  find("input[name$=txtNuDocVendedor]").set "00000001406"

  #dados Financiamento
  find("input[name$=xtVlTotalFinanciamento]").set "50000"
  find("input[name$=txtVlParcela]").set "799"
  "0-1-1-2-2-0-1-9".reverse!.split("-").each do |digito|
    find("input[name$=txtDtLiberacaoCredito]").set digito
    sleep 0.5
  end
  find("select[name$=ddlCdMunicipioLiberacaoCredito]").all("option").sample.select_option
  "0-1-1-2-2-0-1-9".reverse!.split("-").each do |digito|
    find("input[name$=txtDtVencPrimeiraParcela]").set digito
    sleep 0.5
  end
  "0-1-1-2-2-0-2-4".reverse!.split("-").each do |digito|
    find("input[name$=txtDtVencUltimaParcela]").set digito
    sleep 0.5
  end

  # Dados do credor
  campo_cep = all("input[name$=txtDsCEP]")[0]
  "3-1-2-7-0-9-0-1".reverse!.split("-").each do |digito|
    campo_cep.set digito
    sleep 0.5
  end
  campo_cep.send_keys :tab
  sleep 3

  all("input[name$=txtDsNumero]")[0].set "544"
  all("input[name$=txtNuDDD]")[0].set "11"
  all("input[name$=txtNuTelefone]")[0].set "33334444"
  find("input[name$=txtNuDocumentoDevedor]").set "09.353.526/0001-20"

  #Dados do devedor
  campo_cep = all("input[name$=txtDsCEP]")[1]
  "3-1-2-7-0-9-0-1".reverse!.split("-").each do |digito|
    campo_cep.set digito
    sleep 0.5
  end
  campo_cep.send_keys :tab

  all("input[name$=txtDsNumero]")[1].set "544"
  all("input[name$=txtNuDDD]")[1].set "11"
  all("input[name$=txtNuTelefone]")[1].set "33334444"
  click_on "Registrar Contrato"
  sleep 2
  page.driver.browser.switch_to.alert.accept
end

Então("o contrato é incluido com sucesso") do
  #expect(page).to eql
end

#============Consulta Registro Contrato =======

Quando("eu clicar no botão Consulta  Registro do Contrato") do
  find("a[href='/eContrato/frmConsultaStatusRegContrato.aspx']").click
end

Quando("preencher os dados de consulta do contrato") do
  find("select[id='ddlUfPesquisa']").find("option", text: "SP").select_option
  find("select[id='Body_ddlOperacao']").find("option", text: "Registro de Contrato").select_option
  find("select[id='Body_ddlSituacaoRegistro']").find("option", text: "Ativo").select_option
  find("input[id='Body_btnSolicitar']").click
  sleep 6
  find("img[id='wucMensagens1_imgFechar']").click
end

E("clicar no botão visualizar") do
  find("input[id=Body_gridProcesso_btnConsultar_0]").click
end

#Então("o sistema exibe a tela Consulta Registro de Contrato") do
#find("div[id=LayerPrincipal]").set "Consulta Registro de Contrato"

#=============Consulta com dados inválidos ========
Quando("eu clicar no botão Consulta de Contrato") do
  find("a[href='/eContrato/frmConsultaStatusRegContrato.aspx']").click
end

E("preencher os dados de Consulta de Registro de Contrato com dados inválidos") do
  find("input[id='Body_txtNmCredor']").set "Mariaze"
  find("input[id='Body_txtNmDevedor']").set "Marioze"
  find("input[id='Body_txtDtIni']").set "00/09/0000"
  find("input[id='Body_btnSolicitar']").click
  sleep 6
end

Então("o sistema deve exibir alerta de contrato não localizado") do
  expect(page).to have_content "Contrato não localizado pela chave informada."
end

#===========Gerar Arquivo Excel Consulta==========
Quando("preencher os dados de Consulta de Registro de Contrato com dados válidos") do
  find("select[id='ddlUfPesquisa']").find("option", text: "SP").select_option
  find("select[id='Body_ddlOperacao']").find("option", text: "Registro de Contrato").select_option
  find("select[id='Body_ddlSituacaoRegistro']").find("option", text: "Ativo").select_option
  find("input[id='Body_btnSolicitar']").click
  sleep 6
  find("img[id='wucMensagens1_imgFechar']").click
end

#Quando("clicar no botão Gerar Excel") do
#find("a[href='javascript:__doPostBack('ctl00$Body$lnkExcel']").click

#Então("o sistema deve gerar o arquivo xls") do
#expect(page).to have_content "Consulta registro contrato"
#end

#==========Imprimir==========
Quando("eu clicar no Consulta de Contrato") do
  find("a[href='/eContrato/frmConsultaStatusRegContrato.aspx']").click
end

Quando("preencher os dados de Consulta de Contrato") do
  find("select[id='ddlUfPesquisa']").find("option", text: "SP").select_option
  find("select[id='Body_ddlOperacao']").find("option", text: "Alteração de Contrato").select_option
  find("select[id='Body_ddlSituacaoRegistro']").find("option", text: "Ativo").select_option
  find("input[id='Body_btnSolicitar']").click
  sleep 6
end

Quando("clicar no botão Imprimir") do
  find('img[src="/Imagens/impressora.png"]').click
end

#============Validação de campos obrigatorios - Registro de Contrato ======

Dado("que eu acesse o botão Registro de Contrato") do
  find("a[href='/eContrato/frmRegistroContrato.aspx']").click
end

Quando("preencher os dados do Registro do Contrato") do
  find("select[id='Body_ddlDsUf']").find("option", text: "SP").select_option
  sleep 3
  find("input[id='Body_txtDsFiltro']").set "LTEMAGEM1303"
  find("input[id='Body_btnPesquisarGravame']").click
  sleep 3
end

Quando("não informar os campos do contrato do veiculo e clicar em registrar") do
  find("input[value=' Registrar Contrato ']").click
  sleep 2
  page.driver.browser.switch_to.alert.accept
end

Então("o sistema exibe as mensagens de preenchimento obrigatório dos campos") do
  assert_text("Qtde de meses obrigatória.")
  assert_text("Preencha uma Taxa de juros de mora válida.")
  assert_text("Preencha uma Taxa de juros de multa válida.")
  assert_text("Índice obrigatório.")
  assert_text("Valor comissão obrigatório.")
  assert_text("Descrição da penalidade obrigatório.")
  assert_text("Valor total da dívida obrigatório.")
  assert_text("Data liberação do crédito obrigatória.")
  assert_text("Vencimento da 1ª parcela obrigatório.")
  assert_text("Vencimento da última parcela obrigatório.")
  assert_text("CEP obrigatório.")
  assert_text("Endereço obrigatório.")
  assert_text("DDD Telefone obrigatório.")
  assert_text("Telefone obrigatório.")
end
