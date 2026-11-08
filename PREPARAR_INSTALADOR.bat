@echo off
setlocal
cd /d "%~dp0"

echo ============================================
echo  Minha Central de Jogos - Preparar instalador
echo ============================================
echo.

where py >nul 2>nul
if errorlevel 1 (
  echo Python nao foi encontrado. Instale o Python 3.11 ou superior.
  pause
  exit /b 1
)

if not exist ".venv\Scripts\python.exe" (
  py -3 -m venv .venv
  if errorlevel 1 goto erro
)

call ".venv\Scripts\activate.bat"
python -m pip install --upgrade pip
if errorlevel 1 goto erro
pip install -r requirements.txt
if errorlevel 1 goto erro

if exist "build" rmdir /s /q "build"
if exist "dist" rmdir /s /q "dist"

echo Gerando o icone oficial da central...
python -c "from PySide6.QtWidgets import QApplication; from app.main import ensure_brand_assets; app=QApplication([]); ensure_brand_assets(); app.quit()"
if errorlevel 1 goto erro

python -m PyInstaller --noconfirm --clean --windowed --onedir ^
  --name "MinhaCentralDeJogos" ^
  --icon "assets\branding\controle_jogos.ico" ^
  --collect-all PySide6 ^
  --collect-all pygame ^
  --add-data "assets\branding;assets\branding" ^
  app\main.py

if errorlevel 1 goto erro

echo.
echo Build concluido. Agora abra installer\MinhaCentralDeJogos.iss no Inno Setup Compiler.
echo.
pause
exit /b 0

:erro
echo.
echo Ocorreu um erro durante a preparacao. Leia as mensagens acima.
pause
exit /b 1
