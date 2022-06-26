# adopt_pet

Desafio WaProject

Link do APK do APP: https://drive.google.com/file/d/1FwC2NKat_UrgNJrEw_A2XnPLd4sGH0iI/view?usp=sharing

<img src="https://drive.google.com/file/d/1S9JdGsluM2JGXvCATVFfjfAHoA-lv58o/view?usp=sharing" width="200">  
<img src="https://drive.google.com/file/d/1MhJWrnFCzkaWYKLiGawFgYmJifuP4F_D/view?usp=sharing" width="200">  
<img src="https://drive.google.com/file/d/1KBXqqj8ClB29utN9chkBep_KjFDSIB4p/view?usp=sharing" width="200">  
<img src="https://drive.google.com/file/d/1zOg69Winw8r9TBHhg_eOs6HRf7kr8CkB/view?usp=sharing" width="200">
<img src="https://drive.google.com/file/d/1d8D5naOVYV_s6f9VuQOK9etwh8m8QdKc/view?usp=sharing" width="200">
<img src="https://drive.google.com/file/d/1kQIx4yyMMv8E9oqCbLKJpJ5sXS6IX_Um/view?usp=sharing" width="200">
<img src="https://drive.google.com/file/d/1lkjUDuf0qYI86wvTa9-r-K0mkyOiAqnr/view?usp=sharing" width="200">
<img src="https://drive.google.com/file/d/12zAKiWDyy2-6yMWhyR3rK6iE_yFP1jzY/view?usp=sharing" width="200">

# Documentação

Olá, você está no projeto AdoptPet, um app feito para um desafio proposto pela empresa WaProject, aqui você vai encontrar tudo que você precisa saber sobre o projeto desde sua estrutura, tecnologias e recursos

* Tecnologias e Recursos
 - Flutter
 - Flutter Modular
 - Dio
 - Login pelo email com distinção de tipo de conta (Adm e Comum) 
 - Login persistente com shared preference
 - Sistema de troca de cores base do app
 - Listagem dos pets separado pela raça
 - Visualização das informações dos pets


* Estrutura:
 - Para a estrutura do projeto decidi utilizar o Flutter modular e o Repository patern assim facilintando na criando singletons que são utilizados por todo o app, além de separar as requisições por arquivos com contratos assim centralizando todas as informações das requisições.
 
* Controle de estado:
 Para o controle do estado de cada widget na tela o Mobx cuida de atualizar somente o widget nescessario para cada momento assim otimizando o gasto de processamento pelo app.

* Login:
 - Para o login foi criado um arquivo json que é utilizado como banco de dados com as informações de usuários gerados pelo Site: https://randomuser.me/ 

 - informaçoes do json:
 {
    "users": [
      {
        "userName": "Ethel Fletcher",
        "userTipe": "comum",
        "userEmail": "ethel.fletcher@example.com",
        "userBirthday": "02/02/1993",
        "userAddress": "5211 E North St",
        "userPhone": "(451)-503-3034"
      },
      {
        "userName": "Marjorie Gonzales",
        "userTipe": "comum",
        "userEmail": "marjorie.gonzales@example.com",
        "userBirthday": "05/07/1964",
        "userAddress": "8817 Pecan Acres Ln",
        "userPhone": "(891)-682-1950"
      },
      {
        "userName": "Nicole Carroll",
        "userTipe": "adm",
        "userEmail": "nicole.carroll@example.com",
        "userBirthday": "01/04/1995",
        "userAddress": "8949 Thornridge Cir",
        "userPhone": "(292)-844-6344"
      },
    ]
  };

  - Como pode ver dentro de cada usuário tem as suas devidas informações como email(Utilizado para o login e o tipo deconta que é utilizado para mostrar algumas informações a mais dentro do app)

  - A partir desses dados foi gerado um Model para organização de informações e um repositório para controle de tais informações.


* Login Persistente:
 - Para o login persistente foi utilizado um package chamado Shared Preference na qual ao fazer login o sistema guarda na memoria o email do usuário criptografado em base64 assim ao abrir ou fechar o app o sistema mantem o usuário logado.

 * Requisições:
  - Para as requisições externas o projeto utiliza o package Dio que permite fazer as requisições de forma simples e descomplicadas.

 * Customizações:
  - Costumo criar arquivos constumizados de alguns Widgets e funções para facilitar a minha vida, então dentro da pasta shared/utils irá ter alguns componentes como um TextFormFild customizado que me permite agilizar a produção de algumas telas.

 * Design:
  - Essa sinceramente foi a parte mais facil, pois como o tema Pet costuma utilizar cores bem vibrantes foi facil encontrar imagens para me basear, então tudo foi feito com carinho para se tornar um app Simples mas gostoso de se ver. 