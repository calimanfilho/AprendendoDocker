## Aplicação Web em um Contêiner Apache HTTPD
Neste projeto, que faz parte de uma série de aulas da [DIO](https://www.dio.me/), será utilizado o Docker Compose para executar uma aplicação HTML em um contêiner Apache.


Estrutura do projeto:
```
.
├── compose.yaml
├── README.md
└── website
    └── index.html
```

[_compose.yaml_](compose.yaml)
```
version: '3.9'
services:
  apache:
    image: httpd:latest
    container_name: my-apache-app
    ports:
    - '80:80'
    volumes:
    - ./website:/usr/local/apache2/htdocs
```

Ao implantar essa configuração, o docker compose mapeia a porta 80 do contêiner apache para a porta 80 do host, conforme especificado no arquivo Compose. Certifique-se de que a porta 80 no host ainda não esteja em uso.

## Implantar com Docker Compose

A primeira coisa que deve ser feita é instalar o Docker Compose:
```
apt install docker-compose
```
Depois de instalado, execute o compose em segundo plano:

> ℹ️ **_INFO_**  
> O comando `docker compose up -d` deve ser executado dentro do diretório do projeto, que deve possuir exclusivamente todos os arquivos do projeto.

```
$ docker compose up -d
Creating my-apache-app    ... done
```


## Resultado Esperado

Verifique se os contêineres estão em execução e o mapeamento de portas:
```
$ docker container ls
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                               NAMES
c1412a78aff88       httpd:latest        "httpd-foreground"       35 seconds ago      Up 34 seconds       0.0.0.0:80->80/tcp, :::80->80/tcp   my-apache-app
```

Navegue até http://localhost:80 em seu navegador da Web para acessar o serviço Apache instalado.

Ao fim, pare e remova os contêiner.

```
$ docker compose down
```

Para excluir todos os dados, remova todos os _named volumes_ passando os argumentos `-v`:
```
$ docker compose down -v
```