#language: pt
#executar documentação cucumber features/cadastro.feature
Funcionalidade: Cadastro de Usuários do Sistema

    Sendo um visitante
    Quero fazer meu cadastro
    Para gerenciar minhas atividades

    # 1 - Cadastro simples
    # Nome, E-mail e a Senha do Usuário

    # RN1: Email deve ser chave e unique
    # RN2: Todos os campos são obrigatórios para preenchimento
    # RN3: A senha do cliente deve ter no mínimo 6 caracteres

    Contexto: Formuário
    Dado que estou no formulário de cadastro

    #utilizado dentro do arquivo hooks.rb
    @logout @limpa_usuario  
    Cenário: Cadastro simples
    # Dado que estou no formulário de cadastro
    E possuo os seguintes dados:
      | nome  | Samara            |
      | email | samara@teste.com  |
      | senha | 123456            |
    Quando faço o meu cadastro
    Então vejo a mensagem "Olá, Samara"

    #@doing #executar essa tag cucumber --tag @doing
    Cenário: Senha com no mínimo 6 caracteres
    # Dado que estou no formulário de cadastro
    E possuo os seguintes dados:
      | nome  | Samara            |
      | email | samara@teste.com  |
      | senha | 12345             |
    Quando faço o meu cadastro
    Então vejo a mensagem de alerta "Sua senha deve ter pelo menos 6 caracteres."

    #@doing #executar essa tag cucumber --tag @doing
    @limpa_usuario 
    Cenário: Email inválido
    # Dado que estou no formulário de cadastro
    E possuo os seguintes dados:
      | nome  | Samara            |
      | email | samara&teste.com  |
      | senha | 123456            |
    Quando faço o meu cadastro
    Então vejo a mensagem de alerta "Informe um email válido."

    @limpa_usuario @duplicado #executar essa tag cucumber --tag @doing
    Cenário: Cadastro duplicado
    # Dado que estou no formulário de cadastro
    E possuo os seguintes dados:
      | nome  | Samara            |
      | email | samara2@teste.com |
      | senha | 123456            |
    Mas já existe um cadastro para o email informado
    Quando faço o meu cadastro
    Então vejo a mensagem de alerta "Email já existe."

    @required
    #Cenário Outline
    Esquema do Cenário: Campos obrigatório
    # Dado que estou no formulário de cadastro
    E possuo os seguintes dados:
      | nome  | <nome>   |
      | email | <email>  |
      | senha | <senha>  |
    Mas já existe um cadastro para o email informado
    Quando faço o meu cadastro
    Então vejo a mensagem de alerta "<saida>"

    Exemplos:
      | nome   | email             | senha  | saida                |
      |        | samara2@teste.com | 123456 | Nome é obrigatório.  |
      | Samara |                   | 123456 | Email é obrigatório. |
      | Samara | samara2@teste.com |        | Informe uma senha.   |

    # @required
    # Cenário: Nome é obrigatório
    # Dado que estou no formulário de cadastro
    # E possuo os seguintes dados:
    #   | email | samara2@teste.com |
    #   | senha | 123456            |
    # Mas já existe um cadastro para o email informado
    # Quando faço o meu cadastro
    # Então vejo a mensagem de alerta "Nome é obrigatório."

    # @required
    # Cenário: Email é obrigatório
    # Dado que estou no formulário de cadastro
    # E possuo os seguintes dados:
    #   | nome  | Samara            |
    #   | senha | 123456            |
    # Mas já existe um cadastro para o email informado
    # Quando faço o meu cadastro
    # Então vejo a mensagem de alerta "Email é obrigatório."

    # @required
    # Cenário: Senha é obrigatória
    # Dado que estou no formulário de cadastro
    # E possuo os seguintes dados:
    #   | nome  | Samara            |
    #   | email | samara2@teste.com |
    # Mas já existe um cadastro para o email informado
    # Quando faço o meu cadastro
    # Então vejo a mensagem de alerta "Informe uma senha."

    