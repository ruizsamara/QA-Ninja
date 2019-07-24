Dado('que estou no formulário de cadastro') do
  @cadastro_page.load
end

Dado('possuo os seguintes dados:') do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  @usuario = table.rows_hash # rows_hash converte a tabela em um objeto
  # puts @usuario[:nome]
  # puts @usuario[:email]
  # puts @usuario[:senha]
end

Dado('já existe um cadastro para o email informado') do
  @cadastro_page.cadastrar(@usuario)
  @navbar.wait_for_nav
  @navbar_page.deslogar
  @cadastro_page.wait_for_form
  @cadastro_page.load
end

Quando('faço o meu cadastro') do
  #   find('#register_name').set @usuario[:nome]
  #   find('input[name=register_email]').set @usuario[:email]
  #   find('input[type=password]').set @usuario[:senha]

  #   find('button[type=submit').click # link text: click_button 'Cadastrar'

  @cadastro_page.cadastrar(@usuario)
end

Então('vejo a mensagem {string}') do |ola_usuario|
  expect(page).to have_content ola_usuario
end

Então('vejo a mensagem de alerta {string}') do |mensagem_alerta|
  expect(@cadastro_page.alerta.text).to eql mensagem_alerta
end
