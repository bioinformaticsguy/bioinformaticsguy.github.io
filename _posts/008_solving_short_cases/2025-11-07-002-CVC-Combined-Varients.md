---
date: 2025-11-07 12:29:19
layout: post
title: Merging Three Variants Into One Truth
subtitle: How to Create Combined Variant Representations That Reveal What's Really Happening
description: Learn how to manually merge adjacent variants into a single VCF entry for combined annotation. This step-by-step guide shows you how to transform three separate variants into one unified representation that captures their true biological impact—the foundation for all downstream analysis.

series: Complex Variant Chronicles
series_sing: true
video_number: 002
video_id: WbgC0m0fsQ8

optimized_image: https://res.cloudinary.com/bioinformaticsguy/image/upload/v1762509853/BioinformaticsGuyGeneralFiles/Colorful_Freelancer_YouTube_Thumbnail_1_kgna0g.png


category: CVC
tags:
  - Varients
  - SNVs
  - SVs
  - WGS Data
author: alihassan
paginate: false
two_columns_layout: false
---


[![Alt text](https://res.cloudinary.com/bioinformaticsguy/image/upload/v1762509853/BioinformaticsGuyGeneralFiles/Colorful_Freelancer_YouTube_Thumbnail_1_kgna0g.png)](https://www.youtube.com/c/BioinformaticsGuy)



You're staring at your VCF file. Three variants in OSBPL6, all within six base pairs of each other:

```
chr2:178328298 C>T
chr2:178328299 A>G  
chr2:178328301 ACC>A
```

Your annotation pipeline dutifully annotates each one separately. The frameshift gets flagged as HIGH impact. The two substitutions get their own predictions. But here's the problem: **none of these predictions reflect biological reality**.

In the actual cell, these three variants exist together on the same chromosome. The frameshift changes the reading frame for everything downstream—including those two substitutions. What amino acids do they actually code for in the shifted frame? What's the combined consequence? Your separate annotations can't tell you.

The solution? Merge them into a single variant before annotation. This post shows you exactly how.

## The Core Problem: Annotation Tools Assume Independence

Standard annotation pipelines—VEP, ANNOVAR, SnpEff—all work the same way:

1. Read variant from VCF
2. Look up reference sequence at that position
3. Apply the ALT allele
4. Predict consequence assuming everything else is wild-type

This works beautifully for isolated variants. But when variants cluster together, each prediction assumes wild-type context that doesn't exist. The frameshift prediction doesn't account for the downstream substitutions. The substitution predictions assume the normal reading frame that the frameshift destroys.

**The result:** Three separate predictions, none of which describe what actually happens when all three variants act together.

## The Solution: Manual Variant Merging

We need to create a single VCF entry that represents all three variants as a unit. This means:

1. Identifying the full genomic span (leftmost to rightmost variant)
2. Getting the reference sequence for that span
3. Applying all three variants to generate the combined ALT sequence
4. Creating a merged VCF entry
5. Submitting for annotation

Let's walk through this step-by-step with our OSBPL6 example.

## Step 1: Identify the Genomic Span

Our three variants are:

```
chr2:178328298 C>T
chr2:178328299 A>G
chr2:178328301 ACC>A (deletes two bases)
```

**Leftmost position:** 178,328,298  
**Rightmost position:** 178,328,303 (the deletion extends to here)

We need the reference sequence from 178,328,298 to 178,328,303 inclusive—that's 6 bases total.

## Step 2: Extract the Reference Sequence

Use `samtools faidx` to extract the reference sequence for this region. You need an indexed reference genome (FASTA file with accompanying .fai index).

```bash
samtools faidx /path/to/GRCh38.fa chr2:178328298-178328303
```

**Output:**
```
>chr2:178328298-178328303
CAAACC
```

So our reference sequence is `CAAACC`.

**Important:** Make sure you're using the same reference genome (GRCh38 vs GRCh37/hg19) that your variants were called against. Mismatched references will give you incorrect results.

## Step 3: Map Variants to Reference Positions

Let's map each position in our reference sequence:

| Genomic Position | Reference Base |
|------------------|----------------|
| 178,328,298 | C |
| 178,328,299 | A |
| 178,328,300 | A |
| 178,328,301 | A |
| 178,328,302 | C |
| 178,328,303 | C |

Reference sequence: `CAAACC`

Now we'll apply each variant in order.

## Step 4: Apply Variants to Generate Combined ALT

**Starting sequence:** `CAAACC`

### Variant 1: Position 178,328,298 C→T

Replace the C at position 1 (the first base) with T:

```
REF: C A A A C C
ALT: T A A A C C
```

After variant 1: `TAAACC`

### Variant 2: Position 178,328,299 A→G

Replace the A at position 2 with G:

```
REF: T A A A C C
ALT: T G A A C C
```

After variant 2: `TGAACC`

### Variant 3: Position 178,328,301 ACC→A

This deletion affects positions 301, 302, 303. The REF is `ACC` and the ALT is just `A`—it deletes the last two bases (CC).

In our sequence, positions 301-303 are the last three bases `ACC`:

```
Before: T G A A C C
After:  T G A A
```

**Final combined ALT sequence:** `TGAA`

## Step 5: Verify Your Work

Always double-check your combined sequence:

- **Reference span:** chr2:178,328,298-178,328,303 (6 bases)
- **REF sequence:** `CAAACC` (6 bases)
- **ALT sequence:** `TGAA` (4 bases—makes sense, we deleted 2)

The length difference (6→4) matches our deletion of 2 bases. Good sign.

## Step 6: Create the Merged VCF Entry

Now we construct a VCF file with this merged variant. We need a proper VCF header and our variant line.

### Minimal VCF Header

```vcf
##fileformat=VCFv4.2
##source=manual_haplotype_merge
##reference=GRCh38
#CHROM	POS	ID	REF	ALT	QUAL	FILTER	INFO	FORMAT	SAMPLE
```

**Note:** The header line must be tab-separated. The columns are:
- CHROM: Chromosome
- POS: Position (leftmost base)
- ID: Variant identifier (use `.` if none)
- REF: Reference sequence
- ALT: Alternate sequence
- QUAL: Quality score (use `.` if unknown)
- FILTER: Filter status (use `.` for unfiltered)
- INFO: Additional info (use `.` if none)
- FORMAT: Format of genotype fields (optional)
- SAMPLE: Sample genotype data (optional)

### The Merged Variant Line

```vcf
chr2	178328298	.	CAAACC	TGAA	.	.	.
```

Breaking this down:
- **CHROM:** chr2
- **POS:** 178328298 (leftmost position)
- **ID:** . (no dbSNP ID for this complex variant)
- **REF:** CAAACC (reference sequence for the full span)
- **ALT:** TGAA (combined alternate sequence)
- **QUAL:** . (not applicable for manually merged variants)
- **FILTER:** . (no filters applied)
- **INFO:** . (no additional information)

### Complete VCF File

```vcf
##fileformat=VCFv4.2
##source=manual_haplotype_merge
##reference=GRCh38
#CHROM	POS	ID	REF	ALT	QUAL	FILTER	INFO	FORMAT	SAMPLE
chr2	178328298	.	CAAACC	TGAA	.	.	.
```

Save this as `merged_variant.vcf`.

## Step 7: Annotate with VEP

Now we submit this merged VCF to Variant Effect Predictor (VEP). You can use the web interface or command-line tool.

### Using VEP Web Interface

1. Go to: https://www.ensembl.org/Tools/VEP
2. Paste your complete VCF (including header lines)
3. Select your reference genome (GRCh38)
4. Click "Run"

## Step 8: Interpret VEP Results

VEP returns detailed annotation for our merged variant. Here are the key results for OSBPL6:

### Primary Transcript (ENST00000190611.9 - MANE Select)

```
Consequence: stop_gained, frameshift_variant
Impact: HIGH
Gene: OSBPL6 (ENSG00000079156)
Feature: ENST00000190611.9 (protein_coding)
Exon: 5/25
```

**What this tells us:**

**Consequence:** The variant causes both a frameshift AND introduces a premature stop codon. This is a double-hit to the protein.

**MANE Select:** This transcript (ENST00000190611.9) is the Matched Annotation from NCBI and EMBL-EBI—it's the canonical, clinically-relevant transcript for OSBPL6. This is what we should focus on.

### Protein-Level Changes

```
cDNA position: 751-756
CDS position: 238-243
Protein position: 80-81
Amino acids: QT/*
Codons: CAAACC/TGAA
```

**Translation:**

**Original amino acids (REF):** Glutamine (Q) and Threonine (T) at positions 80-81

**New amino acids (ALT):** Glutamine changes, then immediate stop codon (*)

**What's happening:** The combined variant changes the reading frame starting at position 80, and almost immediately introduces a premature termination codon (PTC). The protein is truncated at position 80-81, losing everything downstream.

### Secondary Transcript (ENST00000315022.2)

```
Consequence: stop_gained, frameshift_variant
Impact: HIGH
Protein position: 59-60
```

A second transcript shows similar consequences but with truncation at an earlier protein position (59-60). This transcript has lower support (TSL=2) compared to the MANE Select transcript (TSL=1), so we prioritize the MANE Select findings.

## What This Annotation Reveals

The combined annotation tells us something the individual variant annotations couldn't:

**Individual annotations would show:**
- Variant 1 (C>T): Missense or synonymous
- Variant 2 (A>G): Missense or synonymous  
- Variant 3 (ACC>A): Frameshift

**Combined annotation shows:**
- Frameshift starting at protein position 80
- Immediate premature stop codon
- Complete loss of protein from position ~80 onwards
- High confidence loss-of-function prediction

### Functional Impact

OSBPL6 is 829 amino acids long in the canonical transcript. This variant truncates it at position ~80, losing:
- ~90% of the protein
- The oxysterol-binding domain (typically in C-terminal region)
- All downstream functional domains

**This is clearly a loss-of-function allele at the molecular level.**

## Critical Note: Annotation ≠ Pathogenicity

Here's where we must be careful. VEP tells us this is a predicted loss-of-function variant with high confidence. The molecular consequence is clear: truncated protein, loss of function.

**But does this cause disease?**

That depends entirely on whether OSBPL6 loss-of-function causes the patient's phenotype (DSD in this case). The annotation answers "what does this variant do to the protein?" It does NOT answer "is this variant responsible for the patient's disease?"

For that, we need the remaining steps in our workflow:
- Is OSBPL6 expressed in relevant tissue (gonads)?
- Are there literature reports linking OSBPL6 to sex development?
- Does this variant appear in healthy populations?
- Are there other better candidate variants in established DSD genes?

**We'll address these questions in upcoming posts.** For now, we've successfully created a combined annotation that accurately reflects the molecular consequence.

## Common Issues and Troubleshooting

### Issue 1: Reference Sequence Mismatch

**Problem:** Your extracted reference doesn't match your VCF REF alleles.

**Solution:** Confirm you're using the correct reference genome build (GRCh38 vs GRCh37). Variants called on GRCh37 need GRCh37 reference sequence.

### Issue 2: Incorrect Position Calculation

**Problem:** Your merged variant doesn't produce the expected consequence.

**Solution:** Double-check your position arithmetic. Remember:
- VCF positions are 1-based
- Deletions include the deleted bases in the REF allele
- Multi-base variants extend from POS to POS+length(REF)-1

### Issue 3: VEP Returns Unexpected Results

**Problem:** VEP shows different consequences than expected.

**Solution:** 
- Verify your reference genome matches VEP's reference
- Check that REF allele exactly matches reference sequence
- Ensure ALT allele was correctly calculated
- Try running on multiple transcripts to confirm consistency

### Issue 4: Variants Are Far Apart

**Problem:** Your variants span a large region (>50-100bp).

**Solution:** Consider whether they're truly in cis (same chromosome). For distant variants without phasing information, merging may not be appropriate. Document the assumption and uncertainty.

## Validation: Did We Get It Right?

To validate our merged variant:

1. **Length check:** REF is 6 bases, ALT is 4 bases = 2 base deletion ✓
2. **Variant consistency:** Each individual variant is captured in the transformation ✓
3. **Annotation makes biological sense:** Frameshift + stop = protein truncation ✓
4. **Transcript is canonical:** MANE Select transcript (highest confidence) ✓

Our merged variant correctly represents the biological reality of these three variants acting together.


## Key Takeaways

- **Combined annotation reveals biological truth** - Individual annotations miss variant interactions
- **Manual merging is systematic** - Follow the step-by-step process for reproducibility
- **Reference sequence is critical** - Always verify you're using the correct genome build
- **Annotation ≠ pathogenicity** - Molecular predictions must be validated with gene-disease evidence
- **Document everything** - Your reasoning must be transparent and reproducible
- **MANE Select matters** - Prioritize the canonical, clinically-relevant transcript

## What's Next: Manual Sequence Reconstruction

We now have VEP's prediction: frameshift + premature stop at position 80-81. But can we trust it? In the next post, we'll manually reconstruct the sequence to verify this prediction and understand exactly what's happening at the nucleotide and amino acid level.

**In Part 2: Manual Sequence Reconstruction, you'll learn:**

- How to extract the reference cDNA sequence for OSBPL6
- Step-by-step application of the merged variant to cDNA
- Translating the mutant sequence to amino acids
- Identifying exactly where the stop codon appears
- Confirming (or correcting) VEP's predictions
- Understanding reading frame shifts in detail

We'll discover whether VEP got it right, and more importantly, we'll understand *why* this variant causes protein truncation. This manual verification is essential because automated predictions, while usually accurate, can miss edge cases or have errors.

Manual reconstruction is the most critical step—it's where you verify that your combined annotation actually reflects biological reality. No shortcuts here.

---

*You've transformed three confusing variants into one clear molecular story. Now let's verify that story by rebuilding the sequence from scratch. See you in Part 2.*

{% include next-prev.html %}