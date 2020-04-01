+++
title = "Automatic Timestamping"
publishDate = "2020-01-28"

[[links]]
  title = "Trigger Functions | PostgreSQL: Documentation: 12: 42.10"
  link = "https://www.postgresql.org/docs/12/plpgsql-trigger.html"
[[links]]
  title = "Date/Time Functions and Operators | PostgreSQL: Documentation: 12: 9.9"
  link =  "https://www.postgresql.org/docs/12/functions-datetime.html"
+++

{{< guidesection >}}
## Setup the table schema

```pl/pgsql
CREATE TABLE users (
  id         SERIAL      PRIMARY KEY,
  full_name  TEXT        NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
```

- The `NOW()` function returns the start date and time of the current
  transaction in `TIMESTAMPTZ` (timestamp with time zone).

{{< /guidesection >}}

{{< guidesection >}}
## Create the trigger function

```pl/pgsql
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
  BEGIN
    --
    -- Set the `updated_at` TIMESTAMPZ column to the start date and time of the
    -- current transaction.
    --
    NEW.updated_at = NOW();
    RETURN NEW;
  END;
$$ LANGUAGE plpgsql;
```

{{< /guidesection >}}

{{< guidesection >}}
## Create the trigger
```pl/pgsql
CREATE TRIGGER tr_users_bu BEFORE UPDATE on users
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
```

- The trigger is associated with the `users` table and will execute the
  `update_updated_at_column` function before an `UPDATE` operation is performed
  on the table.
- Note that a trigger is executed in the same transaction as the triggering
  action.

{{< /guidesection >}}
