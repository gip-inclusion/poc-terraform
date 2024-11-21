# DNS & SCW infrastructure as code - GIP Plateforme de l'inclusion

__This entire codebase is a Request for Comments, everything can change according to debates__

__TODO:__
- Embed existing records in this codebase
- Embed existing resources in this codebase?

## Aim

This repository aims to handle all DNS records for the organization.
Terraform is an IaC tool making possible to declare, plan, apply and version our overall configuration.
Thus each team can create pull requests to add, update and destroy their resources directly in the code.

Moreover, it is possible for all projects to create and manage their scaleway resources from this repository as well.

## Architecture

### Directory structure

Main configuration is set in the root directory, each file title is self explainatory.
Each project configuration is a module located in the `projects/<project-name>` directory and mapped from the `projects.tf` file.
A `demo` project has been created to validate a PoC. A basic script `duplicate_demo_project.sh` can be used to settle your project directory with the demo one as a boilerplate.

### IAM
- An IAM application is a non-human user in an Organization.
- Current architecture is group based:
   - A restricted policy is created (e.g. with permission `ProjectManager`)
   - A dedicated group is created (e.g. `Projects Managers`)
   - A dedicated application is created (e.g. `Projects Manager`)
   - The application is added to the group and the policy is bound to the group

The root user is the `IAM Manager` application, manually created in Scaleway in order to generate all other applications. Though being "the first", it is restricted to the organization wide `IAMManager` role.

In the root `iam.tf` are declared:
- The application `Projects Manager` with its group and policy (stricly organization wide `ProjectManager` role)
- The application `DNS Manager` with its group and policy (stricly organization wide `DomainsDNSFullAccess` role)

Then, in each project module, an application `<Project_name> project Admin` can be created with its group, policy (stricly project wide with `AllProductsFullAccess`).

These roles are needed to manage resources we need:
- `IAM Manager` for every IAM resource
- `Projects Manager` to create the project
- `DNS Manager` for every DNS zone and record (DNS are managed organization wide but zones are attributed to projects)
- `Project Admin` for every project inner resource

__In case it is not clear, you can refer to the `demo` project which represents the minimum setup for a project with IAM, project and a DNS record__

### Providers
According to the IAM part just above, each role has its own provider to segment permissions even in Terraform. Refer to the `demo` project to check which provider to use for which action but it is totally bound to the previous description.

Note: If you want to scale your Scaleway project with other resources, you can use your admin project provider which has full access. If you want a thiner permission configuration, do not hesitate to create restricted applications inside your project `iam.tf` file.

### Backend
Backend is managed by a manually created bucket in the default organization project

## How to deploy
The current workflow is to have a valid `terraform plan` on pull request.
To run `terraform apply`, the current RFC would be to have a dedicated CI which runs only on release (tags) with:
- automatically runs `terraform plan -out` and pass the plan as an artefact to the next step
- manually runs `terraform apply` once plan is human reviewed with the saved plan

This flow is a RFC and totally open to changes!
Current github workflows are not valid as well

## References

- [SCW Terraform provider](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs)
- [SCW Permissions set](https://www.scaleway.com/en/docs/identity-and-access-management/iam/reference-content/permission-sets/)

