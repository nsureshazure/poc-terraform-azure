<#
Usage:
  .\tf.ps1 dev plan
  .\tf.ps1 dev apply
  .\tf.ps1 qa plan
  .\tf.ps1 qa apply

Optional:
  .\tf.ps1 dev destroy
  .\tf.ps1 dev plan -Target "module.resourcegroup"
#>

param(
  [Parameter(Mandatory=$true)]
  [ValidateSet("dev","qa")]
  [string]$Env,

  [Parameter(Mandatory=$true)]
  [ValidateSet("init","plan","apply","destroy","output","refresh")]
  [string]$Action,

  [string]$Target = ""
)

$ErrorActionPreference = "Stop"

$backendFile = "environments/$Env/backend.hcl"
$varFile     = "environments/$Env/$Env.tfvars"

if (!(Test-Path $backendFile)) { throw "Backend config not found: $backendFile" }
if (!(Test-Path $varFile))     { throw "Var file not found: $varFile" }

Write-Host "`n==> Environment: $Env" -ForegroundColor Cyan
Write-Host "==> Backend:      $backendFile"
Write-Host "==> Vars:         $varFile"
Write-Host "==> Action:       $Action`n"

# Always init with env backend (safe switching)
terraform init -reconfigure -backend-config="$backendFile"

switch ($Action) {
  "init"    { return }

  "plan"    {
    if ($Target -ne "") {
      terraform plan -var-file="$varFile" -target="$Target"
    } else {
      terraform plan -var-file="$varFile"
    }
  }

  "apply"   {
    if ($Target -ne "") {
      terraform apply -var-file="$varFile" -target="$Target"
    } else {
      terraform apply -var-file="$varFile"
    }
  }

  "destroy" {
    terraform destroy -var-file="$varFile"
  }

  "output"  {
    terraform output
  }

  "refresh" {
    terraform refresh -var-file="$varFile"
  }
}