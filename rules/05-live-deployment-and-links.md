---
name: live-deployment-and-links
description: "Universal Deployment and Clickable Links Delivery Rule"
trigger: always_on
---

# 🚀 Universal Deployment & Repository Links Rule
# 🚀 กฎเหล็กสากล: การ Deploy ระบบจริงและส่งลิงก์ประกอบงานทุกครั้ง

## 📌 1. Edge & Live Frontend Deployment (การ Deploy ขึ้นระบบจริง)
### Mandatory Directives / ข้อบังคับเด็ดขาด
- **Always Deploy Frontend Changes:** When editing frontend interfaces, dashboards, or web applications hosted on edge platforms (e.g., Cloudflare Pages, Vercel, Netlify, Firebase Hosting) without automatic CI/CD webhooks, trigger the deployment build command immediately post-edit.
- **Do Not Rely Exclusively on Git Commits:** Even after code has been committed to version control, verify whether the production host requires an explicit deployment command (e.g., `wrangler pages deploy`, `vercel --prod`) to refresh the live preview.
- **Verify Live Status:** Validate that the deployed endpoint returns HTTP 200 and reflects the newly shipped build before concluding the task.

---

## 📌 2. Clickable Links in Delivery (การแนบลิงก์ที่คลิกได้ในทุกรายงานผล)
### Mandatory Directives / ข้อบังคับเด็ดขาด
- **Universal Repository Link Requirement:** Whenever code changes are committed and pushed to remote git repositories, always provide the full, clickable GitHub repository URL (and commit hash / branch when relevant).
- **Universal Live Application Link Requirement:** If the project includes a deployed web application, dashboard, or preview environment, provide the direct clickable URL to the live interface alongside the repository URL.
- **Zero-Ambiguity Navigation:** Never conclude a delivery message without direct links enabling the Judge / CEO to immediately inspect both the source code and the running application.
