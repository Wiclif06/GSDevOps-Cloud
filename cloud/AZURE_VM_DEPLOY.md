# Deploy em nuvem - Azure VM Ubuntu

> Use este roteiro para evitar que a entrega fique apenas em localhost. O PDF da GS informa que solução em localhost não será corrigida.

## 1. Criar VM
- Azure Portal > Virtual Machines > Create
- Image: Ubuntu Server 24.04 LTS
- Size: B1s, B2s ou D2s_v3
- Authentication: SSH
- Inbound ports: liberar 22, 8080 e 5432

## 2. Acessar a VM
```bash
ssh usuario@IP_PUBLICO_DA_VM
```

## 3. Instalar Docker
```bash
sudo apt update
sudo apt install -y ca-certificates curl gnupg git
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo $VERSION_CODENAME) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo usermod -aG docker $USER
exit
```

Entre novamente por SSH depois do `exit`.

## 4. Clonar o repositório
```bash
git clone LINK_DO_GITHUB_AQUI
cd NOME_DO_REPOSITORIO
```

## 5. Subir os containers
```bash
docker compose up -d --build
```

## 6. Validar
```bash
docker ps
docker logs agroorbit-app-rm563901
docker logs agroorbit-db-rm563901
docker exec -it agroorbit-app-rm563901 sh
pwd
ls -l
whoami
exit
docker exec -it agroorbit-db-rm563901 psql -U postgres -d agroorbit
\dt
SELECT * FROM tb_user;
SELECT * FROM tb_farm;
\q
```

## 7. Acessar em nuvem
```text
http://IP_PUBLICO_DA_VM:8080/swagger-ui.html
```

## 8. Evidência no vídeo
Mostre o IP público da VM, o SSH, `docker ps`, logs, `docker exec`, `whoami`, SELECT no banco e Swagger acessado pelo IP público.
