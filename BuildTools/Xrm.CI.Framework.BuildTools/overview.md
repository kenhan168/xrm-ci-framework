# xRM CI Framework
**The xRM Continuous Integration (CI) Framework is a set of tools that makes it easy and quick to automate builds and deployment of your CRM components.**

This will allow you to setup a fully automated DevOps pipeline so you can deliver CRM more frequently in a consistent and reliable way.

The latest version of all tasks work on the VSTS Hosted Agent.

## Supported Versions

**Dynamics 365 (8.x.x)**

**Dynamics 365 (9.x.x)**

(Some tasks may work with previous version of CRM)

**VSTS/TFS** For support and installation [instructions](https://docs.microsoft.com/en-us/vsts/marketplace/get-tfs-extensions)

## Task Catalog

Below is a list of tasks that are included with this extension.

| Task | Description |
| --- | --- |
| **MSCRM Ping** | Checks connectivity to a Dynamics 365 environment |
| **MSCRM Export Solution** | Exports a CRM Solution from the source CRM environment |
| **MSCRM Publish Customizations** | Publishes all CRM customizations |
| **MSCRM Set Version** | Updates the version of a CRM Solution |
| **MSCRM Extract Solution (preview)** | Extracts CRM Solution xml files from CRM Solution zip using SolutionPackager.exe |
| **MSCRM Pack Solution** | Packages a CRM Solution using SolutionPackager.exe |
| **MSCRM Import Solution** | Import a Dynamics CRM Solution package |
| **MSCRM Apply Solution (preview)** | Applies a solution upgrade after solution is import using stage for upgrade option |
| **MSCRM Copy Solution Components (preview)** | Add components from a given solution to another solution if not present |
| **MSCRM Remove Solution Components (preview)** | Removes all components from a given CRM Solution |
| **MSCRM Package Deployer** | Deploys a CRM Package using the CRM Package Deployer PowerShell Cmdlets |
| **MSCRM Update Secure Configuration** | A task that updates Dynamics 365 plugin secure configuration |
| **MSCRM Update Plugin Assembly (deprecated)** | Updates Dynamics 365 plugin assembly during build |
| **MSCRM Plugin Registration (beta)** | Updates Dynamics 365 plugin/workflow activity assembly/types/steps |
| **MSCRM Update Web Resources** | Updates Dynamics 365 Web Resources from source control |
| **MSCRM Get Online Instance By Name** | Gets an Online instance ID based on the name of the instance |
| **MSCRM Backup Online Instance** | Creates a backup of a Dynamics 365 Customer Engagement Online Instance |
| **MSCRM Provision Online Instance** | Creates a new Dynamics 365 Customer Engagement Online Instance |
| **MSCRM Restore Online Instance** | Restores an online instance from a previous backup |
| **MSCRM Delete Online Instance** | Deletes an Online Instance |
| **MSCRM Set Online Instance Admin Mode** | Enable/Disable administration mode on Online Instances |

Some explanation for tasks that have the below in the names:

beta: Still under development. May contain many bugs. Subject to breaking changes.

preview: New functionality. May contain some bugs. Subject to changes based on feedback.

deprecated: Task has been replaced with another task or is no longer required. Will be removed in future release.

## Build Automation

You can combine the xRM CI Framework tasks with other tasks to create a build definition as needed.

Below is a sample build definition that publishes customizations, updates solution version to match build number, exports the solution from CRM and then publishes the zip as an artifact in VSTS

![Build Definition](Images/OnlineBuildDefinition.png)

![Build Console](Images/OnlineBuildConsole.png)

![Build Artifacts](Images/OnlineBuildArtifacts.png)

## Release Automation

You can combine the xRM CI Framework tasks with other tasks to create a release definition as needed.

Below is a sample release definition that imports the solution generated from the latest build into the QA environment.

![Release Definition](Images/ThirdPartyReleaseDefinition.png)

![Release Logs](Images/ThirdPartyReleaseLogs.png)

![Solution Imported](Images/ThirdPartySolutionImported.png)

## More Information

For more documentation and source code, check out Github using the links on this page.

## Version History

**8.0.x**
Initial Release

**8.1.x**
Added task to backup CRM online instances

**8.2.x**
MSCRM Backup Online Instance now uses instance name instead of instance id
Added Tasks for Provision, Restore, Delete and Get Online Instances
Added Task for updating Secure Configuration of Plug-ins

**8.3.x**
Added Task Set Online Instance Admin Mode

**9.0.x**
Updated to use Dynamics 365 CE v9 Assemblies and Tools

For more information on changes between versions, check the commits on GitHub
