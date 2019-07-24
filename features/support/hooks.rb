Before do
  @cadastro_page = CadastroPage.new
  @login_page = LoginPage.new
  @navbar = Navbar.new
end

Before('@limpa_usuario') do
  visit '/api/reset/samara@teste.com?clean=full'
  visit '/api/reset/samara2@teste.com?clean=full'
end

After('@logout') do
  visit '/logout'
  sleep 2
end
