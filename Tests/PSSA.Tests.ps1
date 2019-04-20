<#
.SYNOPSIS
Runs the PowerShell Script Analyzer against all the scripts in this repository,
formatted as a Pester test.

.NOTES
Taken from the "PSScriptAnalyzer deep dive" series, on the Microsoft
Scripting Guy blog (https://devblogs.microsoft.com/scripting/psscriptanalyzer-deep-dive-part-3-of-4/)

#>
Describe 'Testing against PSSA rules' {
    Context 'PSSA Standard Rules' {
        $analysis = Invoke-ScriptAnalyzer -Path  '..\*'
        $scriptAnalyzerRules = Get-ScriptAnalyzerRule

        forEach ($rule in $scriptAnalyzerRules) {
            It "Should pass $rule" {
                If ($analysis.RuleName -Contains $rule) {
                    $analysis |
                    Where-Object RuleName -EQ $rule -OutVariable failures |
                    Out-Default
                    $failures.Count | Should Be 0
                }
            }
        }
    }
}