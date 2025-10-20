# 💊 Pharmacovigilance Database (pv_db)

## 📘 Task Overview
This project focuses on designing and implementing a **Pharmacovigilance (PV) Database** — a system that helps record, monitor, and analyze adverse drug reactions (ADRs) reported by healthcare professionals, consumers, and manufacturers.

The database captures essential pharmacovigilance data including **patients**, **drugs**, **reactions**, **reports**, and **lookups** (such as seriousness, outcomes, and routes of administration).  
It follows a **normalized relational structure** to ensure data consistency and accuracy.

---

## 🗂️ Database Details

- **Database Name:** `pv_db`  
- **Type:** Relational Database  
- **Language:** SQL (MySQL syntax)  
- **Purpose:** To store and analyze adverse drug event (ADE) reports efficiently  
- **Schema Design:** Normalized (3NF)

---

## 🧱 Tables Overview

### 1. **Lookup_Seriousness**
Stores standardized descriptions of event seriousness.  
| Column | Description |
|--------|-------------|
| Seriousness_id (PK) | Unique identifier for seriousness level |
| Seriousness_code | Code (e.g., SERIOUS, NON-SERIOUS) |
| Seriousness_Description | Description of seriousness criteria |

---

### 2. **Lookup_Outcome**
Defines the outcomes of reported adverse events.  
| Column | Description |
|--------|-------------|
| Outcome_id (PK) | Unique identifier for outcome |
| Outcome_code | Outcome type (e.g., RECOVERED, FATAL) |
| Outcome_description | Description of patient’s outcome |

---

### 3. **Lookup_Drug_Role**
Represents the role of the drug in the adverse event.  
| Column | Description |
|--------|-------------|
| Role_id (PK) | Unique role identifier |
| Role_code | Role type (SUSPECT, CONCOMITANT, INTERACTING) |
| Role_description | Detailed role explanation |

---

### 4. **Lookup_Route**
Lists possible routes of drug administration.  
| Column | Description |
|--------|-------------|
| Route_id (PK) | Unique route identifier |
| Route_name | Route of administration (e.g., Oral, Intravenous) |

---

### 5. **Reporters**
Captures information about individuals or organizations who report adverse events.  
| Column | Description |
|--------|-------------|
| Reporter_id (PK) | Unique reporter identifier |
| Reporter_type | Type (Healthcare professional, Consumer, etc.) |
| Name | Reporter’s name |
| Phone | Contact number |
| Email | Reporter’s email |
| Organization | Affiliated organization |
| Country | Reporter’s country |
| Created_at | Record creation timestamp |

---

### 6. **Patients**
Stores demographic and health-related details of patients involved in reports.  
| Column | Description |
|--------|-------------|
| Patient_id (PK) | Unique patient identifier |
| Initials | Patient initials |
| Gender | Male / Female / Unknown |
| Date_of_birth | Date of birth |
| Age_years | Patient’s age |
| Weight_kg | Weight in kilograms |
| Height_inch | Height in inches |
| Created_at | Record creation timestamp |

---

### 7. **Reports**
Main table that records adverse event reports linking patients, reporters, outcomes, and seriousness.  
| Column | Description |
|--------|-------------|
| Report_id (PK) | Unique report identifier |
| Report_reference | Reference code for report |
| Reporter_id (FK) | Linked to `Reporters` |
| Patient_id (FK) | Linked to `Patients` |
| Report_datetime | Report creation timestamp |
| Receipt_datetime | Date when report was received |
| Country_of_report | Country where report originated |
| Seriousness_id (FK) | Linked to `Lookup_Seriousness` |
| Outcome_id (FK) | Linked to `Lookup_Outcome` |
| Narrative | Description of event |
| Source_system | Data source |
| Created_at | Record creation timestamp |

---

### 8. **Drugs**
Contains all information about drugs involved in the reports.  
| Column | Description |
|--------|-------------|
| Drug_id (PK) | Unique drug identifier |
| Drug_name | Drug’s marketed name |
| Drug_substance | Active ingredient |
| Strength | Drug strength |
| Manufacturer | Manufacturer’s name |
| ATC_code | WHO ATC classification code |
| Created_at | Record creation timestamp |

---

### 9. **Report_Drugs**
Associative table linking reports and drugs.  
| Column | Description |
|--------|-------------|
| Report_drug_id (PK) | Unique ID |
| Report_id (FK) | Linked to `Reports` |
| Drug_id (FK) | Linked to `Drugs` |
| Role_id (FK) | Linked to `Lookup_Drug_Role` |
| Route_id (FK) | Linked to `Lookup_Route` |
| Start_date | Start date of drug administration |

---

### 10. **Reactions**
Stores all possible adverse reactions with standard medical terminology (MedDRA).  
| Column | Description |
|--------|-------------|
| Reaction_id (PK) | Unique identifier for reaction |
| MedDRA_PT | Preferred term |
| MedDRA_LLT | Lower-level term |
| System_organ_class | Related organ/system |

---

### 11. **Report_Reactions**
Associative table connecting reports and reactions.  
| Column | Description |
|--------|-------------|
| Report_reaction_id (PK) | Unique record ID |
| Report_id (FK) | Linked to `Reports` |
| Reaction_id (FK) | Linked to `Reactions` |
| Onset_date | Date reaction began |

---

## 🔗 Relationships Summary
- **Reporters** → **Reports** (1-to-Many)  
- **Patients** → **Reports** (1-to-Many)  
- **Reports** → **Report_Drugs** (1-to-Many)  
- **Reports** → **Report_Reactions** (1-to-Many)  
- **Drugs** → **Report_Drugs** (1-to-Many)  
- **Reactions** → **Report_Reactions** (1-to-Many)  
- **Lookup tables** act as standardized reference data for consistency  

---

## 🧠 Key Concepts Implemented
- **Normalization (3NF):** Eliminates redundancy through proper relationships  
- **Referential Integrity:** Enforced using foreign keys  
- **ENUM types:** Used for gender and reporter types  
- **Timestamp Columns:** Track creation and modification times  
- **Lookup Tables:** Support controlled vocabularies for standardized reporting  

---

## 🧪 Sample Data Inserted
- 10 entries each for **Reporters**, **Patients**, **Drugs**, and **Reactions**  
- Lookup tables pre-filled with standardized WHO-based values  
- 10 **Reports** linking all major entities  
- Data ensures representation of **serious** and **non-serious** events across multiple countries  

---

## 🧰 Tools and Environment
- **Database System:** MySQL 8.0  
- **Code Editor:** VS Code / MySQL Workbench  
- **Language:** SQL  
- **Visualization Tool (optional):** Draw.io / Lucidchart for ER diagram  

---

## 📂 Project Files
| File | Description |
|------|-------------|
| `pharmacovigilance.sql` | SQL script with full schema and data inserts |
| `A_Entity-Relationship_Diagram_(ERD)_in_black_and_w.png` | ER Diagram image |
| `README.md` | Project documentation (this file) |

---

## 👩‍💻 Author
**Ridda Maddni**  
🎓 SQL Intern — Elevated Labs  
📧 [haroonridda@gmail.com](mailto:haroonridda@gmail.com)

---

## 🗓️ Date of Completion
**20th October 2025**

---

## 📜 License
This project is licensed under the **MIT License**.  
Free to use for educational and research purposes.

