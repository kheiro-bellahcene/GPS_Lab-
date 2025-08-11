# 🛰️ GPS Lab – MATLAB Signal Processing

## 📌 Overview
This project implements a **GPS signal processing lab** in MATLAB.  
It includes **power calculations**, **SNR estimation**, **C/A code generation**, **Doppler analysis**, and **correlation** with a captured GPS signal.

---

## 👤 Author
- **BELLAHCENE Kheir Eddine**  

**🏛 University:** Université d'Évry – Paris-Saclay  
**🎓 Program:** M2 SAM – Perception

---

## ✨ Main Features
- 📏 Convert power from **mW** to **dBm**  
- 📡 Compute **received power** using a link budget  
- 📉 Estimate **SNR** with Boltzmann’s law  
- 🔑 Generate GPS **C/A codes** for specific PRNs  
- ⏫ Oversample codes to match sample rates  
- 🎧 Load and process **I/Q data** from `.wav` files  
- 🔍 Perform **Doppler shift search** and correlation  
- 🌍 Use `.sp3` ephemeris data to compute **satellite distances**

---

## 🛠 Usage
1. 📂 Open the script in **MATLAB** or **Octave**.  
2. 📜 Ensure `lfsr.m` and `cacode.m` are in the same folder.  
3. 🎵 Provide GPS `.wav` and `.sp3` files.  
4. ▶️ Run the script to execute all processing steps.

---

## 📊 Expected Output
- ✅ Power values in **dBm** and **mW**  
- 📈 SNR estimation  
- 🛰 List of **visible satellites** and optimal Doppler shifts  
- 📉 Correlation plots between signal and generated codes  

---

## 💡 Notes
- Results depend on the **captured GPS signal quality** and **ephemeris accuracy**.  
- A highly negative SNR means correlation is essential to recover the useful signal.

