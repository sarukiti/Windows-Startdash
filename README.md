# Windows-Startdash
Powershellで動作する自動ソフトウェアインストールツールです  
# 使い方　　
Core.ps1を右クリックしてPowershellを実行してください。
2010年以前のC++再頒布可能パッケージはダウンロードのみとなっているので各自で実行するとインストールできます
ダウンロードディレクトリはCore.ps1があるところです
# ソフトウェア追加のしかた
本家Serene-Startdashと比べて面倒です  
まず``<RadioButton Content="PlaceHolder"></RadioButton>``と``<Label x:Name="label<ナンバー>" Content="  " HorizontalAlignment="Left" Margin="0,-8,0,0" VerticalAlignment="Top" FontSize="10"/>``を一行追加  
次に``Application.xml``にソフト名と概要を追加します  
んでからのSoftwareフォルダの中に``ソフト名.ps1``を追加し、``Invoke-WebRequest -Uri "ダウンロードリンク" -OutFile "ソフト名.exe"``  
  
簡単ですね(大嘘)  

MITライセンスで公開してるので煮るなり焼くなり好きには出来ませんでした  
