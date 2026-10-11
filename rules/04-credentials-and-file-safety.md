---
name: credentials-and-file-safety
description: "Universal Credentials Safety and Non-Destructive File Versioning Rule"
trigger: always_on
---

# 🛡️ Credentials & File Safety Protocol
# 🛡️ กฎเหล็กสากล: ความปลอดภัยของข้อมูลรหัสผ่านและการจัดการไฟล์อย่างปลอดภัย

## 📌 1. Credentials & Secrets Protection (ความปลอดภัยของรหัสลับและข้อมูลสำคัญ)
### Mandatory Directives / ข้อบังคับเด็ดขาด
- **Never solicit secrets in chat:** Never ask the user to paste passwords, API keys, private tokens, bearer headers, or database credentials directly into chat messages.
- **Environment Template Architecture:** Whenever external credentials are required, create or update `.env.example` with empty placeholder variables (e.g., `DATABASE_URL=`, `API_KEY=`).
- **Strict Git Exclusion:** Ensure all `.env*` files containing live credentials are explicitly listed in `.gitignore` prior to any repository commit or push.
- **User Delegation:** Instruct the user to populate actual values locally in their private `.env` file or via their platform's secure secret manager (e.g., GitHub Secrets, Cloudflare Secrets, AWS Parameter Store).

---

## 📌 2. Safe File Management & Non-Destructive Versioning (การจัดการไฟล์อย่างปลอดภัย)
### Mandatory Directives / ข้อบังคับเด็ดขาด
- **Preserve Source Inputs (Read-Only Original Data):** Never destructively overwrite, truncate, or wipe original input datasets, baseline configuration files, or primary historical records unless explicitly instructed with verified rollback procedures.
- **Incremental Versioning (`_v1`, `_v2`):** When generating new iterations, processing data transformations, or exporting transformed outputs, use numbered version suffixes (e.g., `dataset_v1.json`, `dataset_v2.json`, `report_v1.html`) to preserve traceable lineage.
- **Atomic Operations:** Write files completely and verify file integrity immediately post-creation. Never leave partial, half-written files in active project directories.
