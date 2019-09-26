# tj-crawler

![alt text](https://i.imgur.com/k6ciXao.png)

### Um pouco sobre como foi feito o desafio ###

- Foi criado um endpoint `GET /processes` que irá buscar o processo;
- A interface foi feita com react consumindo o endpoint criado;
- Ao fazer a busca de um processo que ainda não existe no banco de dados, o crawler é chamado para pegar as informações do processo e é salvo no banco;
- Ao fazer a busca de um processo que já existe no banco, e o mesmo está desatualizado mais que 24horas, o crawler é chamado e os dados do processo é atualizado no banco;
- Ao fazer a busca de um processo que já existe no banco, e o mesmo está atualizado, NÃO é feita a chamada do crawler; 

### Demonstração ###
http://tj-crawler.herokuapp.com

### Instalação

Verifique antes se você tem instalado `ruby2.6.3`, `rails6`, `nodejs` e `postgres`. Para auxiliar na instalação dessas ferramentas no linux/windows/mac você pode seguir esse tutorial: https://gorails.com/setup/osx/10.14-mojave

Faça o clone do repositório:

```sh
$ cd
$ git@github.com:renanvy/tj-crawler.git
$ cd tj-crawler
```

### Instalando as dependências:

Para instalar as dependências do ruby, antes você precisa instalar o gerenciador de pacotes do ruby: 

```sh
gem install bundler
```

Agora você está pronto para instalar todas as dependências:

```sh
$ bundle install # dependências de backend
$ yarn install # dependências de frontend
```

### Banco de dados

Crie seu banco de dados e rode as migrations para criar as tabelas:
Obs: Certifique-se antes que você tem um usuário no postgres com o mesmo nome do usuário da sua máquina.

```sh
$ rails db:create # Cria o banco de desenvolvimento e o banco de testes
$ rails db:migrate # Cria as tabelas no banco de desenvolvimento e banco de testes
```

### Rodando o projeto

Inicie o servidor do rails:

```sh
$ rails s
```

Abra no seu browser a url: 

`http://localhost:3000`

### Rodando os testes de backend

```sh
$ rspec spec/
```

### Rodando os testes de frontend

```sh
$ yarn test
```

### Código de processos para serem utilizados na busca ###

- 0067154-55.2010.8.02.0001
- 0000575-40.2014.8.02.0081
- 0000214-28.2011.8.02.0081
- 0717561-98.2019.8.02.0001
- 0716715-81.2019.8.02.0001
- 0725703-91.2019.8.02.0001
