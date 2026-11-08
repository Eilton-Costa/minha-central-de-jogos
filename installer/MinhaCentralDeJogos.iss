#define MyAppName "Minha Central de Jogos"
#define MyAppVersion "1.0.0"
#define MyAppExeName "MinhaCentralDeJogos.exe"

[Setup]
AppId={{B8D5F9B2-6E8D-4D72-A1C4-9E1B72C9A110}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher=Minha Central de Jogos
DefaultDirName={localappdata}\Programs\Minha Central de Jogos
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
PrivilegesRequired=lowest
OutputDir=..\output
OutputBaseFilename=Instalador_Minha_Central_de_Jogos
Compression=lzma2
SolidCompression=yes
WizardStyle=modern
UninstallDisplayName={#MyAppName}
SetupLogging=yes
ArchitecturesInstallIn64BitMode=x64compatible
Uninstallable=yes
SetupIconFile=..\assets\branding\controle_jogos.ico

[Languages]
Name: "brazilian"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"

[Tasks]
Name: "desktopicon"; Description: "Criar atalho na área de trabalho"; GroupDescription: "Atalhos:"; Flags: unchecked

[Files]
Source: "..\dist\MinhaCentralDeJogos\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\assets\branding\controle_jogos.ico"; DestDir: "{app}\assets\branding"; Flags: ignoreversion

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; IconFilename: "{app}\assets\branding\controle_jogos.ico"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; IconFilename: "{app}\assets\branding\controle_jogos.ico"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "Abrir Minha Central de Jogos"; Flags: postinstall nowait skipifsilent

[Code]
var
  NamePage: TInputQueryWizardPage;
  PlayerName: string;

function SafeFolderName(const Value: string): string;
var
  I: Integer;
  C: string;
begin
  Result := '';
  for I := 1 to Length(Value) do
  begin
    C := Copy(Value, I, 1);
    if Pos(C, '<>:"/\|?*') = 0 then
      Result := Result + C
    else
      Result := Result + '_';
  end;
  Result := Trim(Result);
  while (Length(Result) > 0) and (Result[Length(Result)] = '.') do
    Delete(Result, Length(Result), 1);
  if Result = '' then
    Result := 'Jogador';
end;

procedure InitializeWizard;
begin
  NamePage := CreateInputQueryPage(wpWelcome,
    'Personalização do aplicativo',
    'Digite seu nome para personalizar o aplicativo.',
    'Esse nome aparecerá no cabeçalho e também será usado no nome da pasta de instalação.');
  NamePage.Add('Seu nome:', False);
  NamePage.Values[0] := 'Jogador';
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  Result := True;
  if CurPageID = NamePage.ID then
  begin
    PlayerName := Trim(NamePage.Values[0]);
    if PlayerName = '' then
    begin
      MsgBox('Digite seu nome para continuar a instalação.', mbError, MB_OK);
      Result := False;
      Exit;
    end;
    WizardForm.DirEdit.Text :=
      ExpandConstant('{localappdata}\Programs\') +
      SafeFolderName(PlayerName) + ' - Minha Central de Jogos';
  end;
end;

procedure CurStepChanged(CurStep: TSetupStep);
var
  UserFile: string;
begin
  if CurStep = ssPostInstall then
  begin
    UserFile := ExpandConstant('{app}\nome_usuario.txt');
    SaveStringToFile(UserFile, Trim(PlayerName), False);
  end;
end;
