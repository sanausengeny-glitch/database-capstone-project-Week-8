# Lessons Learned

This capstone reinforced how database design must support both business needs and operational realities. A well-designed system is not built only from tables and foreign keys; it depends on the way those choices support real workloads such as enrollment tracking, assessments, and reporting. Throughout the project, I had to think beyond database theory and focus on the full lifecycle of a production-ready system.

The first major challenge was designing a clear and realistic schema. The platform required institutional separation, learner management, course delivery, and payment history; each of these systems needed to feel logically distinct while still fitting into one consistent database design. This process showed me how important it is to start from business rules and constraints before deciding on table structure. I also learned that a strong schema allows future growth without becoming fragile or difficult to maintain.

The migration workflow taught me the importance of controlled change. Treating schema updates as ordered, repeatable steps made the project more professional and realistic. It also highlighted how vital constraints, indexes, and triggers are for database stability. Rather than thinking of SQL as one-off commands, I gained a better appreciation for migration discipline and versioned database evolution.

The performance section deepened my understanding of query planning. It became clear that a query can look conceptually correct while still being expensive in production. Sequencing through large tables and performing repeated joins can create a significant load. The optimization exercises helped me connect theory to practice by examining how index choices can reduce scan costs and change the execution plan.

Security was equally critical. This project emphasized role-based permissions, RLS, and audit logging as essential components of a resilient database. A secure system is not only about protecting data at rest; it is about limiting access, tracking changes, and ensuring the application does not depend on unnecessary privileges. I also learned that sensitive fields must be handled carefully and that hashed credentials are a standard practice in real systems.

The NoSQL portion added a useful perspective on complementary technologies. PostgreSQL remains the best fit for relational transactional consistency, while Redis and MongoDB help with session acceleration and event-heavy workloads. This distinction is important because it shows that the right tool depends on the workload, not on a single technology being universally best.

Overall, this project expanded my technical understanding and my ability to explain database decisions clearly. I gained confidence in designing systems that balance integrity, performance, security, and documentation. These skills are valuable not just for coding assignments but for technical interviews and team-based engineering work.
