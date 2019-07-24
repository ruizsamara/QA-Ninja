#LoginPage e a classe que representa a página Login
class LoginPage < SitePrism::Page
  #   def campo_email
  #     find('#login_email')
  #   end

  # Com a importacao do SitePrism, não e necessário criar um metodo. Apenas utilizar um elemento
  set_url '/login'
  element :campo_email, '#login_email'
  element :campo_senha, '#login_password'
  element :botao_entrar, 'button[id*=btnLogin]'
  element :alerta, '.alert-login'

  def logar(email, senha)
    campo_email.set email
    campo_senha.set senha
    botao_entrar.click
  end
end
