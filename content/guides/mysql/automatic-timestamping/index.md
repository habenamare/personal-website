+++
title = "Automatic Timestamping in MySQL"
publishDate = "2020-10-01"

tags = ["mysql"]

[[links]]
  title = "MySQL 8.0 Reference Manual :: 11.2.5 Automatic Initialization and Updating for TIMESTAMP and DATETIME"
  link = "https://dev.mysql.com/doc/refman/8.0/en/timestamp-initialization.html"
[[links]]
  title = "MySQL 8.0 Reference Manual :: 12.7 Date and Time Functions"
  link =  "https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html"
+++

{{< guidesection >}}
## Setup table schema with automatic timestamping

```mysql
CREATE TABLE `users` (
  `id`              BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  `full_name`       VARCHAR(100) NOT NULL,

  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
```

- Automatic properties are specified using the `DEFAULT CURRENT_TIMESTAMP` and `ON UPDATE CURRENT_TIMESTAMP` clauses in column definitions.
  - The `DEFAULT CURRENT_TIMESTAMP` clause assignes the **current timestamp** as the default value of the column.
  - The `ON UPDATE CURRENT_TIMESTAMP` clause updates the column to the **current timestamp** when the value of any other column in the row is changed from its current value.

- `CURRENT_TIMESTAMP` is a synonym for `NOW()` and returns the **current date and time**. It returns a constant time that indicates the time at which a statement began to execute.

{{< /guidesection >}}
