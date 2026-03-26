# 💼 PL/SQL Dynamic Salary & Bonus Calculator

---

## 📌 Project Overview

<br>

<p align="center">
  <img width="900" src="https://github.com/user-attachments/assets/218c94ee-c0d3-4aa5-ae01-e624ca2c29c1">
</p>

<br>

Designed and implemented a dynamic payroll calculation module using Oracle PL/SQL.  
The system retrieves employee data from the HR schema, applies department-based bonus logic, and computes total compensation with additional conditional adjustments.

The project demonstrates strong capabilities in PL/SQL programming, business logic implementation, and robust exception handling.

---

## ⚙️ Key Technical Implementations

---

### 🔹 Modular Architecture (Program Units)

Centralized the core business logic (Add, Update, Delete, Search, Clear, Exit) into highly reusable PL/SQL Procedures.

This strict adherence to the DRY (Don't Repeat Yourself) principle streamlined the trigger code and simplified future system maintenance.

<br>

<p align="center">
  <img width="600" src="https://github.com/user-attachments/assets/deb3cf1e-0fbf-4b38-bcd7-d3d84d8b8bd4">
</p>

---

### 🔹 Advanced Data Integrity & Validation

Engineered rigorous application-level validation protocols.  
The system actively intercepts missing mandatory fields and enforces strict business rules (e.g., ensuring salaries are positive values) prior to any database commit operations.

<br>

<p align="center">
  <img width="700" src="https://github.com/user-attachments/assets/27d4129e-fe26-4c75-afda-0c50ed567522">
</p>

---

### 🔹 Dynamic Query Execution

Developed a highly flexible search engine utilizing `EXECUTE_QUERY`.

By dynamically manipulating the `DEFAULT_WHERE` block property, the system allows users to seamlessly retrieve specific employee records with minimal database overhead.

<br>

<p align="center">
  <img width="700" src="https://github.com/user-attachments/assets/496e1c87-0565-4a57-af2a-ebc5aadc9b3a">
</p>

---

### 🔹 Secure DML Operations

Integrated customized user prompts (`Show_Alert`) for critical DML routines, specifically record deletion and application exit processes.

This effectively prevents accidental data loss and enhances operational security.

<br>

<p align="center">
  <img width="500" src="https://github.com/user-attachments/assets/a8d9764e-c779-4a5f-a476-93701af5d5f6">
</p>

---

### 🔹 Robust Exception Handling

Fortified all data manipulation routines with comprehensive `EXCEPTION` blocks.

This ensures graceful handling of unexpected database errors and provides clear, actionable feedback via `SQLERRM`.

<br>

<p align="center">
  <img width="550" src="https://github.com/user-attachments/assets/d86954a3-2d55-48fe-9a09-fa17d01faae8">
</p>

---

### 🔹 Optimized UI/UX

Designed a visually intuitive interface utilizing:

- Custom Visual Attributes  
- Structured Tab Orders  
- Standardized formatting (Currency Format Masks)

This significantly enhances user productivity and minimizes data entry errors.

<br>

<p align="center">
  <img width="900" src="https://github.com/user-attachments/assets/218c94ee-c0d3-4aa5-ae01-e624ca2c29c1">
</p>

---

### 🔹 Code Snippet Example (PL/SQL Modular Logic)

<br>

<p align="center">
  <img width="1000" src="https://github.com/user-attachments/assets/765239e7-6897-4c6c-b0cb-073e1290baa2">
</p>

---
