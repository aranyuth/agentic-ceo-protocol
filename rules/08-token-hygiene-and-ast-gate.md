# ⚡ Universal Token Hygiene, AST Gatekeeper & Strategic Compaction Protocol
# ⚡ กฎเหล็กสากลข้อที่ 8: การรีดประสิทธิภาพ Token, ด่านตรวจโครงสร้าง AST และการบีบอัด Context เชิงกลยุทธ์

## 📌 Core Philosophy / ปรัชญาหลัก
> **"Optimize the Context Window. Persist Everything Else. Prove Structure on Disk."**
> *(รีดหน้าต่าง Context ให้เบาและคมที่สุด เก็บสถานะถาวรลงดิสก์/Memory Hub และพิสูจน์คุณภาพโครงสร้างโค้ดด้วย AST)*
>
> Synthesized from **GODKILLER-ZERO** (`taurus42119-stack/GODKILLER-ZERO`) and **ECC v2.2.3** (`affaan-m/ECC`), this rule eliminates token bloat across file reading, terminal output, code authoring, and long-running sessions—elevating Token Lightness from `6.0/10` to `8.8+/10` without sacrificing verification rigor.

---

## 1. 🗺️ Skeleton-First File Reading (`gk_get_repo_map` & Line-Slice Rule)
### อ่านแผนที่โครงสร้าง (Repo Map) ก่อนเสมอ ห้ามดึงไฟล์ขนาดใหญ่เข้า Context ทั้งดุ้น
- **English:**
  1. **No Raw Large-File Dumps (>150 Lines):** Never read an entire unfamiliar source file exceeding 150 lines into context just to locate a function or type.
  2. **Repo Map / Grep Preflight:** Before inspecting a multi-file module, generate an AST symbol skeleton (`godkiller-console.exe --repo-map <dir>` or MCP `gk_get_repo_map` capped at ~2,048 tokens) or use targeted ripgrep/line-search to identify exact `StartLine` and `EndLine` coordinates.
  3. **Surgical Line Slicing:** Always invoke `view_file` with explicit `StartLine` and `EndLine` bounds around the target symbol.
- **ภาษาไทย:** ห้ามใช้ `view_file` เปิดอ่านไฟล์โค้ดดิบที่ยาวเกิน 150 บรรทัดเข้ามาทั้งไฟล์โดยไม่จำเป็น ให้สแกนหาเลขบรรทัดจาก **AST Repo Map (`gk_get_repo_map` / `--repo-map`)** หรือค้นหาพิกัดบรรทัดก่อน แล้วเจาะอ่านเฉพาะช่วงบรรทัด (`StartLine`–`EndLine`) ที่ต้องแก้ไข เพื่อประหยัด Input Token ลง 70–80%

---

## 2. ✂️ Terminal Log Pruning & 1-Line Verification (`TerminalPruner`)
### บีบอัดผลลัพธ์การรันเทสต์และคำสั่ง Terminal ไม่ให้ขยะล้น Context
- **English:**
  - Verbose test suites (`cargo test`, `jest`, `vitest`, `pytest`, `git diff`) often dump hundreds of lines of passing logs, ANSI escape codes, and progress bars into the conversation transcript.
  - When running noisy test/build commands, route output through `godkiller-console.exe --run <cmd>` or pipe through `--prune -` (or limit output to the final summary + failure stack traces).
  - Passing verification gates must be recorded concisely (`[OK] [<RUNNER>_VERIFIED] X passed in Ys`), while failing gates extract only the exact failing assertions and line numbers.
- **ภาษาไทย:** เมื่อรันชุดทดสอบหรือคำสั่ง 빌드ที่พ่นข้อความยาวเหยียด ให้ตัด ANSI code และบรรทัดที่ผ่านแล้วออก เหลือเพียงบรรทัดสรุปผล (`[OK] [VERIFIED]`) หรือใช้ `godkiller-console.exe --run` เพื่อย่อ Log หลายร้อยบรรทัดให้เหลือ 1 บรรทัดหากเทสต์ผ่าน และแสดงเฉพาะจุดที่พังหากเทสต์ตก

---

## 3. 🛑 Thai/English Loop Circuit Breaker & Negative Polarity Guard
### เบรกฉุกเฉินเมื่อเกิดอาการแก้ไม่หาย และเคารพคำสั่งห้ามอย่างเด็ดขาด
- **English:**
  1. **Loop Circuit Breaker:** If the user signals a repeated failure using Thai or English loop triggers (*"ยังไม่ได้"*, *"พังเหมือนเดิม"*, *"แก้ไม่หาย"*, *"วนลูป"*, *"ซ้ำซาก"*, `"still failing"`, `"same error"`, `"not working"`), **IMMEDIATELY HALT speculative full-file rewrites**. Do not guess-and-overwrite the same file again. Pause to inspect actual runtime stderr/stdout, trace the root cause, or isolate the failing assertion in a minimal reproduction script.
  2. **Negative Polarity Lock (Zero Ghost Edits):** Explicitly honor Thai/English negative constraints (*"อย่า"*, *"ห้าม"*, *"ไม่ต้อง"*, *"ยกเว้น"*, `"do not touch"`, `"keep X intact"`). Never modify, reformat, or "clean up" files or functions that the user prohibited touching.
- **ภาษาไทย:**
  1. **ระบบตัดวงจรการวนลูป (Loop Breaker):** ทันทีที่ผู้ใช้ทักว่า *"ยังไม่ได้"*, *"พังเหมือนเดิม"*, *"แก้ไม่หาย"* หรือ *"วนลูป"* ห้าม AI เดาโค้ดเขียนทับไฟล์เดิมซ้ำๆ เด็ดขาด ต้องหยุดอ่าน Runtime Log จริงเพื่อหาสาเหตุรากเหง้าก่อน
  2. **ล็อกคำสั่งห้าม (Negative Polarity):** เมื่อมีคำว่า *"อย่า"*, *"ห้าม"*, *"ไม่ต้อง"*, *"ยกเว้น"* ห้ามแตะต้องหรือแอบแก้โค้ดส่วนนั้นโดยเด็ดขาด (ป้องกัน Ghost Edits)

---

## 4. 🏛️ Hard AST Code Hygiene Gate (`CC <= 7`, `Span <= 70`, Zero Stubs)
### ควบคุมความซับซ้อนของโค้ดด้วยด่านตรวจ AST ก่อนส่งงาน
- **English:**
  - Every newly authored or refactored function should respect the **KEN Discipline Budget**:
    - **Cyclomatic Complexity (`CC`) <= 7**
    - **Function Span <= 70 lines**
    - **Zero Lazy Stubs:** Never leave `// TODO`, `// FIXME`, `unimplemented!()`, `todo!()`, or silent empty `catch {}` blocks in delivered production code.
  - Keeping functions under 70 lines with low branching ensures future edits require tiny, surgical diffs—compounding token savings across the entire lifecycle of the repository.
  - Before claiming completion on substantial Rust, TypeScript, Python, or C# codebases, run `godkiller-console.exe --gate <path>` (or MCP `gk_claim_done` / `gk_gatekeeper_scan`) alongside unit tests.
- **ภาษาไทย:** โค้ดที่เขียนใหม่ต้องกระชับ มีความซับซ้อนเชิงตรรกะ (`Cyclomatic Complexity`) ไม่เกิน 7 และความยาวต่อฟังก์ชันไม่เกิน 70 บรรทัด รวมถึงห้ามทิ้งโค้ดครึ่งๆ กลางๆ (`// TODO`, `catch {}` ว่างเปล่า) เพื่อให้การแก้ไขในอนาคตใช้ Diff ขนาดเล็กและประหยัด Token แบบทบต้น

---

## 5. 🔍 Search-First Preflight (`Adopt > Extend > Compose > Build`)
### ค้นหาก่อนเขียนใหม่เสมอ ลดการปั่น Output Token ซ้ำซ้อน
- **English:**
  - Before authoring any new helper, utility, parser, or UI primitive, execute the **Search-First Preflight**:
    1. Search the existing workspace (`grep` / `rg` / `gk_get_repo_map`) to verify whether an equivalent helper already exists.
    2. Inspect `package.json` / `Cargo.toml` / `pyproject.toml` to leverage already-installed libraries instead of writing 200+ lines of custom boilerplate from scratch.
- **ภาษาไทย:** ก่อนเขียนฟังก์ชันช่วยเหลือหรือโมดูลใหม่ ต้องค้นหาในโปรเจกต์และเช็ค Library ที่ติดตั้งอยู่แล้วเสมอ (`Adopt > Extend > Compose > Build`) เพื่อไม่ให้เสีย Output Token เขียนโค้ดซ้ำซ้อนโดยไม่จำเป็น

---

## 6. 🧠 Phase-Boundary Strategic Compaction & Confidence Instincts
### บีบอัด Context ที่รอยต่อเฟสงาน และกลั่นบทเรียนแบบมีระดับความมั่นใจ
- **English:**
  1. **Phase-Boundary Compaction:** Never wait until the context window hits 95% mid-implementation. When transitioning between major phases (`Research & Discovery` -> `Architecture & Plan` -> `Implementation`), persist the verified plan and state into `PROGRESS.md` or `Memory Hub`, and recommend `/compact` at the phase boundary if the session has accumulated heavy exploration logs (>40 tool calls or >150K tokens).
  2. **Lazy MCP Discipline:** Keep MCP servers in `Lazy` loading mode by default and keep active workspace tool schemas lean (<80 eager tools). Prefer CLI skills for stateless one-shot operations.
  3. **Confidence-Weighted Learning (`Instincts`):** When recording recurring user preferences or project patterns into `Memory Hub`, scope framework-specific habits to the **project** level first, and promote universal rules to **global** directives only after high-confidence verification across tasks.
- **ภาษาไทย:**
  1. **บีบอัดที่รอยต่อเฟส (Strategic Compact):** เมื่อจบเฟสค้นหาข้อมูลและวางแผน ให้บันทึกข้อสรุปลง `PROGRESS.md` หรือ `Memory Hub` ทันที หากใช้ Tool ไปเยอะแล้ว ให้แนะนำ `/compact` ช่วงเปลี่ยนเฟสก่อนเริ่มลงมือเขียนโค้ดจริง
  2. **คุมน้ำหนัก MCP:** รักษาโหมด `Lazy` ของ MCP Server เสมอเพื่อไม่ให้ Schema ไปถ่วงทุกเทิร์น
  3. **การเรียนรู้แบบแยกขอบเขต (Project vs Global Instincts):** แยกความจำเฉพาะโปรเจกต์ออกจากกฎสากล และยกระดับขึ้นเป็นกฎถาวรเมื่อมีความมั่นใจสูงเท่านั้น

---

## 7. 🏛️ Google Harness² 5-Tier Component Cost Hierarchy & `Pay-For-What-You-Add`
### ลำดับขั้นต้นทุน 5 ระดับ และกฎการคุมเพดาน Always-On Rules
- **English (Adopted from `google-research/harness2`):**
  1. **5-Tier Component Cost Order:** Always-on prose is the most expensive option because every token competes with the model's output budget on every turn. When encoding reusable capabilities, strictly prefer in this order:
     - **Tier 1: `SKILL` (On-Demand, 0 Idle Cost)** — Default form for workflows with a recognizable trigger.
     - **Tier 2: `SCRIPT` (Deterministic Helper, 0 Idle Cost)** — For calculations, audits, or parsers that models hand-roll slowly or inaccurately.
     - **Tier 3: `SUBAGENT` (`Large-Input / Small-Output` Law)** — Spawn a subagent **ONLY** when the sub-task's **INPUT is large** (e.g., scanning 20 files, deep web research) and its **RETURNED ANSWER is small** (a concise synthesis or file path). Never spawn a subagent when its output is as large as its input.
     - **Tier 4: `HOOK / PLUGIN` (In-Loop Enforcement, 0 Prompt Cost)** — For mechanical guardrails inside the tool loop.
     - **Tier 5: `ALWAYS-ON TEXT` (Last Resort, Hard-Capped)** — Only for short invariants that apply to 100% of turns. **Pay-For-What-You-Add Rule:** Total always-on rules (`rules/*.md`) must stay under the `45,000` character budget; adding new always-on prose requires trimming equal characters elsewhere.
  2. **Pointer-First Context Passing:** When delegating multi-file evidence to subagents or `/arena`, write raw artifacts to disk and pass a short pointer index (`MISSION.md` / file paths) rather than pasting massive raw payloads into prompts.
- **ภาษาไทย:**
  1. **เรียงลำดับการสร้างเครื่องมือจากประหยัดสุดไปแพงสุด:** `1. Skill (โหลดเมื่อเรียก) -> 2. Script (แม่นยำ 100%) -> 3. Subagent (ใช้เฉพาะงานที่ ขาเข้าใหญ่-ขาออกสั้น) -> 4. Hook -> 5. Always-On Rule (ทางเลือกสุดท้าย)` และใช้กฎ **Pay-For-What-You-Add** (หากเพิ่มกฎถาวร ต้องกระชับข้อความเดิมไม่ให้เกินเพดาน 45,000 ตัวอักษร)
  2. **ส่งงานผ่าน Pointer File:** เวลาส่งข้อมูลใหญ่ให้ Subagent ให้เซฟลงไฟล์แล้วส่งเฉพาะ Path สารบัญ ไม่ยัดข้อความดิบยาวๆ ลงใน Prompt

---

## 8. 📐 Deliverable Shape Invariant (`The Deliverable's Shape Belongs to the Request`)
### ห้ามแอบเปลี่ยนโครงสร้าง ชื่อคอลัมน์ หรือรูปแบบไฟล์งานที่ผู้ใช้กำหนดเด็ดขาด
- **English (Adopted from `google-research/harness2`):**
  - A harness governs **HOW** the agent works; it must **NEVER alter WHAT SHAPE the artifact delivers**.
  - When a user or downstream system specifies exact JSON keys, CSV/Excel column headers, sheet names, section orders, or file formats:
    1. **Zero Unauthorized Columns/Keys:** Never add "helpful" explanatory columns, commentary fields, or renamed headers inside the deliverable file itself. Put reasoning and explanations in the chat response or Judge Scorecard, never inside the structured data output.
    2. **Computed Values Over Formulas/Placeholders:** When a task asks for a calculated value, deliver the final computed value—never leave uncomputed placeholders or descriptions of how the user can calculate it themselves.
- **ภาษาไทย:**
  - **ห้ามหวังดีแอบเปลี่ยนรูปร่างไฟล์งาน (Deliverable Shape Lock):** เมื่อโจทย์กำหนดชื่อคอลัมน์ CSV/Excel, โครงสร้าง JSON, หรือลำดับหัวข้อมาให้ ห้ามแอบเปลี่ยนชื่อหัวตารางหรือแอบเพิ่มคอลัมน์อธิบายวิธีคิดเข้าไปในไฟล์งานจริงเด็ดขาด (คำอธิบายให้เขียนไว้ในแชตหรือ Judge Scorecard เท่านั้น) และต้องคำนวณค่าจริงให้เสร็จสมบูรณ์ ห้ามทิ้งสูตรค้างหรือเว้นว่างให้ผู้ใช้ไปบวกเลขต่อเอง

---

## 9. 🔒 Karpathy's Immutable Eval Guard & Graph Rollback Routing (Hybrid v4)
### ล็อกไฟล์ข้อสอบห้ามแก้ไขเพื่อเอาตัวรอด และแยกเส้นทางย้อนกลับตามสาเหตุเมื่อเทสต์พัง
- **English (Adopted from `walkinglabs/learn-harness-engineering` Lectures 13–14):**
  1. **Immutable Evaluation Harness (`Test-Tampering Lock`):** Treat existing test suites, evaluation scripts, and benchmark harnesses (`tests/`, `*.test.*`, `*.spec.*`, `prepare.py`, `validate-*`) as **Read-Only Evaluation Infrastructure** during bug fixes and feature implementation. **NEVER weaken, delete, comment out, or skip existing assertions** to make verification pass without explicit user directive (`# why: Karpathy autoresearch invariant — prevents Goodhart metric gaming`).
  2. **Graph Engineering Conditional Rollback Routing (`Explicit Rollback Edges`):** When verification fails, classify the root cause and route along explicit graph edges instead of blindly looping on code mutations:
     - **Syntax / Logic / Type Defect** $\rightarrow$ Route to **Implement Node** (apply surgical code fix; max 2 attempts before triggering `principle-attack-the-premise`).
     - **Missing API Contract / Wrong Premise / Schema Mismatch** $\rightarrow$ Route back to **Research / Discovery Node** (re-inspect ground-truth docs, schemas, or runtime logs before touching code).
     - **Goodhart & Reality Anchor Guard:** Verify that passing the automated check genuinely satisfies the user's real-world business goal.
- **ภาษาไทย:**
  1. **ห้ามแก้ข้อสอบเพื่อให้ตัวเองสอบผ่าน (`Immutable Eval Lock`):** ล็อกไฟล์เทสต์และสคริปต์ตรวจรับ (`tests/`, `*.spec.*`, `prepare.py`) เป็น Read-Only ระหว่างแก้โค้ด ห้ามลบหรือลดความเข้มงวดของ Assertion เพื่อให้เทสต์เขียวโดยพลการเด็ดขาด
  2. **แยกเส้นทางย้อนกลับเมื่อเทสต์พัง (`Graph Rollback Routing`):** ห้ามวนแก้โค้ดมั่วซ้ำๆ เมื่อเทสต์ตก ให้แยกเส้นทางตามสาเหตุ: หากเป็นบั๊กตรรกะ/ไวยากรณ์ ให้ถอยไป **โหนดแก้โค้ด (Implement Node)** แต่หากเกิดจากข้อมูลไม่ครบหรือเข้าใจ API ผิด ให้ถอยกลับไป **โหนดค้นคว้า (Research Node)** ทันที พร้อมเช็ค **Reality Anchor** ว่าผลลัพธ์ตรงกับเป้าหมายจริงของผู้ใช้
