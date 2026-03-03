/**********************************************************************
-- LAB: SQL Server RBAC Lab
-- Objetivo: Implementação completa de controle de acesso baseado em Roles
-- Autor: [Matheus Sobreira Lima]
-- Data: 2026
-- Observações: Estrutura inclui LOGINS, USERS, ROLES, permissões e associações
**********************************************************************/

-- ========================================
-- 1️⃣ CRIAÇÃO DE LOGINS (Nível Servidor)
-- ========================================

-- BI
CREATE LOGIN BI_TERC
    WITH PASSWORD = 'D@T@#Terc*2026',
         CHECK_POLICY = ON,
         CHECK_EXPIRATION = OFF;

CREATE LOGIN SUP_BI_TERC
    WITH PASSWORD = 'SuP#Terc*2026',
         CHECK_POLICY = ON,
         CHECK_EXPIRATION = OFF;

-- DEV
CREATE LOGIN DEV_APP
    WITH PASSWORD = 'D3V#Terc*2026',
         CHECK_POLICY = ON,
         CHECK_EXPIRATION = OFF;

-- PD (Owner)
CREATE LOGIN PD_OWNER
    WITH PASSWORD = 'P0#Data@2026',
         CHECK_POLICY = ON,
         CHECK_EXPIRATION = OFF;

-- Financeiro
CREATE LOGIN ASSIST_FINAN
    WITH PASSWORD = 'A$$_Finan_2026@',
         CHECK_POLICY = ON,
         CHECK_EXPIRATION = OFF;

CREATE LOGIN SUP_FINAN
    WITH PASSWORD = 'SuP_Finan_2026@',
         CHECK_POLICY = ON,
         CHECK_EXPIRATION = OFF;

-- Marketing
CREATE LOGIN ASSIST_MKT
    WITH PASSWORD = 'A$$_MkT_2026@',
         CHECK_POLICY = ON,
         CHECK_EXPIRATION = OFF;

CREATE LOGIN SUP_MKT
    WITH PASSWORD = 'SuP_MkT_2026@',
         CHECK_POLICY = ON,
         CHECK_EXPIRATION = OFF;

-- RH
CREATE LOGIN ASSIST_RH
    WITH PASSWORD = 'Rh_AssisT@2026',
         CHECK_POLICY = ON,
         CHECK_EXPIRATION = OFF;

CREATE LOGIN SUP_RH
    WITH PASSWORD = 'Rh_SuP@2026',
         CHECK_POLICY = ON,
         CHECK_EXPIRATION = OFF;


-- ========================================
-- 2️⃣ CRIAÇÃO DE USERS (Nível Database)
-- ========================================

USE Teste_Desastre;

-- BI
CREATE USER BI_TERC FOR LOGIN BI_TERC;
CREATE USER SUP_BI_TERC FOR LOGIN SUP_BI_TERC;

-- DEV
CREATE USER DEV_APP FOR LOGIN DEV_APP;

-- PD
CREATE USER PD_OWNER FOR LOGIN PD_OWNER;
ALTER ROLE db_datareader ADD MEMBER PD_OWNER;

-- Financeiro
CREATE USER ASSIST_FINAN FOR LOGIN ASSIST_FINAN;
CREATE USER SUP_FINAN FOR LOGIN SUP_FINAN;

-- Marketing
CREATE USER ASSIST_MKT FOR LOGIN ASSIST_MKT;
CREATE USER SUP_MKT FOR LOGIN SUP_MKT;

-- RH
CREATE USER ASSIST_RH FOR LOGIN ASSIST_RH;
CREATE USER SUP_RH FOR LOGIN SUP_RH;


-- ========================================
-- 3️⃣ CRIAÇÃO DE ROLES
-- ========================================

-- BI
CREATE ROLE VWS_SET_BI;

-- PD
CREATE ROLE SET_PD_OWNER;

-- DEV
CREATE ROLE SET_DEV;

-- Financeiro
CREATE ROLE SET_FINAN;

-- Marketing
CREATE ROLE SET_MKT;

-- RH
CREATE ROLE SET_RH;


-- ========================================
-- 4️⃣ CONCESSÃO DE PERMISSÕES
-- ========================================

-- BI
GRANT SELECT ON VW_PROF_MES TO VWS_SET_BI;

-- PD
GRANT SELECT, INSERT, UPDATE ON Funcionario TO SET_PD_OWNER;
GRANT SELECT, INSERT, UPDATE ON Profissao TO SET_PD_OWNER;

-- DEV
GRANT SELECT, INSERT ON Funcionario TO SET_DEV;
GRANT SELECT, INSERT ON Profissao TO SET_DEV;

-- Financeiro
GRANT SELECT, INSERT, UPDATE ON Funcionario TO SET_FINAN;
GRANT SELECT, INSERT, UPDATE ON Profissao TO SET_FINAN;

-- Marketing
GRANT SELECT ON Funcionario TO SET_MKT;
GRANT SELECT ON Profissao TO SET_MKT;
GRANT SELECT ON VW_PROF_MES TO SET_MKT;
DENY SELECT(Salario) ON Funcionario TO SET_MKT;
DENY SELECT(SalarioBase) ON Profissao TO SET_MKT;

-- RH
GRANT SELECT, INSERT, UPDATE, DELETE ON Funcionario TO SET_RH;
GRANT SELECT, INSERT, UPDATE, DELETE ON Profissao TO SET_RH;


-- ========================================
-- 5️⃣ ASSOCIAR USERS ÀS ROLES
-- ========================================

-- BI
ALTER ROLE VWS_SET_BI ADD MEMBER BI_TERC;
ALTER ROLE VWS_SET_BI ADD MEMBER SUP_BI_TERC;

-- PD
ALTER ROLE SET_PD_OWNER ADD MEMBER PD_OWNER;

-- DEV
ALTER ROLE SET_DEV ADD MEMBER DEV_APP;

-- Financeiro
ALTER ROLE SET_FINAN ADD MEMBER ASSIST_FINAN;
ALTER ROLE SET_FINAN ADD MEMBER SUP_FINAN;

-- Marketing
ALTER ROLE SET_MKT ADD MEMBER ASSIST_MKT;
ALTER ROLE SET_MKT ADD MEMBER SUP_MKT;

-- RH
ALTER ROLE SET_RH ADD MEMBER ASSIST_RH;
ALTER ROLE SET_RH ADD MEMBER SUP_RH;

