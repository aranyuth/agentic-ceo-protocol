---
name: parallel-subagent-swarm
description: "Parallel Subagent Swarm Delegation Rule for Multi-Component Engineering"
trigger: always_on
---

# ⚡ Parallel Subagent Swarm Delegation Rule
# ⚡ กฎเหล็กสากล: การกระจายงานให้ Subagents ทำงานคู่ขนาน (Parallel Subagent Delegation)

## 📌 Mandatory Policy / ข้อบังคับเด็ดขาด
When addressing complex, large-scale, or multi-component requirements:
1. **Never execute sequentially in a single agent session:** Single-agent linear execution creates cognitive bottlenecks and unnecessary latency.
2. **Decompose immediately into modular scopes:** Break down the initiative into distinct domains and launch parallel subagents (`invoke_subagent`) in a single dispatch call.
3. **Allow concurrent independent execution:** Subagents execute in parallel workspaces or shared repositories, reporting back verified artifacts upon completion.

เมื่อมีงานขนาดใหญ่หรือมีหลายโมดูล ห้าม Agent นั่งทำทีละขั้นตอนแบบ Sequential คนเดียว ต้องแตกงานออกเป็นโดเมนเฉพาะทาง และสั่งเปิดฝูง Subagents ทำงานแบบคู่ขนาน (Parallel Execution) พร้อมกันทันที

---

## 🐝 Specialized Archetypes & Delegation Patterns (บทบาทเฉพาะทาง)

### 1. `data-harvester` (Data & Research Specialist)
- **Scope:** Raw data collection, schema crawling, web scraping, external API integration, file indexing, and dataset normalization.
- **Model Recommendation:** `flash` (for raw speed) or `pro` (for complex extraction parsing).

### 2. `backend-architect` (Backend & Storage Architect)
- **Scope:** Serverless worker logic, database migrations (SQL / D1 / SQLite / PostgreSQL), REST/RPC API contracts, auth flows, and backend business logic.
- **Model Recommendation:** `pro` (standard tasks) or `inherit` (distributed logic).

### 3. `frontend-commander` (Frontend & UI/UX Specialist)
- **Scope:** User interfaces, responsive dashboards, interactive components, CSS/Tailwind design systems, state management, and edge page deployments.
- **Model Recommendation:** `pro`.

### 4. `independent-reviewer` (Audit & Quality Gate)
- **Scope:** Code review, security analysis, zero-secret leakage audits, edge-case validation, test execution verification, and adherence to repository conventions.
- **Model Recommendation:** `pro` or `inherit`.

---

## 🔄 Coordination & Synthesis Protocol
- **Parent Agent Role:** Acts as General Contractor / Synthesizer. Allocates decoupled prompts, manages progress, resolves boundary integration contracts, and compiles the unified delivery scorecard.
- **Zero-Block Delivery:** Subagents must not wait on human confirmation for internal tasks; they verify their own artifacts deterministically and present verified results to the coordinator.
