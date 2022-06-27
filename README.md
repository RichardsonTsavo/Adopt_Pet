# adopt_pet

Desafio WaProject

Link do APK do APP: https://drive.google.com/file/d/16IZhguHLchkbho_yYgWMmePuEXBAX9n0/view?usp=sharing

<img src="https://user-images.githubusercontent.com/57848633/175938602-91aa6b80-0e70-4df0-9cf6-aeb90488d0d0.png" width="200">  
<img src="https://user-images.githubusercontent.com/57848633/175938608-d7e99474-2a77-4e04-b667-da95420dfd22.png" width="200">  
<img src="https://user-images.githubusercontent.com/57848633/175938611-f18e5897-5143-4cfa-978e-0970abcb60bf.png" width="200">  
<img src="https://user-images.githubusercontent.com/57848633/175938615-f810649e-4f19-4833-bde9-273708135658.png" width="200">
<img src="https://user-images.githubusercontent.com/57848633/175938617-b7f77976-91e1-4b8a-9839-19686f37d0c6.png" width="200">
<img src="https://user-images.githubusercontent.com/57848633/175938623-46faf3d7-a361-4a3b-ae54-fd96aae72e8b.png" width="200">
<img src="https://user-images.githubusercontent.com/57848633/175938632-6700dab7-4393-4b4f-9760-29679b7dbfc5.png" width="200">
<img src="https://user-images.githubusercontent.com/57848633/175938640-16f6e758-c4f5-42b7-a3f0-57730fbb6b71.png" width="200">

# Documentação

Olá! você está no projeto AdoptPet, um app feito para um desafio proposto pela empresa WaProject, aqui você vai encontrar tudo que precisa saber sobre o projeto, desde a sua estrutura, tecnologias e recursos.

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
 - Para a estrutura do projeto decidi utilizar o Flutter modular e o Repository patern assim facilitando na criando singletons utilizados por todo o app, além de separar as requisições por arquivos com contratos assim centralizando todas as informações das requisições.
 
* Controle de estado:
 - Para o controle do estado de cada widget na tela o Mobx cuida de atualizar somente o widget necessário para cada momento assim otimizando o gasto de processamento.

* Login:
 - Para o login foi criado um arquivo json utilizado como banco de dados com as informações dos usuários gerados pelo Site: https://randomuser.me/ 

 - informaçoes do json:
 ```yaml
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

  - Como pode ver dentro de cada usuário tem as suas devidas informações como email (Utilizado para o login) e o tipo de conta utilizado para mostrar algumas informações a mais no app

  - A partir desses dados foi gerado um Model para organização de informações e um repositório para controle de tais informações.


* Login Persistente:
 - Para o login persistente foi utilizado um package chamado Shared Preference onde ao efetuar o login o sistema guarda na memória o email do usuário criptografado em base64 assim ao abrir ou fechar o app o sistema mantem o usuário logado.

 * Requisições:
  - Para as requisições externas o projeto utiliza o package Dio que permite fazer as requisições de forma simples e descomplicadas.

 * Customizações:
  - Costumo criar arquivos customizados de alguns Widgets e funções para facilitar a minha vida, então na pasta shared/utils irá ter alguns componentes como um CustomTextFormField que me permite agilizar a produção de formulários.

 * Design:
  - Essa sinceramente foi a parte mais fácil, pois como o tema Pet costuma utilizar cores bem vibrantes foi simples encontrar imagens para me basear, então tudo foi questão de pesquisa no Google.
