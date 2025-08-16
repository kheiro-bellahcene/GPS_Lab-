# 🛰️ GPS Lab – MATLAB Signal Processing

## 📌 Overview
This project implements a **GPS signal processing lab** in MATLAB.  
It includes **power calculations**, **SNR estimation**, **C/A code generation**, **Doppler analysis**, and **correlation** with a captured GPS signal.

---

## 👤 Author
- **BELLAHCENE Kheir Eddine**
- **BELKAID Moncef**

**🏛 University:** Université d'Évry – Paris-Saclay  
**🎓 Program:** M2 SAM – Perception

---

## Results

### GPS Signal Processing Outputs
The figure below summarizes all outputs of the MATLAB GPS lab, including:  
- PRN code for satellite 1  
- Imaginary component of the raw signal  
- Correlation with the generated C/A code  
- Doppler variation and optimal search  
- Correlation step size  

![Correlation Result](https://github.com/kheiro-bellahcene/GPS_Lab-/blob/main/figures/figutre%20_resultat.png)

---

## ✨ Main Features
-  Convert power from **mW** to **dBm**  
-  Compute **received power** using a link budget  
-  Estimate **SNR** with Boltzmann’s law  
-  Generate GPS **C/A codes** for specific PRNs  
-  Oversample codes to match sample rates  
-  Load and process **I/Q data** from `.wav` files  
-  Perform **Doppler shift search** and correlation  
-  Use `.sp3` ephemeris data to compute **satellite distances**



