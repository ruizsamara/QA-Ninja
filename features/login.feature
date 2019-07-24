#language: pt

Funcionalidade: Login
    Para que somente eu possa ver as minhas tasks
    Sendo um usuario cadastrado
    Posso logar no sistema

    #depois de implementar, transformar os cenários sem sucesso para cenário outline (esquema do cenário)

    Contexto: Formulário de Login
        Dado que acessei o formulário de login

    @logout
    Cenario: Login do usuario

        Quando faço login com "samararuiz@gmail.com" e senha "123456"
        Então sou autenticado com sucesso

    @doing_login
    Esquema do Cenario: Campos obrigatórios

        Quando faço login com "<email>" e senha "<senha>"
        Então vejo uma mensagem de alerta "<saida>"

    Exemplos:
      | email                | senha   | saida                                  |
      | samara@teste.com     | xpto123 | Incorrect password                     |
      | s@gmail.com          | xpto123 | Usuário não cadastrado.                |
      | samararuiz#gmail.com | 123456  | Email incorreto ou ausente.            |
      | samararuiz@gmail.com | 123     | Senha deve ter no mínimo 6 caracteres. |
      | samararuiz@gmail.com |         | Senha ausente.                         |
    
    # Cenario: Senha inválida

    #     Quando faço login com "samararuiz@gmail.com" e senha "xpto123"
    #     Então vejo a mensagem de alerta "Senha inválida."

    # Cenario: Usuário não cadastrado

    #     Quando faço login com "s@gmail.com" e senha "xpto123"
    #     Então vejo a mensagem de alerta "Usuário não cadastrado."

    # Cenario: Email incorreto

    #     Quando faço login com "samararuiz#gmail.comm" e senha "123456"
    #     Então vejo a mensagem de alerta "Email incorreto ou ausente."