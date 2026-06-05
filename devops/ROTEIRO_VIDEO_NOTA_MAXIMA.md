# Roteiro de vídeo - DevOps + Cloud

## Abertura
Meu nome é Felipe Wiclif Leal da Silva, RM 563901, e vou apresentar a entrega de DevOps Tools & Cloud Computing da solução AgroOrbit.

A AgroOrbit é uma API Java Spring Boot para monitoramento agrícola. Nesta disciplina, o foco foi conteinerizar a aplicação e criar um ambiente em nuvem com dois containers integrados: aplicação e banco PostgreSQL.

## 1. Mostrar GitHub e README
Mostrar o README com:
- descrição da solução;
- arquitetura macro;
- How To;
- comandos de execução;
- integrantes.

Fala: "O README contém tudo que é necessário para executar o projeto desde o clone do repositório ate os testes em nuvem."

## 2. Mostrar arquitetura macro
Mostrar a imagem da arquitetura.

Fala: "O usuário acessa o Swagger pelo IP público da VM. A VM executa Docker. Dentro dela, temos o container da aplicação e o container do banco PostgreSQL na mesma rede Docker. O banco usa volume nomeado para persistência."

## 3. Clonar repositório na VM
```bash
git clone LINK_DO_GITHUB
cd NOME_DO_REPOSITORIO
```

## 4. Subir containers
```bash
docker compose up -d --build
```

Fala: "Esse comando constrói a imagem personalizada da aplicação e sobe a aplicação e o banco em segundo plano."

## 5. Mostrar containers
```bash
docker ps
```

Mostrar:
- agroorbit-app-rm563901
- agroorbit-db-rm563901

## 6. Mostrar logs
```bash
docker logs agroorbit-app-rm563901
docker logs agroorbit-db-rm563901
```

## 7. Entrar no app
```bash
docker exec -it agroorbit-app-rm563901 sh
pwd
ls -l
whoami
exit
```

Fala: "O whoami mostra que a aplicação executa com usuário agroorbituser, não root."

## 8. Entrar no banco
```bash
docker exec -it agroorbit-db-rm563901 psql -U postgres -d agroorbit
\dt
SELECT * FROM tb_user;
SELECT * FROM tb_farm;
SELECT * FROM tb_crop_area;
\q
```

Fala: "Aqui estou conectado diretamente no container do banco, demonstrando as tabelas e a persistência."

## 9. Swagger em nuvem
Abrir:

```text
http://IP_PUBLICO_DA_VM:8080/swagger-ui.html
```

Executar endpoints:
- Dashboard
- Users
- Farms
- Crop Areas

## Fechamento
Com isso, demonstrei Dockerfile, Docker Compose, container de aplicação, container de banco, rede, volume nomeado, variáveis de ambiente, usuário não-root, logs, docker exec, SELECT no banco e Swagger funcionando em nuvem.
