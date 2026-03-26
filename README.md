# BlazeDemo Performance Test

Este projeto contém um teste de performance para o fluxo de compra de passagens aéreas no [BlazeDemo](https://blazedemo.com). O objetivo é validar se o sistema suporta a carga esperada de 250 requisições por segundo com tempo de resposta aceitável (90th percentile < 2s).

---

## Estrutura do Projeto

performance-jmeter/
├─ test-plans/           # Arquivos .jmx do JMeter
│  └─ blazedemo-purchase.jmx
├─ results/              # Resultados das execuções (.jtl)
├─ reports/              # Relatórios HTML gerados pelo JMeter
├─ .github/workflows/    # GitHub Actions pipeline
└─ README.md

---

## Requisitos

- Java 11+
- JMeter 5.6.3
- Git

---

## Como executar localmente

1. Clone o repositório:

git clone <seu-repositorio-link>
cd performance-jmeter

2. Execute o JMeter em modo não GUI:

No terminal digite:

.\run-test.bat


3. Ao final, os relatórios HTML ficarão na pasta `reports`.

---

## Pipeline Automatizada (GitHub Actions)

- Toda vez que houver push ou PR para a branch `main`, a pipeline:

  1. Configura Java e JMeter.  
  2. Limpa resultados antigos.  
  3. Executa o teste de performance.  
  4. Gera relatório HTML.  
  5. Disponibiliza `results.jtl` e o relatório HTML como artifacts.

---

## Relatório de Execução

- Teste de carga: atingiu até **250 RPS** em determinados picos.  
- Percentil 90: **abaixo de 2 segundos**, atendendo ao critério de aceitação.  
- Erros: menos de 1% das requisições falharam.  

> Conclusão: O critério de performance definido foi satisfeito.

---
