# OSH 2026 Agent Working Rules

## Scope
These rules apply to all agent-assisted work in this repository.

## Required Pre-Read
Before starting any lab task, read and follow:
- `/memories/repo/osh-2026-course.md`
- `/memories/repo/osh-2026-lab0-checklist.md`

## Core Principle
AI is allowed, but unauditable work is not allowed.
Every key change must be reproducible and reviewable.

## PIP Workflow (Mandatory)
1. Plan
- Break down requirements: functional, non-functional, and risks.
- Define verifiable targets: tests/perf/race/correctness.

2. Implementation
- Prefer reviewable patches/commit passages.
- Human reviewer must make risk and trade-off decisions before merge.

3. Proof
- Provide automated tests.
- Provide minimal reproduction steps.
- Provide at least one observable evidence source (trace/log).

## Security Defaults for Agents
- Default to no direct write to main branch.
- No auto-push.
- Use least privilege for network access and credentials.
- Never put secrets in prompts, logs, or artifacts.
- Run secret scanning/pre-commit (or equivalent checks) before submit.

## Trace Minimum
For each lab, provide at least one trace source:
- `perf`, or
- `ftrace`, or
- `eBPF`

Document:
- commands used,
- events/metrics of interest,
- key conclusions and where evidence is located.

## Deliverable Checklist
Include or reference:
- AI process log (prompt/response summary, decisions, failures, rollback),
- verification report (tests/benchmark and before-vs-after),
- trace report,
- risk check (prompt injection + regression self-check).
