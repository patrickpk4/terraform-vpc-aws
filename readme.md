# Projeto Terraform - Infraestrutura AWS para Aplicação Web

## Visão Geral

Este projeto provisiona uma infraestrutura completa na AWS utilizando
Terraform, com foco em:

-   Alta disponibilidade
-   Segurança em camadas
-   Boas práticas de rede
-   Automação de infraestrutura (IaC)
-   Escalabilidade para aplicações web
-   Acesso administrativo seguro via Session Manager

A arquitetura foi desenvolvida para hospedar aplicações web modernas
com:

-   Application Load Balancer (ALB)
-   Instância EC2 privada
-   Banco de dados RDS PostgreSQL
-   NAT Gateway
-   VPC Endpoints para gerenciamento seguro
-   Sub-redes segmentadas por função

## Arquitetura da Solução

``` txt
Internet
   |
Application Load Balancer
   |
Subnets Públicas (AZ A/B)
   |
Subnet Privada (EC2)
   |
Subnets de Banco (RDS PostgreSQL)
```

## Componentes Provisionados

-   VPC (10.0.0.0/16)
-   Public Subnets
-   Private Subnet
-   DB Subnets
-   Internet Gateway
-   NAT Gateway
-   Application Load Balancer
-   EC2 Ubuntu 22.04
-   RDS PostgreSQL
-   IAM Role para SSM
-   VPC Endpoints

## Estrutura do Projeto

``` txt
main.tf
variavel.tf
vpc.tf
subnet.tf
internet-gateway.tf
nat-gateway.tf
route-table.tf
security-group.tf
instance.tf
alb.tf
rds.tf
iam-role.tf
output.tf
```

## Pré-requisitos

-   Terraform \>= 1.0
-   AWS CLI configurado
-   Conta AWS ativa
-   Bucket S3 para state remoto
-   Permissões IAM adequadas

## Deploy

### 1. Clone o repositório

``` bash
git clone <repositorio>
```

### 2. Configure senha do banco

``` bash
export TF_VAR_db-password="SuaSenhaSegura123"
```

### 3. Inicialize

``` bash
terraform init
```

### 4. Planeje

``` bash
terraform plan
```

### 5. Aplique

``` bash
terraform apply -auto-approve
```

## Outputs Esperados

-   IP privado EC2
-   ID da instância
-   DNS do Load Balancer
-   Endpoint RDS PostgreSQL

## Segurança

### Load Balancer

-   HTTP 80 público
-   HTTPS 443 público

### EC2

-   Recebe tráfego apenas do ALB
-   Saída controlada
-   Comunicação com RDS

### RDS

-   Porta 5432 acessível apenas pela EC2

## VPC Endpoints

-   SSM
-   SSMMessages
-   EC2Messages

### Benefícios

-   Administração sem SSH
-   Comunicação privada
-   Redução de exposição

## Banco de Dados

-   PostgreSQL 13
-   db.t3.micro
-   10 GB
-   Privado
-   Porta 5432

## Boas Práticas Aplicadas

-   Menor privilégio
-   Banco isolado
-   Session Manager
-   Segmentação por camadas
-   NAT controlado
-   Health Checks
-   Backend remoto
-   Variáveis sensíveis

## Destruição

``` bash
terraform destroy -auto-approve
```

## Observações

-   Ajustar backend S3 conforme ambiente
-   Endpoint de health check: `/ready`
-   Administração via AWS Systems Manager

## Objetivos

Ideal para:

-   Laboratórios Terraform
-   Estudos AWS
-   Segurança cloud
-   Certificações
-   Portfólio DevOps

## Licença

MIT License
