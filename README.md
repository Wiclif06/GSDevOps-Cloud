# AgroOrbit - DevOps Tools & Cloud Computing

## Integrantes

| Nome | RM |
|------|------|
| Lucas Gonçalves Viana | 563254 |
| Deryk de Souza Queiroz | 563412 |
| Vinicius Paschoeto da Silva | 563089 |
| Felipe Wiclif Leal da Silva | 563901 |

## Descrição da solução

A AgroOrbit é uma solução de monitoramento agrícola conectada ao tema da Global Solution 2026/1: Economia Espacial.  
A aplicação utiliza dados de sensores, indicadores climáticos e dados satelitais para apoiar produtores rurais na tomada de decisão.

Nesta entrega de **DevOps Tools & Cloud Computing**, a API Java Spring Boot da AgroOrbit foi conteinerizada com Docker e integrada a um banco PostgreSQL em container separado.

## Arquitetura macro da solução

![Arquitetura Macro](docs/arquitetura_macro_agroorbit.png)

## Tecnologias utilizadas

- Java 17
- Spring Boot
- Maven
- PostgreSQL
- Docker
- Docker Compose
- Swagger/OpenAPI
- Azure VM / Linux Ubuntu para execução em nuvem

## Containers

| Container | Função | Porta | Observação |
|---|---|---:|---|
| `agroorbit-app-rm563901` | API Java Spring Boot | 8080 | Imagem personalizada via Dockerfile |
| `agroorbit-db-rm563901` | Banco PostgreSQL | 5432 | Imagem pública PostgreSQL 16 |

### Logs da aplicação

```bash
docker logs agroorbit-app-rm563901
```

### Logs do banco

```bash
docker logs agroorbit-db-rm563901
```

### Acessar container da aplicação

```bash
docker exec -it agroorbit-app-rm563901 sh
pwd
ls -l
whoami
exit
```

### Acessar container do banco

```bash
docker exec -it agroorbit-db-rm563901 psql -U postgres -d agroorbit
```

Dentro do PostgreSQL:

```sql
\dt
SELECT * FROM tb_user;
SELECT * FROM tb_farm;
SELECT * FROM tb_crop_area;
SELECT * FROM tb_sensor;
SELECT * FROM tb_satellite_data;
SELECT * FROM tb_climate_alert;
\q
```

Se algum nome de tabela estiver diferente, rode `\dt` e use o nome exato retornado pelo banco.

## Como parar

```bash
docker compose down
```

Parar e apagar volume:

```bash
docker compose down -v
```

## GIT HUB

```text
https://github.com/Wiclif06/GSDevOps-Cloud.git
```