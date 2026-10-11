---
name: smart-model-routing
description: "3-Tier Smart Model Routing Rule for Subagent Delegation"
trigger: always_on
---

# 🧠 3-Tier Smart Model Routing Rule
# 🧠 กฎเหล็กสากล: การเลือกใช้รุ่นสมอง 3 ระดับตามความยากของงาน

## 📌 Core Principle / หลักการสำคัญ
When spawning subagents via `invoke_subagent`, always route workloads through the optimal tier based on cognitive complexity and execution speed. Never waste frontier model resources on simple file-scanning tasks, and never under-power complex architectural decisions.

เมื่อมีการแตกงานให้ Subagents (`invoke_subagent`) ต้องคัดเลือกรุ่นสมองตาม 3 ระดับความยากของงานเสมอ เพื่อให้ได้งานคุณภาพสูงสุด รวดเร็ว และประหยัดทรัพยากร

---

## ⚡ Tier 1: High-Speed Labor & Discovery (ระดับที่ 1: งานใช้แรงงานและค้นหาความเร็วสูง)
- **Model Target:** `Model: "flash"` or `"flash_lite"`
- **Workload Types:**
  - File discovery, folder scanning, and glob pattern searches (File Discovery / Globbing)
  - Raw log analysis, text extraction, scraping parsing, and initial documentation scans
  - Quick syntactic lookups and structural file index compilation
- **Objective / เป้าหมาย:** Maximum execution speed in milliseconds; fast worker subagents scanning and returning raw facts without latency.

---

## 🛠️ Tier 2: Standard Complex Engineering (ระดับที่ 2: งานวิเคราะห์และเขียนโค้ดมาตรฐาน)
- **Model Target:** `Model: "pro"`
- **Workload Types:**
  - Feature implementation, component development, and unit test authoring
  - Standard bug diagnosis, refactoring, and lint compliance
  - REST/GraphQL API design and modern frontend UI styling
  - Data transformation pipelines and database query scripting
- **Objective / เป้าหมาย:** High quality, precision engineering, and fast iteration for day-to-day software development tasks.

---

## 👑 Tier 3: Mission-Critical Architecture & Frontier Logic (ระดับที่ 3: งานสถาปัตยกรรมระดับสูง)
- **Model Target:** `Model: "inherit"` (Frontier / Highest Available Model)
- **Workload Types:**
  - Multi-tier system architecture and distributed consensus protocols
  - High-stakes algorithmic reasoning and multi-layer debugging
  - Zero-tolerance financial, security, cryptographic, or compliance calculations
  - Complex multi-agent orchestrations where sub-agents might drift or fail
- **Guideline / แนวทางปฏิบัติ:**
  - Route with `Model: "inherit"` so the subagent utilizes the top-tier reasoning capabilities of the primary session.
  - If the primary session is running on an economy tier for an exceptionally difficult problem, advise the user that switching the primary session to a frontier reasoning model (e.g., Opus / Ultra) will maximize problem-solving precision.
