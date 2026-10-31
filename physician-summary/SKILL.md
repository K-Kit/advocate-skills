---
name: physician-summary
description: Summarize supplied documents for physicians using highly technical medical language, with an ultra-concise TL;DR followed by a detailed summary or either version alone. Use when the user asks for a TL;DR, TLDR, brief, or thorough summary of a clinical record, study, guideline, or other document for doctors, physicians, clinicians, or specialists; not for patient-facing plain-language explanations.
---

# Physician Summary

Write a source-faithful, information-dense summary for a physician. Use precise medical terminology and familiar clinical abbreviations. Optimize for the fewest words that preserve clinical meaning, uncertainty, and consequential findings.

## Choose the output

| User request | Deliverable |
| --- | --- |
| Unspecified, “summarize,” or “both” | **TL;DR**, then **Detailed summary**, in that order |
| “TL;DR only,” “brief only,” or equivalent | **TL;DR** only |
| “Detailed only,” “thorough only,” or equivalent | **Detailed summary** only |

Each version must stand alone: identify the patient context, population, or document question without relying on the other version. Honor the requested specialty, length, language, and format. If no specialty is given, write for a broadly trained physician; do not delay for a preference question.

- **TL;DR:** Usually 1–3 compact sentences or bullets, roughly 30–80 words; shorter when sufficient. Telegraphic clinical register is expected: verbless fragments, semicolon-joined findings, standard abbreviations. Lead with the clinical bottom line, retain the decisive evidence, and include the caveat or unresolved issue that changes interpretation. These are flexible targets, never a reason to drop a critical fact or pad a short source.
- **Detailed summary:** Usually 200–500 words for a substantial document, scaled to source complexity and the request. Add relevant chronology, quantitative findings, methods, management, and limitations. Use short paragraphs or problem-oriented bullets; omit empty sections and textbook background.

Start with the requested summary, without a conversational preamble. Put a material source limitation in its opening line when needed. Do not append generic medical disclaimers, a glossary of routine terms, or an offer to continue.

## Read and select

Read the supplied document using available local/document tools, including relevant tables, captions, footnotes, and appendices. If extraction loses columns or produces suspect values, inspect the original page before using them. Ask for the document if none is accessible; never summarize from a title alone. For an excerpt or abstract, identify the limited scope rather than imply full-text review. If only part is readable, summarize that part and state the clinically material gap; do not guess missing text or numbers.

Use the supplied material as the factual boundary. Do not browse to fill missing clinical facts or silently update an old guideline. If the user separately requests external verification or recommendations, distinguish that work and its sources from the document summary. Do not send patient records to external services merely to produce a summary.

For clinical records, studies/reviews, or guidelines, consult the matching section of [references/document-types.md](references/document-types.md). For other documents, distill the thesis, evidence, and supported clinical relevance without inventing a diagnosis or forcing a patient-note template.

Prioritize what changes a physician's understanding: current problem or question; decisive findings; treatment or recommendation actually documented; trajectory; major harms, contraindications, uncertainties, and pending actions. Deduplicate repetition. Retain normal or negative findings when they materially constrain interpretation. Omit administrative details and unnecessary identifiers.

## Compress without changing meaning

- Preserve negation, temporality, laterality, severity, attribution, and diagnostic certainty. “Cannot exclude” is not “confirmed”; “not documented” is not “absent.” Keep patient-reported history distinct from objective findings. Do not infer diagnoses, staging, causality, or management from suggestive data alone.
- Retain units, timepoints, denominators, comparators, and uncertainty intervals with consequential numbers. Do not interchange HR, RR, and OR, treat a composite outcome as its individual components, or convert a nonsignificant result into proof of no effect/equivalence. Label any necessary calculated value as derived and verify it; do not invent unreported estimates.
- Distinguish historical, active, proposed, held, and discontinued treatments. Preserve consequential drug, dose, route, frequency, duration, and allergy/reaction information when provided. A documented plan remains a reported plan, not a new prescription from the summarizer.
- Surface unresolved discrepancies with their dates/sources; do not silently reconcile conflicting doses or diagnoses. Let an explicit correction supersede the corrected statement. Make a critical discrepancy or limitation visible in the TL;DR too.
- Prefer technically precise equivalents only when they preserve the source's meaning. Use context-clear abbreviations such as HFrEF, LVEF, eGFR, RCT, and CI; expand an uncommon or ambiguous term once. Avoid invented acronyms and compressed strings that obscure relationships.
- Use full drug names and unambiguous medication notation: “units,” “daily,” “every other day,” “mcg,” and “mL.” Avoid U/IU, QD/QOD, MS/MSO4/MgSO4, and other ambiguous drug shorthand. Write medication doses as `0.5 mg` and `5 mg`, not `.5 mg` or `5.0 mg`; preserve meaningful precision in laboratory or imaging measurements.

## Output format

Use bold labels exactly as below; drop the unrequested section entirely.

```markdown
**TL;DR:** [bottom line; decisive evidence; interpretation-changing caveat]

**Detailed summary:**
- [problem/question, context]
- [findings, course, or results with numbers and locators]
- [documented management/recommendations; pending items, owners, timing]
- [limitations, discrepancies]

*Source:* [title/filename, date]
```

Example (synthetic discharge summary, both versions):

```markdown
**TL;DR:** 68M, ischemic HFrEF (LVEF 25%), admitted for ADHF; IV furosemide, net −6.2 L, NYHA IV→II. Course c/b AKI (Cr 1.3→2.1 mg/dL, 1.5 at discharge); sacubitril/valsartan held, not restarted. Spironolactone status conflicting across notes. Pending: BMP at 1 wk; ARNI rechallenge undecided, owner not documented.

**Detailed summary:**
- Hx: ischemic CMP, LVEF 25% (TTE 3/2026), ICD, CKD 3a (baseline Cr 1.3 mg/dL). Presented with 2 wk orthopnea, 7 kg weight gain, NT-proBNP 8,400 pg/mL.
- Course: furosemide 80 mg IV twice daily ×4 d, net −6.2 L; Cr peaked 2.1 mg/dL on HD3, attributed by team to hemodynamic AKI (UA bland, no renal US). K 5.6 mmol/L on HD3, resolved after ARNI hold.
- Discharge regimen: furosemide 40 mg PO daily, carvedilol 12.5 mg twice daily, dapagliflozin 10 mg daily; spironolactone status unresolved (below).
- Pending: BMP 1 wk; HF clinic 2 wk. ARNI rechallenge "per outpatient cardiology" (no named clinician).
- Discrepancy: discharge med list includes spironolactone 25 mg daily; HD4 progress note states held for hyperkalemia (p. 3 vs p. 6).

*Source:* Discharge summary, General Medicine, 2026-10-12.
```

## Keep it traceable

Identify the source briefly by title/filename and date when available, usually in a compact source line after the summary. Attach page, section, table, or dated-note locators to decisive numbers, disputed facts, and recommendations where available. Never invent a locator or bibliography. For a short pasted passage, a single source attribution is sufficient. With multiple documents, make the origin and chronology of material claims clear and keep different patients separate.

Before delivery, compare both versions directly with the source: numbers and units, negations, medication status, attribution, conflicts, and the key caveat. Confirm the TL;DR is supported by the detailed version when both are requested, and the detailed version adds useful information rather than merely rephrasing it. Remove every phrase that adds no clinical information.
