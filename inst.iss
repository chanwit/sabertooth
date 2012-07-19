; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "SaberTooth Dart Editor (Rikulo bundled)"
#define MyAppShortName "SaberTooth Editor"
#define MyAppVersion "1.0.0.M1"
#define MyAppPublisher "Chanwit Kaewkasi"
#define MyAppURL "http://twitter.com/chanwit"
#define MyAppExeName "DartEditor.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{6D00ECCC-5B5F-4EA4-85F1-2E1BD33571D2}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={sd}\SaberTooth
DefaultGroupName={#MyAppShortName}
OutputBaseFilename=sabertooth_setup_{#MyAppVersion}
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "E:\dart\_workspace\*"; DestDir: "{app}\workspace"; Flags: ignoreversion recursesubdirs; AfterInstall: ReplacePackagePath
Source: "E:\dart\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs; Excludes: "_workspace\*,workspace\*,graphics\*,*.iss,Output\*,*.dart.js,*.dart.js.map,.children,.project"


[Icons]
Name: "{group}\{#MyAppShortName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{commondesktop}\{#MyAppShortName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent


[Code]
procedure ReplacePackagePath;
var
  appPath: string;
  prefPath: string;
  prefValue: string;
begin
  appPath := ExpandConstant('{app}');
  prefPath := appPath + '\workspace\.metadata\.plugins\org.eclipse.core.runtime\.settings\com.google.dart.tools.core.prefs';
  prefValue := appPath + '\dart-sdk\packages';
  StringChangeEx(prefValue, '\', '\\', True);
  StringChangeEx(prefValue, ':', '\:', True);
  StringChangeEx(prefValue, ' ', '\ ', True);  
  SaveStringToFile(prefPath, #13#10 + 'package\ root=' + prefValue + #13#10, True);  
end;