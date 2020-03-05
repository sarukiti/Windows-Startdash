$ErrorActionPreference = "stop"
Set-PSDebug -Strict
Add-Type -AssemblyName PresentationFramework

[xml]$xaml = @'
<Window
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    Title="xaml test #2"
    Width="170pt" Height="170pt">
  <StackPanel>
    <StackPanel Orientation="Horizontal" HorizontalAlignment="Center">
      <StackPanel x:Name="application">
        <RadioButton Content="PlaceHolder"></RadioButton>
        <RadioButton Content="PlaceHolder"></RadioButton>
        <RadioButton Content="PlaceHolder"></RadioButton>
        <RadioButton Content="PlaceHolder"></RadioButton>
        <RadioButton Content="PlaceHolder"></RadioButton>
        <RadioButton Content="PlaceHolder"></RadioButton>
        <RadioButton Content="PlaceHolder"></RadioButton>
        <RadioButton Content="PlaceHolder"></RadioButton>
        <RadioButton Content="PlaceHolder"></RadioButton>
        <RadioButton Content="PlaceHolder"></RadioButton>
        <RadioButton Content="PlaceHolder"></RadioButton>
      </StackPanel>
      <Label Content="  " FontSize="10pt"/>
    </StackPanel>
    <Label x:Name="msg"  Content="  " FontSize="10pt"/>
    <Button x:Name="btn1" Content="Download"  FontSize="10pt" />
  </StackPanel>
</Window>
'@

$reader = New-Object System.Xml.XmlNodeReader $xaml
$frm = [System.Windows.Markup.XamlReader]::Load($reader)
$application = $frm.FindName("application")
$msg = $frm.FindName("msg")

# 全てのRadioButtonを非表示にする
foreach ($s in $application.Children) {
    $s.Visibility = "Collapsed"
}

# RadioButtonのContentを設定し、表示する
$applicationList = "Bluestacks Discord Firefox FirefoxNightly NoxPlayer Opera Steam".split(" ")
$n = 0
$children = $application.Children
foreach ($c in $applicationList) {
    $radioButton = $children[$n]
    $radioButton.Content = $c
    $radioButton.Visibility = "Visible"
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
    $(Get-ChildItem "Core.ps1").DirectoryName
    $selectedApplication = getChecked $application
    . ./Software/"$selectedApplication".ps1
}

$btn1 = $frm.FindName("btn1")
$btn1.Add_Click({clicked})
$result = $frm.ShowDialog()
