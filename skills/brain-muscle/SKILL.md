---
name: brain-muscle
description: >
  Orchestrates the Brain & Muscle multi-agent workflow: Claude serves as the
  Architect (high-level planning and code review gatekeeper), while Antigravity
  acts as the Muscle (heavy code generation, refactoring, and terminal execution
  at zero or near-zero token cost).
argument-hint: "[auto|plan|review|off]"
license: MIT
---

# Sunny: Brain & Muscle Multi-Agent Protocol ☀️

Sunny orchestrates a dual-agent hybrid workflow combining the superior reasoning of Claude with the high-throughput, zero-cost execution of Antigravity (Gemini).

## Core Philosophy

- **Claude = The Architect (Brain):** Never writes massive files or boilerplate. Only produces high-level technical roadmaps, risk assessments, and reviews code diffs.
- **Antigravity = The Builder (Muscle):** Reads entire repositories, writes hundreds of lines of code, runs terminals, executes builds and tests at $0 token cost.
- **Ponytail Discipline:** Zero boilerplate, no unnecessary abstractions, minimal working diff.

---

## 3-Stage Lifecycle

```
[User Request]
       │
       ▼
[Stage 1: Claude Technical Planning]
   - Breaks down request into a deterministic DAG (Task steps).
   - Identifies edge cases, file modifications, and security risks.
   - Outputs: Strict Technical Plan.
       │
       ▼
[Stage 2: Antigravity Code Execution ($0 Token Cost)]
   - Follows the plan step-by-step.
   - Modifies files, installs dependencies, runs local tests.
   - Generates minimal diff adhering to Ponytail guidelines.
       │
       ▼
[Stage 3: Claude Review & Gatekeeper]
   - Claude reviews the git diff.
   - If bugs/slop detected: Rejects and provides exact line fixes for Antigravity.
   - If approved: Passes quality gate and delivers result to User.
```

---

## How to Trigger

### 1. In Antigravity
- To request a plan before coding:
  `python bridge/bridge.py claude "Create a step-by-step technical plan for: <TASK>"`
- To request review after coding:
  `python bridge/bridge.py claude "Review the following git diff for logic errors and security: @diff.patch"`
- To delegate reasoning to auxiliary models:
  `python bridge/bridge.py openai "Solve algorithmic challenge: <PROMPT>"`
  `python bridge/bridge.py deepseek "Analyze time complexity of: <CODE>"`

### 2. Natural Language Routing
When the user says:
- *"Plan this with Claude"* -> Stage 1 is triggered automatically.
- *"Review this with Claude"* -> Stage 3 is triggered with the current diff.
- *"Sunny mode"* -> Full 3-stage loop is activated for all non-trivial tasks.

---

## Safety & Token Guardrails

1. Never send sensitive credentials, API keys, or personal tokens over the bridge.
2. Claude calls must be compact (send summarized diffs or specific function blocks, not 10,000-line minified files).
3. If Claude rejects code twice, pause and ask the user for clarification.
