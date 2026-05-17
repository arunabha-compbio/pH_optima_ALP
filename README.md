# pH_optima_ALP
pH effects the structure and activity of enzymes. It can effect the state of ionization of acidic or basic amino acids. This can lead to altered protein recognition or an enzyme might become inactive. So determination of pH optima by experimental observation and computational tools is so important in enzyme related industries and research.
# Enzyme pH Optimum Curve Estimation using R

An R-based solution to plot and determine the optimum pH of an enzyme using cubic spline interpolation. This project bypasses rigid linear models to model realistic biological curvature, dynamically identifying the exact peak of enzymatic activity.


---

## 🔬 Scientific Context
Enzymes exhibit optimal activity within a narrow pH range. Deviations from this optimum can alter the ionization states of amino acid residues at the active site or lead to denaturation. 

Because experimental data points are often discrete, this script applies a **cubic spline interpolation** (`spline()`) to simulate a continuous, smooth activity curve. It then algorithmically extracts the absolute mathematical peak to pinpoint the dynamic **pH optimum ($pH_{opt}$)**.

---

## 🚀 Script Features
* **Cubic Spline Interpolation:** Smoothes discrete lab data points into a continuous kinetic curve ($n = 500$).
* **Automated Peak Detection:** Automatically detects the precise coordinates of maximum enzyme activity.
* **Publication-Quality Plotting:** Uses `ggplot2` with customized breaks, clear color-coding, and automatic peak annotation.

---
