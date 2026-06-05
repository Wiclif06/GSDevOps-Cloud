# Checklist de nota máxima - DevOps + Cloud

## App Container - 30 pts
- [ ] Imagem personalizada gerada via Dockerfile
- [ ] Container da aplicação executando
- [ ] Usuário não-root demonstrado com `whoami`
- [ ] WORKDIR demonstrado com `pwd`
- [ ] Estrutura demonstrada com `ls -l`
- [ ] Porta 8080 exposta
- [ ] Variável de ambiente usada
- [ ] Nome do container possui RM
- [ ] App na mesma rede que banco
- [ ] CRUD completo funcionando
- [ ] Swagger acessível em nuvem

## Banco - 30 pts
- [ ] PostgreSQL em container separado
- [ ] Nome do container possui RM
- [ ] Volume nomeado
- [ ] Variável de ambiente
- [ ] Porta 5432 exposta
- [ ] Mesmo network do app
- [ ] Pelo menos 2 tabelas com relacionamento
- [ ] SELECT direto no container do banco

## Arquitetura - 10 pts
- [ ] Desenho macro no README
- [ ] Fluxo de usuário -> cloud -> app -> banco
- [ ] Legendas e setas claras
- [ ] Não usar TOGAF nem fluxograma simples

## Entrega
- [ ] GitHub público com código fonte
- [ ] README com How To desde clone ate testes
- [ ] PDF com capa, integrantes, GitHub e vídeo
- [ ] Vídeo YouTube com todos os passos
- [ ] Rodando em nuvem
