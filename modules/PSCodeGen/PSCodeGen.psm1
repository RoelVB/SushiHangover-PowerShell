. $psScriptRoot\New-PInvoke.ps1
. $psScriptRoot\New-Enum.ps1
. $psScriptRoot\New-ScriptCmdlet.ps1

if (Get-Command Add-IseMenu -ErrorAction SilentlyContinue) {
    Add-IseMenu -name PSCodeGen @{
        "New-PInvoke" = { New-PInvoke -OutputText }
        "New-Enum" = { New-Enum -OutputText }
        "New-ScriptCmdlet" = {
            $cmd = Select-CurrentTextAsCommand 
            if ($cmd) {
                foreach ($c in $cmd) {
                    if (-not $c) { continue }
                    New-ScriptCmdlet -FromCommand $c 
                } 
            } else {
                New-ScriptCmdlet
            }
        }
    }
}