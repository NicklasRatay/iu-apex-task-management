# iu-apex-task-management

This is the source code of the Oracle Application Express (APEX) implementation for the task management case application for my bachelor's thesis "Low-Code vs. Traditional Development: A Task Management Application Case Study with Insights into AI-Assisted Coding" at the IU Internationale Hochschule.

## Development
Unfortunately, there is no easy way to setup APEX for local development. So this was out of scope for this project. Instead, two separate Free Tier Autonomous Databases (ADB) on Oracle Cloud Infrastructure (OCI) were used for development and production, repsectively. This way, schema migrations and application deployments could still be tested.

### Setup

Requirements:
- `Git`
- `SQLcl` (must be added to the PATH so the sql command is available for the batch scripts)
- `Java 11` or higher for SQLcl to work
- `APEX ADB` of workload type "Transaction Processing" on OCI

Cloning this Repository:
```bash
git clone https://github.com/NicklasRatay/iu-apex-task-management.git
```

Oracle Cloud Wallet for every ADB instance must be downloaded from the OCI Console and placed in the [/wallets](./wallets) directory. These are required for the batch scripts to connect to the database.

### Exporting Development Environment

The following script exports the APEX application and uses Liquibase to create the database schema. Tables that contain master data that do not change often and are used as lookup tables must be included in [master_data_tables.txt](./master_data_tables.txt). This is required for Liquibase to also pull this master data, which is then inserted into the target schema if it does not already exist there.

```bash
apexexport <wallet_name> <workspace_schema>/<schema_password>@<a_tns_name_from_wallet> <with_master_data>
```

Example:
```bash
apexexport adbdev.zip WKSP_TEST/secret-password@adbdev_tp y
```

### Deploying to Another Environment

The following script installs the APEX application and uses Liquibase to update the database schema. This requires the target environment to be set up the same way as the development environment. The APEX workspace must have the same ID and name. The underlying database schema must have the same name, which should be the case if the APEX workspace was created with the same name.

```bash
apexdeploy <wallet_name> <workspace_schema>/<schema_password>@<a_tns_name_from_wallet>
```

Example:
```bash
apexdeploy adbprod.zip WKSP_TEST/secret-password@adbprod_tp
```