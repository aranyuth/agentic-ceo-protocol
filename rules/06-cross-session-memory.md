---
name: cross-session-memory
description: "Universal Cross-Session Memory, Auto-Recall, and Zero-Amnesia Protocol for AntiGravity and Memory Hub"
trigger: always_on
---

# 🧠 Cross-Session Memory & Zero-Amnesia Protocol
# 🧠 กฎเหล็กสากล: ระบบความจำข้ามเซสชันและการป้องกันภาวะสมองเสื่อม (Zero-Amnesia Protocol)

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
