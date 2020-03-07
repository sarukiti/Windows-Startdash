$ErrorActionPreference = "stop"
Set-PSDebug -Strict
Add-Type -AssemblyName PresentationFramework

[xml]$xaml = @'
<Window
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    Title="WindowsStartdash"
    Width="500" Height="200pt">
    <StackPanel>
        <StackPanel Orientation="Horizontal" HorizontalAlignment="Left">
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
            <StackPanel x:Name="Overview">
                <Label x:Name="label01" Content="  " HorizontalAlignment="Left" Margin="0,-5,0,0" VerticalAlignment="Top" FontSize="10"/>
                <Label x:Name="label02" Content="  " HorizontalAlignment="Left" Margin="0,-8,0,0" VerticalAlignment="Top" FontSize="10"/>
                <Label x:Name="label03" Content="  " HorizontalAlignment="Left" Margin="0,-8,0,0" VerticalAlignment="Top" FontSize="10"/>
                <Label x:Name="label04" Content="  " HorizontalAlignment="Left" Margin="0,-8,0,0" VerticalAlignment="Top" FontSize="10"/>
                <Label x:Name="label05" Content="  " HorizontalAlignment="Left" Margin="0,-8,0,0" VerticalAlignment="Top" FontSize="10"/>
                <Label x:Name="label06" Content="  " HorizontalAlignment="Left" Margin="0,-8,0,0" VerticalAlignment="Top" FontSize="10"/>
                <Label x:Name="label07" Content="  " HorizontalAlignment="Left" Margin="0,-8,0,0" VerticalAlignment="Top" FontSize="10"/>
                <Label x:Name="label08" Content="  " HorizontalAlignment="Left" Margin="0,-8,0,0" VerticalAlignment="Top" FontSize="10"/>
                <Label x:Name="label09" Content="  " HorizontalAlignment="Left" Margin="0,-8,0,0" VerticalAlignment="Top" FontSize="10"/>
                <Label x:Name="label10" Content="  " HorizontalAlignment="Left" Margin="0,-8,0,0" VerticalAlignment="Top" FontSize="10"/>
                <Label x:Name="label11" Content="  " HorizontalAlignment="Left" Margin="0,-8,0,0" VerticalAlignment="Top" FontSize="10"/>
            </StackPanel>
        </StackPanel>
        <Button x:Name="btn1" Content="Download"  FontSize="10pt" />
    </StackPanel>
</Window>
'@

$reader = New-Object System.Xml.XmlNodeReader $xaml
$frm = [System.Windows.Markup.XamlReader]::Load($reader)
$application = $frm.FindName("application")
$msg = $frm.FindName("Overview")
$XML = [XML](Get-Content ./Application.xml)

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
