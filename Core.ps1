$ErrorActionPreference = "stop"
Set-PSDebug -Strict
Add-Type -AssemblyName PresentationFramework
[xml]$xaml = [XML](Get-Content ./GUI.xaml)
$XML = [XML](Get-Content ./Application.xml)
$reader = New-Object System.Xml.XmlNodeReader $xaml
$frm = [System.Windows.Markup.XamlReader]::Load($reader)
$application = $frm.FindName("application")
$msg = $frm.FindName("Overview")

# 全てのRadioButtonを非表示にする
foreach ($s in $application.Children) {
    $s.Visibility = "Collapsed"
}

# RadioButtonのContentを設定し、表示する
$applicationList = $XML.Application.Software.Name
$n = 0
$children = $application.Children
foreach ($c in $applicationList) {
    $radioButton = $children[$n]
    $radioButton.Content = $c
    $radioButton.Visibility = "Visible"
    $n += 1
}

# RadioButtonのContentを設定し、表示する
$overviewList = $XML.Application.Software.Overview
$n = 0
$childrenO = $msg.Children
foreach ($c in $overviewList) {
    $massage = $childrenO[$n]
    $massage.Content = $c
    $massage.Visibility = "Visible"
    $n += 1
}

# 選択された項目を返す
function getChecked($parent) {
    $checked = ""
    foreach ($child in $parent.Children) {
        if ($child.isChecked) {
            $checked += $child.Content
        }
    }
    return $checked
}

function clicked {
    $selectedApplication = getChecked $application
    . ./Software/"$selectedApplication".ps1
    . ./"$selectedApplication".exe
}

$btn1 = $frm.FindName("btn1")
$btn1.Add_Click({clicked})
$result = $frm.ShowDialog()
