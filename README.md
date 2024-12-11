# iu-apex-task-management

This is the source code of the Oracle Application Express (APEX) implementation for the task management case application for my bachelor's thesis "Low-Code vs. Traditional Development: A Task Management Application Case Study with Insights into AI-Assisted Coding" at the IU Internationale Hochschule.

## Development
Unfortunately, there is no easy way to setup APEX for local development. So this was out of scope for this project. Instead, the development environment is set up on an Oracle Cloud Infrastructure (OCI) Autonomous Database (ADB) with APEX.

### Setup

Requirements:
- An `APEX Workspace`, preferably on OCI
- `Git`
- `Java 11` or higher
- `SQLcl`

Cloning this Repository:
```bash
git clone https://github.com/NicklasRatay/iu-apex-task-management.git
```

### Exporting Development Environment

The following script exports the APEX application and uses Liquibase to create the database schema. The output will be replace the [/src](./src) directory. You need to download the Oracle Wallet and put it into the [/wallets](./wallets) directory.

```bash
apexexport2git <workspace_schema>/<schema_password>@<a_tns_name_from_wallet> <wallet_name>
```

Example:
```bash
apexexport2git WKSP_TEST/secret-password@adbdev_tp adbdev.zip
```
