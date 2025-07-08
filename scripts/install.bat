@echo off
REM Personal AI Memory System - Windows Installation Script

setlocal enabledelayedexpansion

REM Colors for output (basic Windows console colors)
set "GREEN=[32m"
set "YELLOW=[33m"
set "RED=[31m"
set "BLUE=[34m"
set "NC=[0m"

REM Find the script directory and template root
set "SCRIPT_DIR=%~dp0"
set "TEMPLATE_ROOT=%SCRIPT_DIR%.."

REM Check if we can find the template files
if not exist "%TEMPLATE_ROOT%\__CLAUDE_TEMPLATE.md" (
    echo %RED%[ERROR]%NC% Cannot find template files. Make sure you're running this from a personal-ai-memory-template repository.
    echo Expected files:
    echo   - %TEMPLATE_ROOT%\__CLAUDE_TEMPLATE.md
    echo   - %TEMPLATE_ROOT%\claude_journal\tag_bitmap.md
    exit /b 1
)

if not exist "%TEMPLATE_ROOT%\claude_journal\tag_bitmap.md" (
    echo %RED%[ERROR]%NC% Cannot find template files. Make sure you're running this from a personal-ai-memory-template repository.
    echo Expected files:
    echo   - %TEMPLATE_ROOT%\__CLAUDE_TEMPLATE.md
    echo   - %TEMPLATE_ROOT%\claude_journal\tag_bitmap.md
    exit /b 1
)

echo %BLUE%🧠 Personal AI Memory System Setup%NC%
echo.
echo This script will set up your personal AI memory system.
echo.

REM Default values
set "USER_NAME=[YOUR_NAME]"
set "WORKING_STYLE=[DESCRIBE YOUR WORK PATTERNS]"
set "BACKGROUND=[YOUR PROFESSIONAL BACKGROUND]"
set "TEMPLATE_TYPE=generic"
set "INIT_GIT=n"
set "PROJECT_NAME=[DESCRIBE YOUR MAIN PROJECT]"
set "PROJECT_DESC=[DESCRIBE YOUR OVERALL GOALS AND VISION]"
set "TARGET_DIR=%CD%"

REM Parse command line arguments
:parse_args
if "%~1"=="" goto :done_parsing
if /i "%~1"=="-i" (
    set "INTERACTIVE=true"
    shift
    goto :parse_args
)
if /i "%~1"=="--interactive" (
    set "INTERACTIVE=true"
    shift
    goto :parse_args
)
if /i "%~1"=="-t" (
    set "TARGET_DIR=%~2"
    shift
    shift
    goto :parse_args
)
if /i "%~1"=="--target" (
    set "TARGET_DIR=%~2"
    shift
    shift
    goto :parse_args
)
if /i "%~1"=="--template" (
    set "TEMPLATE_TYPE=%~2"
    shift
    shift
    goto :parse_args
)
if /i "%~1"=="-h" goto :show_help
if /i "%~1"=="--help" goto :show_help
echo %RED%[ERROR]%NC% Unknown option: %~1
exit /b 1

:show_help
echo Usage: %~nx0 [OPTIONS]
echo Options:
echo   -i, --interactive    Run in interactive mode
echo   -t, --target DIR     Target directory (default: current directory)
echo   --template TYPE      Use predefined template (developer, researcher, consultant)
echo   -h, --help          Show this help message
exit /b 0

:done_parsing

echo %GREEN%[INFO]%NC% Target directory: %TARGET_DIR%

REM Interactive mode
if "%INTERACTIVE%"=="true" (
    echo %BLUE%📝 Interactive Setup%NC%
    echo.
    
    set /p "USER_NAME=Enter your name: "
    set /p "WORKING_STYLE=Describe your working style: "
    set /p "BACKGROUND=What's your professional background?: "
    
    echo.
    echo %GREEN%[INFO]%NC% Available templates:
    echo 1. Generic - Basic template with common domains
    echo 2. Developer - Software engineering focused
    echo 3. Researcher - Academic and research workflows
    echo 4. Consultant - Client work and business development
    echo 5. Creative - Design and creative work patterns
    echo.
    
    set /p "TEMPLATE_CHOICE=Select template (1-5): "
    
    if "!TEMPLATE_CHOICE!"=="1" set "TEMPLATE_TYPE=generic"
    if "!TEMPLATE_CHOICE!"=="2" set "TEMPLATE_TYPE=developer"
    if "!TEMPLATE_CHOICE!"=="3" set "TEMPLATE_TYPE=researcher"
    if "!TEMPLATE_CHOICE!"=="4" set "TEMPLATE_TYPE=consultant"
    if "!TEMPLATE_CHOICE!"=="5" set "TEMPLATE_TYPE=creative"
    
    echo.
    set /p "INIT_GIT=Do you want to initialize a git repository for your journal? (y/n): "
    set /p "PROJECT_NAME=Enter your main project name (optional): "
    set /p "PROJECT_DESC=Enter your main project description (optional): "
)

echo %GREEN%[INFO]%NC% Using template: %TEMPLATE_TYPE%

REM Create directory structure
echo %GREEN%[INFO]%NC% Creating directory structure...
if not exist "%TARGET_DIR%\claude_journal" mkdir "%TARGET_DIR%\claude_journal"
if not exist "%TARGET_DIR%\claude_artifacts" mkdir "%TARGET_DIR%\claude_artifacts"

REM Copy and customize CLAUDE.md
echo %GREEN%[INFO]%NC% Setting up CLAUDE.md...
copy "%TEMPLATE_ROOT%\__CLAUDE_TEMPLATE.md" "%TARGET_DIR%\CLAUDE.md" >nul

REM Replace placeholders in CLAUDE.md (Windows batch version)
powershell -Command "(Get-Content '%TARGET_DIR%\CLAUDE.md') -replace '\[YOUR_NAME\]', '%USER_NAME%' | Set-Content '%TARGET_DIR%\CLAUDE.md'"
powershell -Command "(Get-Content '%TARGET_DIR%\CLAUDE.md') -replace '\[DESCRIBE YOUR WORK PATTERNS[^\]]*\]', '%WORKING_STYLE%' | Set-Content '%TARGET_DIR%\CLAUDE.md'"
powershell -Command "(Get-Content '%TARGET_DIR%\CLAUDE.md') -replace '\[YOUR PROFESSIONAL BACKGROUND[^\]]*\]', '%BACKGROUND%' | Set-Content '%TARGET_DIR%\CLAUDE.md'"
powershell -Command "(Get-Content '%TARGET_DIR%\CLAUDE.md') -replace '\[DESCRIBE YOUR MAIN PROJECT\]', '%PROJECT_NAME%' | Set-Content '%TARGET_DIR%\CLAUDE.md'"
powershell -Command "(Get-Content '%TARGET_DIR%\CLAUDE.md') -replace '\[DESCRIBE YOUR OVERALL GOALS AND VISION\]', '%PROJECT_DESC%' | Set-Content '%TARGET_DIR%\CLAUDE.md'"

REM Copy and customize tag_bitmap.md based on template type
echo %GREEN%[INFO]%NC% Setting up tag bitmap schema...
if exist "%TEMPLATE_ROOT%\templates\%TEMPLATE_TYPE%_tag_bitmap.md" (
    copy "%TEMPLATE_ROOT%\templates\%TEMPLATE_TYPE%_tag_bitmap.md" "%TARGET_DIR%\claude_journal\tag_bitmap.md" >nul
) else (
    copy "%TEMPLATE_ROOT%\claude_journal\tag_bitmap.md" "%TARGET_DIR%\claude_journal\tag_bitmap.md" >nul
)

REM Copy helper scripts
echo %GREEN%[INFO]%NC% Installing helper scripts...
xcopy "%TEMPLATE_ROOT%\scripts" "%TARGET_DIR%\scripts\" /E /I /Y >nul

REM Initialize git repository if requested
if /i "%INIT_GIT%"=="y" (
    echo %GREEN%[INFO]%NC% Initializing git repository...
    cd /d "%TARGET_DIR%"
    
    if not exist ".git" (
        git init
        echo # Personal AI Memory System > README.md
        echo. >> README.md
        echo This repository contains my personal AI memory system using hex-indexed journal entries. >> README.md
        echo. >> README.md
        echo ## Usage >> README.md
        echo. >> README.md
        echo - `CLAUDE.md` - AI assistant instructions >> README.md
        echo - `claude_journal/` - Journal entries with hex indexing >> README.md
        echo - `claude_artifacts/` - Additional project context >> README.md
        
        echo # Personal AI Memory System > .gitignore
        echo. >> .gitignore
        echo # Ignore sensitive files >> .gitignore
        echo *.log >> .gitignore
        echo *.tmp >> .gitignore
        echo .DS_Store >> .gitignore
        echo Thumbs.db >> .gitignore
        echo. >> .gitignore
        echo # Include journal entries and artifacts >> .gitignore
        echo !claude_journal/*.md >> .gitignore
        echo !claude_artifacts/*.md >> .gitignore
        
        git add .
        git commit -m "Initial setup of personal AI memory system"
        echo %GREEN%[INFO]%NC% Git repository initialized with initial commit
    ) else (
        echo %YELLOW%[WARN]%NC% Git repository already exists
    )
)

REM Create example journal entry
echo %GREEN%[INFO]%NC% Creating example journal entry...

REM Calculate days since 2025-01-01 (simplified for Windows)
for /f "tokens=1-3 delims=/" %%a in ('date /t') do (
    set "MM=%%a"
    set "DD=%%b"
    set "YYYY=%%c"
)

REM Simple date calculation (this is approximate)
set /a "DAYS_SINCE_EPOCH=(%YYYY%-2025)*365+(%MM%-1)*30+%DD%"

REM Convert to hex (simplified)
set /a "DATE_HEX=%DAYS_SINCE_EPOCH%"
if %DATE_HEX% LSS 16 (
    set "DATE_HEX_STR=000%DATE_HEX%"
) else if %DATE_HEX% LSS 256 (
    set "DATE_HEX_STR=00%DATE_HEX%"
) else if %DATE_HEX% LSS 4096 (
    set "DATE_HEX_STR=0%DATE_HEX%"
) else (
    set "DATE_HEX_STR=%DATE_HEX%"
)

set "EXAMPLE_FILENAME=%DATE_HEX_STR%010140010101.md"

echo # Setup Session - Personal AI Memory System > "%TARGET_DIR%\claude_journal\%EXAMPLE_FILENAME%"
echo ## Session: %DATE% - Session 1 >> "%TARGET_DIR%\claude_journal\%EXAMPLE_FILENAME%"
echo ### 🎯 Session Overview >> "%TARGET_DIR%\claude_journal\%EXAMPLE_FILENAME%"
echo **Duration**: 30 minutes >> "%TARGET_DIR%\claude_journal\%EXAMPLE_FILENAME%"
echo **Focus**: Initial setup of personal AI memory system >> "%TARGET_DIR%\claude_journal\%EXAMPLE_FILENAME%"
echo **Status**: ✅ COMPLETE - System successfully configured and ready for use >> "%TARGET_DIR%\claude_journal\%EXAMPLE_FILENAME%"
echo **Scope**: Individual setup and configuration >> "%TARGET_DIR%\claude_journal\%EXAMPLE_FILENAME%"
echo. >> "%TARGET_DIR%\claude_journal\%EXAMPLE_FILENAME%"
echo ### 📋 Session Accomplishments >> "%TARGET_DIR%\claude_journal\%EXAMPLE_FILENAME%"
echo 1. **System Installation**: Successfully installed personal AI memory template >> "%TARGET_DIR%\claude_journal\%EXAMPLE_FILENAME%"
echo 2. **Schema Configuration**: Set up tag bitmap schema for my work patterns >> "%TARGET_DIR%\claude_journal\%EXAMPLE_FILENAME%"
echo 3. **Initial Setup**: Configured CLAUDE.md with personal preferences >> "%TARGET_DIR%\claude_journal\%EXAMPLE_FILENAME%"
echo 4. **Git Repository**: %INIT_GIT% repository for version control >> "%TARGET_DIR%\claude_journal\%EXAMPLE_FILENAME%"
echo 5. **Helper Scripts**: Installed search and utility scripts >> "%TARGET_DIR%\claude_journal\%EXAMPLE_FILENAME%"

echo %GREEN%[INFO]%NC% Example journal entry created: %EXAMPLE_FILENAME%

REM Create helper batch file
echo %GREEN%[INFO]%NC% Setting up helper batch file...
echo @echo off > "%TARGET_DIR%\ai_memory_helpers.bat"
echo REM Personal AI Memory System - Helper Commands >> "%TARGET_DIR%\ai_memory_helpers.bat"
echo. >> "%TARGET_DIR%\ai_memory_helpers.bat"
echo echo Personal AI Memory System helpers loaded! >> "%TARGET_DIR%\ai_memory_helpers.bat"
echo echo Available commands: >> "%TARGET_DIR%\ai_memory_helpers.bat"
echo echo   dir claude_journal - List all journal entries >> "%TARGET_DIR%\ai_memory_helpers.bat"
echo echo   findstr /i "search_term" claude_journal\*.md - Search journal entries >> "%TARGET_DIR%\ai_memory_helpers.bat"

REM Print completion message
echo.
echo %BLUE%🎉 Setup Complete!%NC%
echo.
echo %GREEN%[INFO]%NC% Personal AI Memory System successfully installed!
echo.
echo 📁 Files created:
echo    - CLAUDE.md (AI assistant instructions)
echo    - claude_journal\tag_bitmap.md (hex indexing schema)
echo    - claude_journal\%EXAMPLE_FILENAME% (example entry)
echo    - scripts\ (helper utilities)
echo    - ai_memory_helpers.bat (helper commands)
echo.
echo 🚀 Next steps:
echo    1. Review and customize CLAUDE.md for your specific needs
echo    2. Update claude_journal\tag_bitmap.md with your work domains
echo    3. Run ai_memory_helpers.bat to load helper commands
echo    4. Start your first AI conversation with the system
echo.
echo 📖 Documentation:
echo    - README.md for detailed usage instructions
echo    - docs\ directory for guides and examples
echo.
echo 💡 Tips:
echo    - Use 'findstr /i "term" claude_journal\*.md' to search entries
echo    - Use 'dir claude_journal' to see all entries
echo    - Customize the tag bitmap as your work patterns evolve
echo.
echo %GREEN%[INFO]%NC% Happy journaling! 🧠✨

endlocal