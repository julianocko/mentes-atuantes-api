#!/bin/bash

# ============================================================
# spec-linear
# Script responsável por executar o fluxo de spect-kit de uma
# issue descrita na ferramenta Linear
# Uso:
#   spec-linear NNN-000
# ============================================================

ISSUE="$1"

if [ -z "$ISSUE" ]; then
  echo "Uso: spec-linear <ISSUE-ID>"
  echo "Exemplo: spec-linear PAY-142"
  exit 1
fi

codex <<EOF
Busque a issue $ISSUE no Linear via MCP.

Use obrigatoriamente os arquivos AGENTS.md, constitution.md e architecture.md como contexto principal de arquitetura, governança e padrões.

Execute o seguinte fluxo:

1. Buscar a issue no Linear
2. Extrair:
   - título
   - descrição
   - acceptance criteria
   - technical notes
   - constraints

3. Converter a issue para um specification input compatível com GitHub Spec Kit

Regras obrigatórias:
- seguir Clean Architecture
- seguir DDD
- seguir constitution.md
- seguir architecture.md
- seguir AGENTS.md
- seguir PROJECT_AI_CONTEXT.md
- não inventar arquitetura
- não criar generic services
- respeitar boundaries
- gerar especificação enterprise-grade

Após preparar a especificação, execute:

\$speckit-specify

Em seguida continue automaticamente com:

\$speckit-clarify
\$speckit-plan
\$speckit-tasks
EOF