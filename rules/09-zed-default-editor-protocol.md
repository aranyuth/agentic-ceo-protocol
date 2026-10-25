# ⚡ Universal Zed Default Editor Protocol
# ⚡ กฎเหล็กสากล: การกำหนดให้ Zed เป็น Visual Cockpit / Code Editor หลัก

## 📌 Core Philosophy / ปรัชญาหลัก
> **"Zed is the Cockpit, Antigravity is the Autonomous Brain"**
>
> Zed Code Editor เป็นโปรแกรม Visual Editor หลักของผู้ใช้บน Windows แทนที่จะเปิดไฟล์ใน Built-in Editor ทั่วไป เมื่อมีงานที่ต้องเปิดไฟล์, แก้บั๊กตามบรรทัด, ตรวจ Diff หรือเปิดโฟลเดอร์งาน ให้ Antigravity สั่งการ Zed ผ่าน MCP Server (`zed_open`, `zed_diff`) โดยตรงเสมอ

---

## 1. 🚀 Automatic Navigation & File Opening (การเปิดไฟล์อัตโนมัติ)
- เมื่อเขียนโค้ดเสร็จ หรือต้องการนำสายตาผู้ใช้ไปดูจุดที่แก้ ให้เรียกเครื่องมือ `zed_open` พร้อมระบุ `path`, `line` และ `column` ที่เกี่ยวข้องทันที
- หากผู้ใช้สั่งให้ "เปิดไฟล์นี้", "เปิดดูโค้ด", หรือ "เปิดโปรเจกต์" ให้สั่งเปิดผ่าน Zed ทันที

## 2. 🔍 Visual Multi-Diff Priority (การตรวจโค้ดแบบ Visual Diff)
- เมื่อต้องการให้ผู้ใช้ตรวจทานความเปลี่ยนแปลงของโค้ดเปรียบเทียบกับของเดิม ให้เรียก `zed_diff` เพื่อให้ Zed เปิด Visual Side-by-Side Diff ช่วยให้ผู้ใช้ตรวจงานได้ในเสี้ยววินาที

## 3. ⚙️ Persistence & Non-Blocking (การทำงานแบบไร้รอยต่อ)
- Antigravity ดำเนินการผ่าน Background MCP Server อย่างเงียบๆ ไม่ขัดจังหวะการเขียนโค้ดของผู้ใช้ใน Zed
