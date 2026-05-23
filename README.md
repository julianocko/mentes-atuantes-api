# Mentes Atuantes API

Base digital do ecossistema **Mentes Atuantes** para orientação parental prática em fase de MVP web.  
Este projeto organiza a jornada de decisão de pais e cuidadores com responsabilidade clínica, mantendo limites claros entre orientação digital e cuidado especializado.

## Visão geral
A Mentes Atuantes API nasce para transformar autoridade clínica em orientação prática, acionável e contextualizada para pais e cuidadores.  
O foco do MVP é apoiar triagem de caminho, entrega de conteúdo aplicável, scripts parentais, árvores de decisão e conexão com serviços clínicos em cenários de alerta.

## Objetivo
Estruturar uma base digital que permita:
- orientar decisões parentais com clareza;
- reduzir insegurança na ação cotidiana;
- organizar encaminhamento responsável quando houver necessidade clínica.

## Problema
O projeto responde à dor central de **falta de ferramentas práticas** para famílias que precisam decidir o que fazer em situações reais, sem depender de conteúdos genéricos ou excesso de tela.

## Proposta de valor
- **Parent-first**: decisões centradas na necessidade real de pais e cuidadores.
- **Screen-light**: uso digital objetivo, com foco em aplicação no cotidiano.
- **Offline-oriented**: orientação para execução fora da tela.
- **Responsabilidade clínica**: o digital organiza e direciona, sem substituir o cuidado clínico.

## Público principal
- Pais, mães e cuidadores de crianças e adolescentes.
- Responsáveis que buscam orientação prática e estruturada para desafios recorrentes.
- Famílias que precisam distinguir dúvidas cotidianas de sinais de alerta.

## Escopo do MVP
Nesta fase, o MVP cobre:
- triagem de caminho para decisões iniciais;
- conteúdos aplicáveis ao cotidiano parental;
- scripts parentais de comunicação e manejo;
- árvores de decisão para próximos passos;
- conexão com a frente de serviços clínicos quando houver sinal de alerta.

## Papel da API
A API é o núcleo de orquestração da jornada do usuário.  
Ela conecta triagem, recomendação, orientação prática e encaminhamento, garantindo coerência de fluxo e consistência de critérios.

## Jornada do usuário
1. Entrada por uma dor concreta da rotina parental.
2. Triagem do caminho mais adequado.
3. Recebimento de orientação prática (conteúdo, script, decisão).
4. Aplicação fora da tela no contexto familiar.
5. Reavaliação do cenário.
6. Encaminhamento para serviços clínicos quando houver sinal de alerta.

## Camadas do produto
- Camada de orientação prática.
- Camada de decisão (triagem e árvores de decisão).
- Camada de aplicação (execução no cotidiano).
- Camada de encaminhamento clínico responsável.
- Camada de orquestração (API).

## Capacidades iniciais
- organizar dúvidas parentais em caminhos acionáveis;
- entregar orientação prática com linguagem clara;
- apoiar decisões sem dependência de uso intensivo de tela;
- sinalizar limites da orientação digital;
- direcionar para cuidado clínico quando necessário.

## Limites desta fase
Este MVP **não** é:
- app nativo completo;
- prontuário clínico;
- ferramenta diagnóstica;
- substituto de avaliação ou acompanhamento clínico.

## Próximos passos
- evoluir critérios de triagem com base no uso real;
- ampliar repertório de scripts e árvores de decisão;
- fortalecer integração com a frente de serviços clínicos;
- consolidar métricas de clareza, aplicabilidade e direcionamento.

## Status do projeto
Projeto em fase inicial (bootstrap).  
Atualmente há estrutura base Spring Boot e teste de carga de contexto.

## Stack atual (confirmada no código)
- Java 25
- Spring Boot 4.0.6
- Maven Wrapper (`mvnw`)

## Pré-requisitos
- JDK 25 instalado e configurado no `PATH`.
- Permissão de execução para `./mvnw` em ambientes Unix.

## Execução local
```bash
# 1) Clonar o repositório
git clone <URL_DO_REPOSITORIO>
cd mentes-atuantes-api

# 2) Executar a aplicação
./mvnw spring-boot:run
```

Configuração atual disponível:
- `spring.application.name=mentes-atuantes-api` em `src/main/resources/application.yaml`.

## Build e testes
```bash
# Rodar testes
./mvnw clean test

# Gerar artefato
./mvnw clean package
```

## Estrutura atual do projeto
```text
.
├── src/main/java/com/mentesatuantes/mentes_atuantes_api/
├── src/test/java/com/mentesatuantes/mentes_atuantes_api/
├── src/main/resources/application.yaml
├── pom.xml
├── architecture.md
├── AGENTS.md
└── .specify/memory/constitution.md
```

## Arquitetura e governança
As decisões de implementação seguem a hierarquia de governança do projeto:
1. `.specify/memory/constitution.md` (fonte canônica)
2. `architecture.md`
3. `AGENTS.md`
4. especificações aprovadas em `/specs` (quando existirem)

Diretrizes-chave:
- Clean Architecture, DDD e SOLID.
- Separação em `domain`, `application`, `infrastructure`, `interfaces`.
- Dependências apontando para dentro.
- Uma operação de negócio por caso de uso explícito.

## Fluxo de desenvolvimento (Spec Kit)
Sequência padrão para evolução de features:
1. `speckit-specify`
2. `speckit-clarify`
3. `speckit-plan`
4. `speckit-tasks`
5. `speckit-implement`

Regra obrigatória: não implementar feature sem especificação aprovada.

## Contribuição
- Preserve escopo: mudanças pequenas, claras e testáveis.
- Não introduza comportamento não especificado.
- Mantenha aderência à constituição e à arquitetura.
- Inclua testes para toda nova regra de negócio.

## Licença
Licença ainda não definida neste repositório.
