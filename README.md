# 🔐 Sistema de Controle de Acesso – SQL Server (RBAC)

## 📌 Sobre o Projeto

Implementação de **RBAC (Role-Based Access Control)** no SQL Server, com separação clara entre:

- **LOGIN** → autenticação no servidor  
- **USER** → identidade do login dentro do database  
- **ROLE** → grupos de usuários com permissões centralizadas  
- **PERMISSÕES** → concedidas via GRANT/DENY a tabelas, views ou colunas  

Database utilizado: `Teste_Desastre`.

---

## 👥 Estrutura de Roles e Usuários

**BI**  
- Role: `VWS_SET_BI`  
- Usuários: `BI_TERC`, `SUP_BI_TERC`  
- Permissões: SELECT em `VW_PROF_MES`  
- Observações: Apenas leitura de view  

**PD (Owner)**  
- Role: `SET_PD_OWNER`  
- Usuário: `PD_OWNER`  
- Permissões: SELECT, INSERT, UPDATE em `Funcionario` e `Profissao`  
- Observações: Owner técnico, leitura global  

**DEV**  
- Role: `SET_DEV`  
- Usuário: `DEV_APP`  
- Permissões: SELECT, INSERT em `Funcionario` e `Profissao`  

**Financeiro**  
- Role: `SET_FINAN`  
- Usuários: `ASSIST_FINAN`, `SUP_FINAN`  
- Permissões: SELECT, INSERT, UPDATE em `Funcionario` e `Profissao`  

**Marketing**  
- Role: `SET_MKT`  
- Usuários: `ASSIST_MKT`, `SUP_MKT`  
- Permissões: SELECT em `Funcionario`, `Profissao` e `VW_PROF_MES`  
- Observações: Colunas `Salario` e `SalarioBase` bloqueadas  

**RH**  
- Role: `SET_RH`  
- Usuários: `ASSIST_RH`, `SUP_RH`  
- Permissões: SELECT, INSERT, UPDATE, DELETE em `Funcionario` e `Profissao`  

---

## 🔗 Boas Práticas Aplicadas

- Nenhum usuário recebe permissões diretas → **controle centralizado via roles**  
- Princípio do **menor privilégio**  
- **Segurança em nível de coluna** (Marketing)  
- Estrutura modular → **manutenção e expansão facilitadas**  
- Separação clara de responsabilidades por departamento  

---

## 🚀 Conclusão

Este modelo demonstra um **RBAC corporativo completo** no SQL Server, aplicável a:

- Governança de dados  
- Auditoria de acessos  
- Proteção de informações sensíveis  

Permite **controle refinado de acesso**, **facilidade de manutenção** e segue **boas práticas de segurança corporativa**.

O arquivo `.sql` com toda a implementação passo a passo está disponível no repositório **Lab-SQLServer--RBAC-** como:  
[`RBAC-Users-Logins.sql`](./RBAC-Users-Logins.sql)  


