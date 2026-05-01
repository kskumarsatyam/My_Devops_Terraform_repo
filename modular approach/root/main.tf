parameters:
- name: serviceConnection
  displayName: "Azure Service Connection"
  type: string
  default: 'Your-Actual-Connection-Name'

- name: storageName
  type: string
  default: 'stmodularprod01'

- name: resourceGroupName
  type: string
  default: 'rg-modular-prod'

- name: region
  type: string
  default: 'East US'

trigger: none

jobs:
- job: ModularDeploy
  pool: mypool
  steps:
  - task: TerraformInstaller@1
    inputs:
      terraformVersion: 'latest'

  - task: AzureCLI@2
    displayName: 'Terraform Plan and Apply'
    inputs:
      azureSubscription: '${{ parameters.serviceConnection }}'
      scriptType: 'ps'
      scriptLocation: 'inlineScript'
      workingDirectory: '$(System.DefaultWorkingDirectory)\modular approach\root'
      inlineScript: |
        # 1. Initialize with -reconfigure to fix the backend error
        Write-Host "Initializing Terraform..."
        terraform init -reconfigure

        # 2. Plan (Save output to tfplan)
        Write-Host "Creating Deployment Plan..."
        terraform plan `
          -var="st_name=${{ parameters.storageName }}" `
          -var="rg_name=${{ parameters.resourceGroupName }}" `
          -var="location=${{ parameters.region }}" `
          -out=tfplan

        # Check if plan was created successfully
        if (Test-Path "tfplan") {
            Write-Host "Plan file created successfully. Applying Changes..."
            terraform apply tfplan
        } else {
            Write-Error "Terraform Plan failed to generate the tfplan file. Stopping execution."
            exit 1
        }
