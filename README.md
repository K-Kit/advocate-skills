# Advocate Skills

Ready-made instructions that teach ChatGPT or Claude a specific job.

| Skill | What it does |
| --- | --- |
| **Physician Summary** | Turns a medical document (chart notes, discharge summary, study, guideline) into a short, highly technical TL;DR for doctors, then a more thorough summary. Ask for "TL;DR only" or "detailed only" to get just one. |

> **Patient privacy:** Do not upload records that identify a patient unless your organization has approved your ChatGPT or Claude account for patient data (for example, a plan covered by a HIPAA business associate agreement). Otherwise, remove names, dates of birth, record numbers, and other identifiers first.

## 1. Download

| File | Use it for |
| --- | --- |
| [physician-summary.zip](https://github.com/K-Kit/advocate-skills/releases/latest/download/physician-summary.zip) | **Claude** (any plan) and **ChatGPT Business / Enterprise / Healthcare / Edu** |
| [physician-summary-instructions.md](https://github.com/K-Kit/advocate-skills/releases/latest/download/physician-summary-instructions.md) | **ChatGPT Free / Plus / Pro**, or a Claude Project |

Do not unzip the ZIP file; upload it as is.

## 2. Install

Choose **one** option below.

### Option A: Claude (claude.ai or the Claude app)

1. Open **Settings → Capabilities** and turn on **Code execution and file creation** (it may be called **Create and edit files**). On Team or Enterprise plans, your admin may need to turn on Skills first.
2. Go to **Customize → Skills** ([claude.ai/customize/skills](https://claude.ai/customize/skills)).
3. Click **+**, then **Create skill**, then **Upload a skill**.
4. Choose `physician-summary.zip`.
5. Make sure the **physician-summary** switch is on.

### Option B: ChatGPT Business, Enterprise, Healthcare, or Edu

1. In the ChatGPT sidebar, click **Plugins**, then the **Skills** tab.
2. Click **Create**, then **Upload from your computer**.
3. Choose `physician-summary.zip`.
4. Wait for the safety scan to finish. If it shows **Needs Review**, open it and confirm.

If you don't see **Skills** or the upload option, your workspace admin has not enabled it; use Option C.

### Option C: Any ChatGPT plan, or a Claude Project

1. Create a project:
   - **ChatGPT:** click **New project** in the sidebar and name it "Physician Summary."
   - **Claude:** go to [claude.ai/projects](https://claude.ai/projects), click **+ New Project**, and name it "Physician Summary."
2. Upload `physician-summary-instructions.md` to the project: in ChatGPT, add it as a project file; in Claude, click **+** next to project knowledge.
3. Open the project's instructions (ChatGPT: **••• → Project settings**; Claude: **Set project instructions**) and paste:

   ```text
   For every document I share, follow physician-summary-instructions.md exactly. Unless I ask for only one, give the TL;DR first, then the detailed summary.
   ```

4. Start every summary chat **inside this project**.

## 3. Use it

Attach or paste the document, then ask, for example:

- "TL;DR and detailed summary for a cardiologist."
- "TL;DR only."
- "Detailed summary only, focus on medications."

With Options A and B, the assistant uses the skill automatically. If it doesn't, start your request with "Use the physician-summary skill."

Always check the summary against the source before relying on it clinically.

## For maintainers

Edit the skill in `physician-summary/`, then rebuild and publish the downloads:

```bash
scripts/build.sh
gh release create "v$(date +%Y.%m.%d-%H%M)" dist/* --title "Skills $(date +%Y-%m-%d)" --notes "Updated skills"
```

`scripts/build.sh` packages every folder that contains a `SKILL.md`, and fails if a skill name doesn't match its folder or a description exceeds Claude's 200-character limit.
