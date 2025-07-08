# 🧠 SQL Mastery Tracker (MySQL Focus)

A structured guide for tracking and learning everything in SQL for interviews – especially on LeetCode, InterviewBit, and real-world projects.

---

## ✅ Progress Checklist

### 🧱 1. Basics
- [x] SELECT, FROM, WHERE
- [x] ORDER BY, LIMIT, OFFSET
- [x] DISTINCT
- [ ] IN, BETWEEN LIKE, IS NULL

---

### 🔗 2. JOINS
- [x] INNER JOIN
- [x] LEFT OUTER JOIN
- [ ] RIGHT OUTER JOIN
- [ ] LEFT EXCLUSIVE JOIN
- [ ] RIGHT EXCLUSIVE JOIN
- [ ] FULL OUTER JOIN (simulate using UNION)
- [ ] SELF JOIN
- [ ] CROSS JOIN

---

### 📊 3. Aggregations
- [x] COUNT(), SUM(), AVG(), MIN(), MAX()
- [x] GROUP BY
- [ ] HAVING

---

### 🧠 4. Conditional Logic
- [x] CASE WHEN THEN ELSE END
- [x] IF(), IFNULL()
- [ ] COALESCE(), NULLIF()

---

### 🪟 5. Window Functions
- [ ] ROW_NUMBER()
- [ ] RANK(), DENSE_RANK()
- [ ] NTILE()
- [ ] LAG(), LEAD()
- [ ] FIRST_VALUE(), LAST_VALUE()
- [ ] OVER(), PARTITION BY, ORDER BY

---

### 🔁 6. Subqueries
- [x] WHERE subquery
- [ ] FROM subquery
- [ ] SELECT subquery
- [ ] EXISTS / NOT EXISTS
- [ ] IN / NOT IN (with subqueries)
- [ ] Correlated Subqueries

---

### 🧩 7. CTEs (Common Table Expressions)
- [ ] WITH clause
- [ ] Recursive CTEs

---

### 🧮 8. Math & String Functions
- [x] ROUND(), FLOOR(), CEIL()
- [x] MOD(), ABS()
- [x] LENGTH(), TRIM(), UPPER(), LOWER()
- [ ] SUBSTRING(), REPLACE(), CONCAT()

---

### 📆 9. Date Functions
- [ ] NOW(), CURDATE()
- [ ] DATEDIFF(), TIMESTAMPDIFF()
- [ ] DATE_FORMAT(), YEAR(), MONTH(), DAY()

---

### 🔡 10. Pattern Matching
- [ ] LIKE, NOT LIKE
- [ ] REGEXP
- [ ] CASE with LIKE (advanced use)

---

### 🧾 11. Set Operations
- [ ] UNION
- [ ] UNION ALL
- [ ] INTERSECT (simulate)
- [ ] EXCEPT (simulate)

---

### 🚦 12. NULL Handling
- [x] IS NULL, IS NOT NULL
- [x] IFNULL()
- [ ] COALESCE(), NULLIF()

---

## 🧪 LeetCode & InterviewBit Practice Log

| Platform     | Problem Name                      | Concepts Used                      | Status |
|--------------|-----------------------------------|------------------------------------|--------|
| InterviewBit | Top Performers                    | CASE, LEFT JOIN, BETWEEN           | ✅     |
| LeetCode     | 177. Nth Highest Salary           | LIMIT, OFFSET                      | 🕓     |
| LeetCode     | 180. Consecutive Numbers          | LAG(), Window function             | ⬜     |
| LeetCode     | 185. Department Top 3 Salaries    | DENSE_RANK(), PARTITION BY         | ⬜     |

Add new rows here as you go 🚀

---

## 🧠 Notes Section

### 🔸 CASE Statement Example
```sql
SELECT
  CASE 
    WHEN score >= 90 THEN 'Excellent'
    WHEN score >= 75 THEN 'Good'
    ELSE 'Needs Improvement'
  END AS performance_level
FROM students;
