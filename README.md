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




