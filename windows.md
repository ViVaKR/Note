# 윈도우 시스템

## Registry Keys

- ROOT
- USER
- MACHINE
- USERS
- CONFING

## 파일 탐색기에서 `OneDrive` 숨기기

```registry
	HKEY_CLASSES_ROOT\WOW6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}
	HKEY_CLASSES_ROOT\WOW6432Node\CLSID\{04271989-C4D2-4908-1D03-D3A5C472F761}

	HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}
	HKEY_CLASSES_ROOT\CLSID\{04271989-C4D2-4908-1D03-D3A5C472F761}

	System.IsPinnedToNameSpaceTree => 0으로 설정
```

## `OneDrive Biz` 이름 변경하기

```registry
	HKEY_CURRENT_USER (HKCU) (4 locations)
	HKCU\Software\Microsoft\OneDrive\Accounts\Business1\UserFolder
	HKCU\Software\Microsoft\OneDrive\Accounts\Business1\ScopeIdToMountPointPathCache\(ID)
	HKCU\Software\Microsoft\OneDrive\Accounts\Business1\Tenants\(name)\(path)
	HKCU\Software\SyncEngines\Providers\OneDrive\(ID)\MountPoint

	HKEY_LOCAL_MACHINE (HKLM) (2 locations)
	HKLM\SOFTWARE\Microsoft\Security Center\Provider\CBP\(ID)\NAMESPACE
	HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\SyncRootManager\OneDrive!(ID)\UserSyncRoots\(SID)
```

- Quite OneDrive
- Create a folder(give the name you want for your onedrive) at a location where you want your onedrive data to be synced
- Go to "%LOCALAPPDATA%\Microsoft\OneDrive\settings"
- Open folder Business1 (it could be Business2 or 3 based on how many accounts you have syncing via OneDrive)
- Find ".ini" file with the long somewhat random name similar to this: 31c26d83-4db2-4503-a8g0-a3e14e7bcchd.ini

Right click edit - Find the path of your onedrive then change it to the desired path and name
E.g. if it c:\user\onedrive - company name then change it to the same as path of what you have created in 2nd step

---

## 시작프로그램 복구

```powershell
New-Item -ItemType Directory "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"
New-Item -ItemType file "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\desktop.ini"

```

> WIN + R -> Shell:Startup -> 엔터 -> desktop.ini

[.ShellClassInfo]
LocalizedResourceName=@%SystemRoot%\system32\shell32.dll,-21787

속성 변경 -> desktop.ini -> 속성 -> 숨김

---

## 시스템 점검

```ps1
	DISM /Online /Cleanup-Image /ScanHealth
```

## Remove Defautl App

```ps1
	Get-AppxPackage | Select-Object Name, PackageFullName | Format-List
	Remove-AppxPackage [PackageFullName]
```

- Uninstall 3D Builder: Get-AppxPackage *3dbuilder* | Remove-AppxPackage
- Uninstall ACG Player: Get-AppxPackage *acg* | Remove-AppxPackage
- Uninstall Alarms and Clock: Get-AppxPackage *alarms* | Remove-AppxPackage
- Uninstall AV1 Codec: Get-AppxPackage *AV1VideoExtension* | Remove-AppxPackage
- Uninstall Calculator: Get-AppxPackage *calculator* | Remove-AppxPackage
- Uninstall Calendar and Mail: Get-AppxPackage *communications* | Remove-AppxPackage
- Uninstall Cortana: Get-AppxPackage *Microsoft.549981C3F5F10* | Remove-AppxPackage
- Uninstall Camera: Get-AppxPackage *camera* | Remove-AppxPackage
- Uninstall Disney+: Get-AppxPackage *disney* | Remove-AppxPackage
- Uninstall Dolby Access: Get-AppxPackage *dolbyaccess* | Remove-AppxPackage
- Uninstall Feedback Hub: Get-AppxPackage *WindowsFeedbackHub* | Remove-AppxPackage
- Uninstall Fitbit Coach: Get-AppxPackage *fitbitcoach* | Remove-AppxPackage
- Uninstall Office: Get-AppxPackage *officehub* | Remove-AppxPackage
- Uninstall Get Started: Get-AppxPackage *getstarted* | Remove-AppxPackage
- Uninstall Music: Get-AppxPackage *zunemusic* | Remove-AppxPackage
- Uninstall HEIF image support: Get-AppxPackage *HEIFImageExtension* | Remove-AppxPackage
- Uninstall Get Help: Get-AppxPackage *GetHelp* | Remove-AppxPackage
- Uninstall Maps: Get-AppxPackage *maps* | Remove-AppxPackage
- Uninstall Microsoft Edge: Get-AppxPackage *MicrosoftEdge* | Remove-AppxPackage
- Uninstall Microsoft Solitaire Collection: Get-AppxPackage *solitairecollection* | Remove-AppxPackage
- Uninstall Microsoft To-Do: Get-AppxPackage *Todos* | Remove-AppxPackage
- Uninstall Microsoft Teams: Get-AppxPackage *Teams* | Remove-AppxPackage
- Uninstall Money: Get-AppxPackage *bingfinance* | Remove-AppxPackage
- Uninstall Movies & TV: Get-AppxPackage *zunevideo* | Remove-AppxPackage
- Uninstall News: Get-AppxPackage *bingnews* | Remove-AppxPackage
- Uninstall Notepad: Get-AppxPackage *WindowsNotepad* | Remove-AppxPackage
- Uninstall OneNote: Get-AppxPackage *onenote* | Remove-AppxPackage
- Uninstall OneDrive: Get-AppxPackage *OneDriveSync* | Remove-AppxPackage
- Uninstall Paint: Get-AppxPackage *Paint* | Remove-AppxPackage
- Uninstall People: Get-AppxPackage *people* | Remove-AppxPackage
- Uninstall Phone Companion: Get-AppxPackage *windowsphone* | Remove-AppxPackage
- Uninstall Phototastic Collage: Get-AppxPackage *phototastic* | Remove-AppxPackage
- Uninstall Photos: Get-AppxPackage *photos* | Remove-AppxPackage
- Uninstall PicsArt: Get-AppxPackage *picsart* | Remove-AppxPackage
- Uninstall Plex: Get-AppxPackage *plex* | Remove-AppxPackage
- Uninstall PowerAutomate: Get-AppxPackage *PowerAutomateDesktop* | Remove-AppxPackage
- Uninstall Screen and Sketch/Snipping Tool: Get-AppxPackage *ScreenSketch* | Remove-AppxPackage
- Uninstall Skype: Get-AppxPackage *skypeapp* | Remove-AppxPackage
- Uninstall Store: Get-AppxPackage *windowsstore* | Remove-AppxPackage
- Uninstall Sticky Notes: Get-AppxPackage *MicrosoftStickyNotes* | Remove-AppxPackage
- Uninstall Spotify: Get-AppxPackage *SpotifyMusic* | Remove-AppxPackage
- Uninstall Sports: Get-AppxPackage *bingsports* | Remove-AppxPackage
- Uninstall Voice Recorder: Get-AppxPackage *soundrecorder* | Remove-AppxPackage
- Uninstall Weather: Get-AppxPackage *bingweather* | Remove-AppxPackage
- Uninstall WebP image support: Get-AppxPackage *WebpImageExtension* | Remove-AppxPackage
- Uninstall Windows Terminal: Get-AppxPackage *WindowsTerminal* | Remove-AppxPackage
- Uninstall Xbox: Get-AppxPackage *xbox* | Remove-AppxPackage
- Uninstall Your Phone: Get-AppxPackage *YourPhone* | Remove-AppxPackage

## 사용자 폴더 변경

Windows 11 에서 새 사용자 계정을 만들면 운영체제(OS) 가 자동으로 
C:\Users\Username 에 새 사용자 프로필 폴더를 만듬

1. 사용자 명과 SID 확인하기 `$ wmic useraccount get name, SID``
2. SID 메모해두기
3. Win + R => regedit => 레지스트리 편집기
`HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList`

4. 동일한 SID 와 동일한 키 클릭
5. ProfileImagePath 값 수정선택
6. 프로필 폴더에 사용할 이름을 입력하고 [확인] 클릭
7. Win + E 파일 탐색기 를 열고 
8. `C:\Users\` 로 이동
9. 사용자 프로필을 선택하고 F2 키를 눌러 이름을 바꿈, 레지스트리에 입력한 사용자 이름과 일치 해야함

---
