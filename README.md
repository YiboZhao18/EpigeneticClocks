# DNA Methylation-Based Biological Age Acceleration Estimation Pipeline

## Project Description

This project was developed as part of a freelance assignment, where the client required a pipeline to estimate biological age acceleration based on DNA methylation data. The primary goal was to calculate age acceleration estimates for a follow-up cohort and associate them with a range of phenotypes. While the client provided an imputed sample dataset, with rows representing CpG sites and columns representing sample IDs, they left the choice of R packages open, requiring a comprehensive review of relevant literature to select the most appropriate tools.

## Objectives

1. Develop a robust pipeline to calculate biological age acceleration estimates from DNA methylation data.
2. Associate the calculated age estimates with various phenotypes for downstream analysis.
3. Ensure the pipeline is adaptable to the client’s real dataset, providing clear instructions for its implementation.

## Background Knowledge

An **epigenetic clock** is a predictive tool used to estimate biological age based on DNA methylation levels, particularly at specific sites called **CpG sites** (cytosine-guanine dinucleotide sequences). Biological age can diverge from chronological age due to lifestyle, environment, and health factors, reflecting overall physiological health and aging. **DNA methylation** refers to the addition of a methyl group to the DNA molecule, primarily at CpG sites, and plays a key role in gene regulation. Methylation changes at these sites are associated with aging and are the foundation of epigenetic clocks.

There are two main generations of epigenetic clocks:

1. **First-Generation Clocks**: These clocks, such as the **Horvath clock** and **Hannum clock**, were developed to estimate biological age based solely on chronological age. They focus on CpG sites correlated with aging, regardless of health status. The Horvath clock is one of the most widely used and can be applied to various tissue types, making it highly versatile.

2. **Second-Generation Clocks**: Newer clocks, like the **GrimAge** and **PhenoAge** clocks, go beyond chronological age estimation and are designed to predict health-related outcomes such as disease risk, lifespan, and morbidity. These second-generation clocks are more closely tied to biological processes of aging and are considered more predictive of individual health outcomes.

## Workflow

### 1. Clock Selection

I selected six clocks for this pipeline based on their reliability, coverage of different aging aspects, and current relevance in epigenetic research:

- **Horvath’s clock** and **Hannum’s clock**: These are foundational **first-generation clocks**, widely used and validated for estimating biological age from DNA methylation. They offer robustness across various datasets and tissue types, making them ideal for classical age acceleration estimation.
   
- **DNA PhenoAge** and **DNA GrimAge**: These **second-generation clocks** are designed to predict health-related outcomes beyond chronological age, including morbidity and lifespan, making them suitable for research focusing on healthspan and disease prediction. GrimAge, in particular, is highly associated with lifestyle and mortality risk.

- **DunedinPACE**: This newer clock measures the rate of aging, offering a dynamic view of biological age acceleration. It can detect changes in the aging rate over time, which is important for longitudinal cohort studies like the one in this project.

- **Bernabeu clock**: This clock was chosen due to its novel approach in accounting for additional factors beyond the conventional CpG sites, potentially offering a more refined and accurate biological age estimate.

These clocks offer a comprehensive approach to understanding biological aging, ranging from chronological age estimation to health outcome prediction and aging rate assessment. Since the client has not yet decided which phenotypes to focus on, this selection ensures broad coverage across multiple aspects of aging and potential phenotypic associations.

### 2. R Script Development

- Using the imputed sample dataset (with rows representing CpG sites and columns as sample IDs), I wrote R scripts to implement each of the six clocks. (For the classical clocks, namely Horvath, Hannum, PhenoAge and GrimAge, I found an online calculator developed by the clock's author: https://dnamage.clockfoundation.org/. Therefore, for these 4 clocks the script is just to prepare the input files).
- Each script applies the specific algorithm of the chosen clocks to calculate biological age estimates for each sample.
- These scripts are designed to be flexible, allowing the client to adapt them to their real dataset with minimal adjustments.

### 3. Output

- The pipeline outputs biological age acceleration estimates and associations with phenotype data for downstream analysis.
- Clear documentation and instructions are provided for applying the scripts to future datasets, ensuring the pipeline is adaptable for continued use by the client.

