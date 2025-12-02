# G.H.L – Gestão Hospitalar de Leitos (SQL DML)

Projeto acadêmico de banco de dados relacional para o minimundo **G.H.L**, focado em otimizar o giro/tempo de liberação de leitos no hospital.

## Tecnologias
- MySQL Workbench **ou** PostgreSQL (pgAdmin)
  
## Observações de modelo
Entidades principais:
- SETOR, LEITO, PACIENTE, OCORRENCIA_TTV, ORDEM_SERVICO, USUARIO, USUARIO_OS.

Regras aplicadas:
- Um setor possui vários leitos 
- Leito registra várias ocorrências 
- Ocorrência gera uma ordem de serviço
- Usuário executa ordens via tabela associativa
