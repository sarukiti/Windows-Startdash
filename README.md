# Windows-Startdash
Powershellで動作する自動ソフトウェアダウンロードツールです  
# 使い方　　
Core.ps1を右クリックしてPowershellを実行してください。
# ソフトウェア追加のしかた
本家Serene-Startdashと比べて面倒です  
まず``<RadioButton Content="PlaceHolder"></RadioButton>``を一行追加  
次に``$applicationList``にスペース開けてソフト名を追加します  
んでからのSoftwareフォルダの中に``ソフト名.ps1``を追加し、``Invoke-WebRequest -Uri "ダウンロードリンク" -OutFile "ソフト名.exe"``  
  
簡単ですね(大嘘)  

MITライセンスで公開してるので煮るなり焼くなり好きには出来ませんでした  

Copyright (c) 2020 sarukiti
Released under the MIT license
https://opensource.org/licenses/mit-license.php  
