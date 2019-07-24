Dado('que acessei o formulário de login') do
  # visit '/login'
  @login_page.load
end

Quando('faço login com {string} e senha {string}') do |email, senha|
  # SEM PageObject
  #   find('#login_email').set email
  #   find('#login_password').set senha
  # ID Dinâmico - CSS Selector (Expressão Regular)
  # * - procula o btnLogin dentro do ID
  # $ - procura o btnLogin no final do ID
  # ^ - procuta o btnLogin no início do ID
  #   find('button[id*=btnLogin]').click

  # find('.btn-accent').click

  # COM PageObject
  #   @login_page = LoginPage.new

  #   @login_page.campo_email.set email
  #   @login_page.campo_senha.set senha
  #   @login_page.botao_entrar.click

  # COM PageObject e Encapsulamento (método)

  @login_page.logar(email, senha)

  @email = email
end

Então('sou autenticado com sucesso') do
  # validar por sessões.
  # Procurar o email na sessão navbar e não na página inteira
  #navbar = find('.navbar')
  expect(@navbar_page.nav).to have_content @email
end

Então('vejo uma mensagem de alerta {string}') do |mensagem_alerta|
  expect(@login_page.alerta.text).to eql mensagem_alerta
end
