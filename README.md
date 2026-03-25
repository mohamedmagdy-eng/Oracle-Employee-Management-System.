
**Project Overview:**
<img width="1195" height="632" alt="0" src="https://github.com/user-attachments/assets/218c94ee-c0d3-4aa5-ae01-e624ca2c29c1" />
Architected and developed a fully functional, reliable Employee Management System (Mini-ERP module). The application handles end-to-end CRUD operations with a strong emphasis on data integrity, proactive error handling, and intuitive user experience.


**Key Technical Implementations:**

**Modular Architecture (Program Units):**

Centralized the core business logic (Add, Update, Delete, Search, Clear, Exit) into highly reusable PL/SQL Procedures. 
This strict adherence to the DRY (Don't Repeat Yourself) principle streamlined the trigger code and simplified future system maintenance.

<img width="513" height="150" alt="2" src="https://github.com/user-attachments/assets/deb3cf1e-0fbf-4b38-bcd7-d3d84d8b8bd4" />


**Advanced Data Integrity & Validation:** 

Engineered rigorous application-level validation protocols.The system actively intercepts missing mandatory fields and enforces strict business rules (e.g., ensuring salaries are positive values) prior to any database commit operations.

<img width="718" height="570" alt="3" src="https://github.com/user-attachments/assets/27d4129e-fe26-4c75-afda-0c50ed567522" />


**Dynamic Query Execution:** 

Developed a highly flexible search engine utilizing EXECUTE_QUERY.
By dynamically manipulating the DEFAULT_WHERE block property, the system allows users to seamlessly retrieve specific employee records with minimal database overhead.

<img width="747" height="477" alt="4" src="https://github.com/user-attachments/assets/496e1c87-0565-4a57-af2a-ebc5aadc9b3a" />


**Secure DML Operations:** 

Integrated customized user prompts (Show_Alert) for critical DML routines, specifically record deletion and application exit processes, effectively preventing accidental data loss and enhancing operational security.

<img width="457" height="121" alt="5" src="https://github.com/user-attachments/assets/a8d9764e-c779-4a5f-a476-93701af5d5f6" />


**Robust Exception Handling:** 

Fortified all data manipulation routines with comprehensive EXCEPTION blocks, gracefully managing unexpected database errors and providing clear, actionable feedback via SQLERRM.

<img width="522" height="142" alt="6" src="https://github.com/user-attachments/assets/d86954a3-2d55-48fe-9a09-fa17d01faae8" />


**Optimized UI/UX:** 

Designed a visually intuitive interface utilizing custom Visual Attributes, structured Tab Orders, and standardized formatting (e.g., Currency Format Masks) to enhance user productivity and minimize data entry errors.

<img width="1195" height="632" alt="0" src="https://github.com/user-attachments/assets/218c94ee-c0d3-4aa5-ae01-e624ca2c29c1" />

**Code Snippet Example (PL/SQL Modular Logic):**
<img width="1877" height="682" alt="1" src="https://github.com/user-attachments/assets/765239e7-6897-4c6c-b0cb-073e1290baa2" />


