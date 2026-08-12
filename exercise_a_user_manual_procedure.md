# Exercise A: User Manual Procedure

## Topic
Creating and activating a Python virtual environment and installing a package.

## Prerequisites
Before you begin, make sure you have all of the following:
- A Windows computer with Python 3.10 or newer installed
- A terminal application such as PowerShell or Command Prompt
- A folder where you want to create your project, such as `C:\Users\YourName\Documents\project`
- Internet access so you can install packages if needed

> Screenshot to include: a screenshot of File Explorer showing the project folder, with a terminal window open in the same location. The image should clearly show the project path and the terminal prompt so the user can verify they are in the correct place.

## Procedure

1. Open PowerShell in your project folder.  
   Expected result: A terminal window opens and the prompt displays the correct project path.

2. Check that Python is installed by entering: `python --version`  
   Expected result: The terminal prints a Python version number, such as `Python 3.11.4`.

3. Create a virtual environment by typing: `python -m venv .venv`  
   Expected result: A folder named `.venv` appears in your project directory.

4. Confirm that the virtual environment was created.  
   Expected result: You can see `.venv` in the directory listing, which shows that the environment exists.

5. Activate the virtual environment by typing: `.venv\Scripts\Activate.ps1`  
   Expected result: The terminal prompt changes and begins with `(.venv)`, which indicates that the virtual environment is active.

6. Verify the environment is active by typing: `python --version`  
   Expected result: Python still runs correctly, and the environment is the one inside `.venv`.

7. Install a package by typing: `python -m pip install requests`  
   Expected result: The package downloads and installs successfully, and pip confirms the installation.

8. Confirm the package is available by typing: `python -c "import requests; print(requests.__version__)"`  
   Expected result: The terminal prints the installed version of the `requests` package.

9. Deactivate the environment when you are finished by typing: `deactivate`  
   Expected result: The terminal prompt returns to normal, and the `(.venv)` prefix disappears.

## Troubleshooting
The most common beginner problem is that PowerShell blocks script execution. If you see an error such as "running scripts is disabled on this system," open PowerShell and run:

`Set-ExecutionPolicy -Scope CurrentUser RemoteSigned`

Then close the terminal and try activating the environment again. This change allows the activation script to run without changing system-wide security settings.
