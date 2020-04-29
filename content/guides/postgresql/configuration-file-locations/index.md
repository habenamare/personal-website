+++
title = "PostgreSQL Configuration File Locations"
publishDate = "2020-02-03"

tags = ["postgresql"]

[[links]]
  title = "File Locations | PostgreSQL: Documentation: 12: 19.2"
  link = "https://www.postgresql.org/docs/12/runtime-config-file-locations.html"
+++

{{< guidenote >}}
The following commands are run inside **psql**. `SHOW` is used to display the
current setting of run-time parameters.

{{< /guidenote >}}

{{< guidesection >}}
## config_file

```html
db=# SHOW config_file;
```

- location of the **main server configuration file**
- usually called `postgresql.conf`

{{< /guidesection >}}

{{< guidesection >}}
## hba_file

```html
db=# SHOW hba_file;
```

- location of the configuration file for **host-based authentication**
- usually called `pg_hba.conf`

{{< /guidesection >}}

{{< guidesection >}}
## ident_file

```html
db=# SHOW ident_file;
```

- location of the configuration file for **user name mapping**
- usually called `pg_ident.conf`

{{< /guidesection >}}
