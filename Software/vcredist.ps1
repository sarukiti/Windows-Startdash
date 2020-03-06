Invoke-WebRequest -Uri "https://aka.ms/vs/16/release/vc_redist.x86.exe" -OutFile "VC2019x86.exe"
Invoke-WebRequest -Uri "https://aka.ms/vs/16/release/vc_redist.x64.exe" -OutFile "VC2019x64.exe"
Invoke-WebRequest -Uri "https://aka.ms/highdpimfc2013x86jpn" -OutFile "VC2013x86.exe"
Invoke-WebRequest -Uri "https://aka.ms/highdpimfc2013x64jpn" -OutFile "VC2013x64.exe"
Invoke-WebRequest -Uri "https://download.microsoft.com/download/C/6/D/C6D0FD4E-9E53-4897-9B91-836EBA2AACD3/vcredist_x86.exe" -OutFile "VC2010x86.exe"
Invoke-WebRequest -Uri "https://download.microsoft.com/download/A/8/0/A80747C3-41BD-45DF-B505-E9710D2744E0/vcredist_x64.exe" -OutFile "VC2010x64.exe"
Invoke-WebRequest -Uri "https://download.microsoft.com/download/1/2/2/1220f3be-11af-4695-990e-5404763d9e9d/vcredist_x86.exe" -OutFile "VC2008x86.exe"
Invoke-WebRequest -Uri "https://download.microsoft.com/download/f/0/c/f0cf29d7-442e-49cd-98aa-eba28c2f8ab6/vcredist_x64.exe" -OutFile "vcredist.exe"

./VC2019x86.exe | out-null
./VC2019x64.exe | out-null
./VC2013x86.exe | out-null
./VC2013x64.exe | out-null
./VC2010x86.exe | out-null
./VC2010x64.exe | out-null
./VC2008x86.exe | out-null
./vcredist.exe | out-null