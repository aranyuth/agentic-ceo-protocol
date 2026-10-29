---
name: cross-session-memory
description: "Universal Cross-Session Memory, Auto-Recall, and Zero-Amnesia Protocol for AntiGravity and Memory Hub (v2.1)"
trigger: always_on
---

# 🧠 Cross-Session Memory & Zero-Amnesia Protocol
# 🧠 กฎเหล็กสากล: ระบบความจำข้ามเซสชันและการป้องกันภาวะสมองเสื่อม (Zero-Amnesia Protocol v2.1)

## 📌 Core Philosophy / ปรัชญาหลัก
> **"Never Start from Scratch in an Existing Project (ห้ามเริ่มจากศูนย์ในโปรเจกต์เดิม)"**
> 
> AntiGravity sessions are naturally stateless. When a new session opens, conversation history disappears. The AI must **never guess blindly (ห้ามเดาบริบทมั่ว)**. It must actively recall prior architectural decisions, active handoffs, and project anchor records to ensure 100% consistent perception across all sessions.
>
> เซสชันใหม่ของ AntiGravity มีธรรมชาติแบบ Stateless ซึ่งทำให้ประวัติการสนทนาในอดีตหายไป AI ต้อง **ห้ามเริ่มเดาสุ่มใหม่จากศูนย์** แต่ต้องดึงความจำ (Auto-Recall) จาก Memory Hub และ Project Anchor Files ขึ้นมาดูทันที เพื่อให้เห็นภาพระบบตรงกัน 100% ทุกครั้งที่เปิดแชตใหม่

---

## 1. 🔄 Turn-1 Auto-Recall Protocol (การดึงความจำในเทิร์นแรก)
### บังคับตรวจสอบความจำและบริบทก่อนเริ่มลงมือทำงาน
- **English:** At the start of any new session or major task in a project workspace, the agent must execute the **Auto-Recall Sequence**:
  1. **Check Active Handoffs:** If the `memory-hub` MCP server is active, call `memory_handoff(action="list", project="<current_workspace>")` to inspect open tasks, pending deliverables, and notes left by previous sessions or other agents (Claude Code, Codex, Gemini).
  2. **Read Project Memory Anchors:** Check if project state anchors exist in the workspace root (`PROGRESS.md`, `CONTEXT.md`, or `AGENTS.md`). Read the active state, architectural agreements, and next steps before proposing solutions.
  3. **Targeted Semantic Recall:** For complex questions or recurring bugs, call `memory_search(query="<topic>", project="<current_workspace>")` to review past reasoning and design rationale.
- **ภาษาไทย:** เมื่อเริ่มเซสชันใหม่หรือเริ่มงานสำคัญในโฟลเดอร์โปรเจกต์ AI ต้องรัน **Auto-Recall Sequence** เสมอ:
  1. ตรวจสอบงานส่งต่อที่ค้างไว้ผ่าน `memory_handoff(action="list", project="<workspace>")`
  2. เปิดอ่านไฟล์บันทึกสถานะของโปรเจกต์ (`PROGRESS.md`, `CONTEXT.md`, หรือ `AGENTS.md`)
  3. ใช้ `memory_search` ค้นหามติการออกแบบในอดีตเพื่อไม่ให้เสนอวิธีแก้ที่ขัดแย้งกับของเดิม

---

## 2. 🚫 Negative Memory & Anti-Pattern Guard (การหลีกเลี่ยงข้อผิดพลาดซ้ำเดิม)
### ตรวจสอบสิ่งที่เคยทำแล้วพังก่อนลงมือแก้ระบบ
- **English:** Before executing high-impact refactors, migrations, or dependency changes, consult the project's negative memory and recorded anti-patterns. Never re-execute a solution that was previously tried and proven broken in a prior session.
- **ภาษาไทย:** ก่อนลงมือแก้ไขโครงสร้างระบบหรือเปลี่ยนวิธีแก้จุดสำคัญ ให้ตรวจสอบ Negative Memory / Anti-Patterns ที่เคยบันทึกไว้เสมอ เพื่อป้องกันไม่ให้ทำสิ่งที่เคยลองแล้วพังซ้ำสอง

---

## 3. 🤝 End-of-Run State Preservation (การบันทึกสถานะส่งต่องาน)
### บันทึกความคืบหน้าทุกครั้งที่บรรลุเป้าหมายสำคัญ
- **English:** Whenever completing a milestone, finishing a feature sprint, or preparing to conclude a session:
  1. **Update Project Anchor:** Document newly verified features, test counts, architectural updates, and immediate next steps in `PROGRESS.md`.
  2. **Save Memory Handoff:** For unfinished multi-step tasks or cross-AI coordination, call `memory_handoff(action="save", project="<workspace>", text="<Summary of achievements + clear next steps>")`.
- **ภาษาไทย:** ทุกครั้งที่ทำฟีเจอร์สำคัญเสร็จ หรือกำลังจะจบการทำงานของเซสชัน:
  1. อัปเดตสถานะและขั้นตอนถัดไปลงใน `PROGRESS.md`
  2. หากมีงานค้างที่ต้องส่งต่อ ให้เซฟ `memory_handoff(action="save", ...)` เพื่อให้เซสชันถัดไปรับงานต่อได้ไร้รอยต่อ

---

## 4. 🎯 Unified Multi-Agent Consistency (ความสอดคล้องข้าม AI ทุกค่าย)
### เชื่อมต่อระบบนิเวศ Memory Hub ข้ามแพลตฟอร์ม
- **English:** Memory stored in Memory Hub is accessible across Claude Code, Gemini CLI, Codex, and AntiGravity. Respect cross-agent leases, honor facts pinned by human operators, and preserve the unified knowledge graph across sessions.
- **ภาษาไทย:** ข้อมูลที่อยู่ใน Memory Hub เป็นความจำส่วนกลางที่เข้าถึงร่วมกันได้ทั้ง Claude Code, Gemini, Codex และ AntiGravity ให้เคารพกฎและข้อตกลงที่บันทึกไว้ และสืบทอดบริบทการทำงานอย่างต่อเนื่อง

---

## 5. 🧬 Google Harness² Memory Taxonomy (`[WORKSPACE_FACT]` vs. `[DOMAIN_PROCEDURE]`)
### แยก "ข้อเท็จจริงเฉพาะโปรเจกต์" ออกจาก "ขั้นตอนมาตรฐาน" พร้อมหลักฐานครบ 4 ช่อง
- **English (Adopted from `google-research/harness2`):**
  1. **Explicitly Tag `[WORKSPACE_FACT]` vs. `[DOMAIN_PROCEDURE]`:**
     - **`[WORKSPACE_FACT]` (Verified Concrete Mapping):** Record exact, verified facts discovered about the current repo (e.g., *"In this workspace, `users.role_id` joins `positions.code`; role `Manager` has no counterpart"*). Write the **fact itself**, not merely instructions on how to rediscover it—saving future sessions from paying the exploration token tax again.
     - **`[DOMAIN_PROCEDURE]` (Transferable Workflow):** Record generalizable step-by-step procedures that apply across all projects in the same domain.
  2. **Mandatory 4-Field Experience Schema (`Cue + Lesson + Evidence + Confidence`):**
     - Never save vague advice like *"be thorough"*. Every learned lesson persisted to `PROGRESS.md` or `Memory Hub` must specify:
       - **`Cue`:** The exact trigger condition or symptom when this memory applies.
       - **`Lesson`:** The concrete action or fact to apply.
       - **`Evidence`:** The specific test, file, or trajectory outcome that proved it works.
       - **`Confidence`:** Score (`0.3` tentative $\rightarrow$ `0.9` verified invariant).
- **ภาษาไทย:**
  1. **แยกป้าย `[WORKSPACE_FACT]` กับ `[DOMAIN_PROCEDURE]` เสมอ:** ข้อเท็จจริงที่สำรวจพบในโปรเจกต์นี้ (เช่น ชื่อคอลัมน์ที่จับคู่กัน, พอร์ต, พาร์ตไฟล์สำคัญ) ให้จด **ค่าความจริงลงไปตรงๆ (`[WORKSPACE_FACT]`)** เพื่อไม่ต้องเสีย Token ค้นหาซ้ำในเซสชันหน้า ส่วนวิธีทำงานที่ใช้ซ้ำข้ามโปรเจกต์ได้ให้ติดป้าย `[DOMAIN_PROCEDURE]`
  2. **บังคับโครงสร้างความจำ 4 ช่อง (`Cue + Lesson + Evidence + Confidence`):** ห้ามจดบทเรียนลอยๆ ต้องระบุสัญญาณเตือน (`Cue`), สิ่งที่ต้องทำ (`Lesson`), หลักฐานที่พิสูจน์แล้ว (`Evidence`), และระดับความมั่นใจ (`Confidence`)

---

## 6. 🛡️ Memory Hygiene & Constraint Rationale Guard (Hybrid v4)
### ป้องกันความจำล้น ตัดข้อมูลที่สแกนหาเองได้ และติดป้ายเหตุผล `# why:` กำกับกฎเสมอ
- **English (Adopted from `walkinglabs/learn-harness-engineering`):**
  1. **1-Line Memory Index Hook (`Gotcha #1`):** Keep entries in `PROGRESS.md` / `MEMORY.md` to concise 1-line hooks; store multi-paragraph details in topic files or `Memory Hub` (`# why: byte caps silently truncate the file tail where the newest memories live`).
  2. **Zero Derivable Facts in Memory (`Gotcha #4`):** Never pollute `Memory Hub` or `PROGRESS.md` with facts derivable in <100ms from `gk_get_repo_map`, `package.json`, or `git log` (e.g., folder trees, symbol lists). Persist only non-obvious `[WORKSPACE_FACT]` mappings, architectural trade-offs, and root-cause diagnoses.
  3. **`# why:` / `# remove when:` Constraint Tagging:** Every hard prohibition (`NEVER`, `DO NOT`, `ห้าม`) added to project `AGENTS.md` or rules must carry an inline `# why:` or `# remove when:` annotation (`# why: distinguishes permanent invariants from temporary workarounds`).
- **ภาษาไทย:**
  1. **ดัชนีความจำบรรทัดเดียว (`1-Line Hook`):** เขียนสรุปใน `PROGRESS.md` ให้กระชับบรรทัดละ 1 ประเด็น เพื่อป้องกันระบบตัดท้ายไฟล์เมื่อขนาดเกินเพดาน
  2. **ห้ามเซฟสิ่งที่สแกนหาเองได้ (`Zero Derivable Facts`):** ห้ามบันทึกโครงสร้างโฟลเดอร์หรือรายชื่อฟังก์ชันที่กด `gk_get_repo_map` ดูได้ในเสี้ยววินาทีลงใน Memory Hub ให้เซฟเฉพาะความจริงเชิงลึกที่ดูจากโค้ดตรงๆ ไม่รู้
  3. **ติดป้าย `# why:` กำกับข้อห้ามเสมอ:** ทุกกฎข้อห้ามใน `AGENTS.md` ต้องระบุเหตุผล (`# why:`) หรือเงื่อนไขยกเลิก (`# remove when:`) กำกับไว้เสมอ

---

## 7. 🏛️ Hierarchy of Enforcement (แก้ปัญหาที่ระดับสูงสุดเสมอ)
### แปลงบทเรียนให้กลายเป็นเกราะป้องกันเชิงโครงสร้าง ไม่ใช่แค่บันทึกเตือนความจำ
- **English (Adopted from `pstack` / Lauren Tan):**
  When resolving recurring errors or capturing critical architectural lessons, the agent must enforce the solution at the **highest possible structural tier**:
  1. **Architecture Tier:** Redesign APIs or state machines to make illegal states unrepresentable.
  2. **Type System Tier:** Encode invariants into strict TypeScript types, branded types, or runtime schemas (Zod / Pydantic).
  3. **Lint & Static Gate Tier:** Introduce linter rules or AST pre-commit checks to catch violations automatically.
  4. **Automated Test Tier:** Add deterministic regression tests asserting expected behavior.
  5. **Prompt / Docs Tier:** Free-form text instructions in memory are the *last resort*, never the primary fix.
- **ภาษาไทย:**
  **ลำดับชั้นการแก้ปัญหาเชิงโครงสร้าง (Type > Lint > Tests > Text):** เมื่อพบข้อผิดพลาดที่เกิดขึ้นซ้ำ ห้ามหยุดแค่การเขียนข้อความเตือนความจำ แต่ต้องแปลงเป็นกลไกป้องกันที่ระดับสูงสุดเสมอ:
  1. **สถาปัตยกรรม:** ออกแบบโค้ดใหม่ไม่ให้มีทางผิดได้แต่แรก
  2. **Type System:** กำหนด Type และ Schema (TypeScript / Zod) บังคับให้โครงสร้างผิดพลาดคอมไพล์ไม่ผ่าน
  3. **Lint & AST Rules:** เขียน Rule ดักจับตอน Build
  4. **Automated Tests:** เขียน Unit/Regression Test ล็อคไว้
  5. **บันทึกข้อความ:** ให้เป็นทางเลือกสุดท้ายเมื่อทำ 4 ข้อแรกไม่ได้

---

## 8. ⏸️ Clean Worktree Suspension & Session Pickup
### การฟรีซสถานะงานอย่างปลอดภัยก่อนสลับเครื่องหรือจบรัน
- **English:**
  Prior to ending a session or declaring a pause in multi-step workflows:
  1. **Clean Worktree Check:** Ensure all code edits are either committed or tracked in a deterministic stash/diff manifest.
  2. **Handoff Anchor:** Record the active branch, head commit SHA, and exact uncommitted file paths into `memory_handoff(action="save", ...)`.
  3. **Zero Dangling State:** Never leave broken, half-written syntax in workspace files upon concluding a session.
- **ภาษาไทย:**
  **การหยุดและรับช่วงต่องานปลอดภัย (Clean Worktree & Session Pickup):** ก่อนจบเซสชัน ต้องตรวจสอบว่าไม่มีไฟล์โค้ดค้างคาแบบครึ่งๆ กลางๆ ทำการ Commit หรือบันทึก Git SHA และรายการไฟล์ที่ยังทำค้างไว้ลงใน `memory_handoff` เสมอ เพื่อให้เซสชันถัดไปเปิดมารับงานต่อได้ 100% ไร้รอยต่อ

---

## 9. 🔄 Dual-Loop Decoupling & Laptop-Native Incremental Catch-Up (v2.2)
### การแยก Attention Loop ออกจาก Work Loop และการ Catch-up ข้ามคืนบนโน้ตบุ๊ก
- **Attention Loop vs. Work Loop:**
  - **Attention Loop (Watch ➔ Judge ➔ Speak):** Scheduled or on-lid-open triage. Evaluates raw external events against statistical baseline (Z-score in code $0 compute) and runs batched LLM triage. Decides what reaches human attention.
  - **Work Loop (Prepare ➔ Gate ➔ Learn):** Triggered only on high-severity events or user assignment. Executes unattended in isolated branch/scratch workspaces, adheres to turn and time budgets, halts at the Gate, and presents an Approval Packet.
- **Laptop-Native Incremental Cursor Catch-Up:**
  - When the physical machine is shut down overnight, cursors (`last_seen_timestamp` / `event_id`) are persisted in `memory-hub` (`memory_save` / `memory_timeline`).
  - Upon powering on or opening the notebook lid in the morning, the agent executes an incremental catch-up across connected sources in 15–30 seconds.
- **"Checked and Quiet" Trust Invariant:**
  - Silence must be proven to be an intentional decision, not a system hang. Every Morning Brief and status briefing must conclude with:
    `Checked and quiet: [Source A, Source B, Source C - 0 errors] · Noise dropped: N`

---

## 10. 🧠 Bounded Learning Flywheel & Decision Observability (v2.2)
### วงจรการเรียนรู้แบบจำกัดกรอบและระบบตรวจสอบเหตุผลการตัดสินใจ
- **Bounded Multipliers (การปรับจูนแบบมีกรอบ):**
  - **Skip Feedback:** When user skips an alert, increment threshold: `threshold = min(threshold * 1.15, CAP)` (requires repeated skips to silence a category).
  - **Approve Feedback:** When user approves, adjust sensitivity: `threshold = max(threshold * 0.95, FLOOR)`.
  - **Edit Feedback:** When user edits an outbound packet, record the exact git/text diff in `memory-hub` to steer future phrasing to the user's authentic style.
- **P0 Floor Invariant (กฎความปลอดภัยขั้นต่ำ):**
  - P0 critical rules, security alerts, and system-down checks can NEVER be learned away or suppressed by user skips.
- **"Why Didn't You Tell Me?" Observability:**
  - Every triage decision is logged via `memory_record_decision`. When asked why an event was withheld, answer strictly from durable logs (showing timestamp, baseline z-score, rubric tier, and route reason), converting user inquiries into approved threshold updates.

---

## 11. 🚀 Self-Cleaning Skill Layer & Auto-Harness Invariants (v2.3)
### ระบบกลั่นกรองและควบคุมเพดานความจำอัตโนมัติ (AutoHarness-Inspired Protocol)
- **English (Adopted from `tigerless-labs/autoharness`):**
  1. **Strict Altitude Cap on Distilled Skills (`AUTOHARNESS_SKILL_BODY_MAX_LINES = 25`):**
     - When synthesizing or updating any auto-distilled `SKILL.md`, the body MUST NOT exceed **25 non-blank lines**.
     - Auto-generated skills are high-altitude execution rules, NOT narrative transcripts. Detailed logs, historical rationale, and transcript evidence belong strictly in `references/evidence-<hash>.md` or `references/`.
  2. **Front-Loaded Trigger Invariant (`AUTOHARNESS_INDEX_DESC_MAX_CHARS = 60`):**
     - The first sentence of the skill description frontmatter MUST explicitly declare its **Trigger Cue within the first 60 characters** (e.g., `description: "Verify web apps using Playwright on localhost when testing UI..."`).
     - *Why:* Prevents trigger condition drop-off when index scanners truncate descriptions. Any skill proposal where the trigger condition is buried past character 60 must be rejected or rewritten.
  3. **Tri-Signal Lifecycle Telemetry (`Use` vs. `View` vs. `Patch`):**
     - Memory persistence and skill survival are determined by 3 decoupled signals:
       - **`use`**: Skill or pattern was actively invoked and executed (counts toward survival rate).
       - **`view`**: Skill or reference was inspected/read into context (evidence of recall relevance, but NOT adherence).
       - **`patch`**: Skill received an incremental refinement or correction.
     - **Opportunity-Relative Denominator:** Usage rate is measured as `loads / requests_arrived_since_creation`, NOT calendar days. Closing the notebook lid does not age out or penalize mature skills.
  4. **Probation & Capacity-Bound Archiving (Archive, Never Delete):**
     - Newly landed skills remain in a **Probation Period** (e.g., 100 requests) where they cannot be archived, giving them a fair sample.
     - Once mature, skills face capacity contention: nothing is archived until the mature pool exceeds capacity (e.g., 50 project / 20 global), after which the lowest usage rate is moved to `.archive/<skill>/`. Moving a folder back revives it with full lineage intact.
  5. **Curator Umbrella Folding & Append-Only Ledger:**
     - Periodic passes (or during `/compact`) evaluate the entire skill pool. Overlapping or near-duplicate skills must be **folded under an umbrella skill** rather than stacked.
     - Every creation, patch, fold, and archive is recorded in an append-only `.ledger.jsonl` with an action, reason, and evidence path.
- **ภาษาไทย:**
  1. **เพดานความยาว 25 บรรทัด (Altitude Cap):** ตัวเนื้อหา `SKILL.md` ที่สังเคราะห์ขึ้นต้องมีความยาวไม่เกิน 25 บรรทัด (ไม่นับบรรทัดว่าง) บังคับให้เขียนเฉพาะกฎปฏิบัติที่ชัดเจน ส่วนหลักฐาน Transcript ให้เก็บใน `references/evidence-<hash>.md`
  2. **คำสั่งเรียกใช้ต้องอยู่ 60 ตัวอักษรแรก (Front-Loaded Trigger):** ประโยคแรกของ Description ต้องระบุเงื่อนไขการเรียกใช้ทันที ป้องกันไม่ให้คำสั่งหายเมื่อถูกตัดคำในหน้าดัชนี
  3. **วัดผลด้วย 3 สัญญาณ (Tri-Signal Telemetry):** แยก `use` (เรียกใช้จริง), `view` (เปิดอ่าน), และ `patch` (แก้ไข) โดยวัดความถี่เทียบกับจำนวน Request คำสั่ง ไม่ใช่วันที่ตามปฏิทิน เพื่อไม่ให้ลบสกิลทิ้งตอนปิดจอโน้ตบุ๊ก
  4. **ช่วงทดลองงานและย้ายเข้ากรุเมื่อเต็ม (Probation & Archive):** สกิลใหม่มีช่วงทดลองงาน 100 คำสั่ง เมื่อพ้นช่วงแล้วหากคลังสกิลเต็ม จะย้ายสกิลที่ใช้น้อยที่สุดไปที่ `.archive/` โดยไม่ลบถาวร
  5. **หลอมรวมสกิลซ้ำซ้อน (Curator Fold):** รวมสกิลที่คล้ายกันเข้าเป็นร่มเดียวกัน พร้อมจดบันทึกลง `.ledger.jsonl` ทุกครั้ง

---

## 12. ⚡ XERJ-Powered Dynamic Retrieval & Zero-Token Indexing (v2.3)
### การค้นหาทักษะและความจำระดับ AST ผ่าน XERJ Engine โดยไม่เปลือง Token
- **English:**
  1. **Zero-Token Discovery Index:**
     - Rather than injecting heavy static skill indexes into every session-start prompt, the workspace skills, rules, and memory references are indexed via `xerj autoindex` or `xerj brain`.
  2. **AST-Aware Definition Retrieval (`xerj def` & `xerj search`):**
     - When agents need to locate a specific procedure, tool contract, or code invariant across workspaces, they query `xerj def "<symbol>"` or `xerj search "<query>"` to retrieve exact `file:line` blocks and passages.
  3. **Reference Coding Integration (`xerj code`):**
     - For novel architectural implementations or complex patterns, agents use `xerj code <corpus> "<query>"` to fetch verified open-source solutions into memory before authoring new skills.
- **ภาษาไทย:**
  1. **ค้นหาความจำแบบ Zero-Token ด้วย XERJ:** ทำการ Index คลังสกิลและกฎความจำด้วย XERJ เพื่อให้ Agent สามารถค้นหาและดึงเฉพาะส่วนที่ต้องการแบบ On-Demand โดยไม่ต้องยัดข้อความ Index ยาวๆ ค้างไว้ในบริบทแชต
  2. **ดึงเฉพาะจุดระดับ `file:line` (`xerj def` / `xerj search`):** เรียกดูเฉพาะส่วนฟังก์ชันหรือนิยามที่เกี่ยวข้อง ประหยัด Token ได้มากกว่า 80%
  3. **ตรวจสอบโค้ดอ้างอิงก่อนสร้างสกิล (`xerj code`):** ค้นหารูปแบบโค้ดต้นแบบที่ผ่านการพิสูจน์แล้วผ่านคลัง Corpus ก่อนสร้างเป็นสกิลใหม่


