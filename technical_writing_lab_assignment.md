# Technical Writing Lab Assignment

## Overview

Technical writing, like all writing, improves through practice with feedback - not through reading about it. This lab places you in three different writing roles in a single session: you will write a user-facing procedure, an API reference entry, and a brief technical report section. Each exercise has a strict time limit to simulate the realistic pressure of professional documentation work, where deadlines are fixed and perfection must yield to completeness. After all three exercises, you will participate in a structured peer critique. The critique process is as important as the writing itself - learning to give and receive specific, constructive feedback is a core professional skill that transfers well beyond technical writing.

---

## Exercise A: User Manual Procedure

### Topic
Create and activate a Python virtual environment and install a package.

### Prerequisites
Before you begin, make sure you have all of the following:
- A Windows computer with Python 3.10 or newer installed
- A terminal application such as PowerShell or Command Prompt
- A folder where you want to create your project, such as `C:\Users\YourName\Documents\project`
- Internet access so you can install packages if needed

> Screenshot to include: a screenshot of File Explorer showing the project folder, with a terminal window open in the same location. The screenshot should clearly show the project path and the current working directory so the user can verify they are in the correct place.

### Procedure

1. Open PowerShell in your project folder.
   Expected result: A terminal window opens and the prompt displays the correct project path.

2. Check that Python is installed by entering: `python --version`
   Expected result: The terminal prints a Python version number, such as `Python 3.11.4`.

3. Create a virtual environment by typing: `python -m venv .venv`
   Expected result: A folder named `.venv` appears in your project directory.

4. Confirm that the virtual environment was created.
   Expected result: You can see `.venv` in the directory listing, which shows the environment exists.

5. Activate the virtual environment by typing: `.venv\Scripts\Activate.ps1`
   Expected result: The terminal prompt changes and begins with `(.venv)`, which indicates the virtual environment is active.

6. Verify the environment is active by typing: `python --version`
   Expected result: Python still runs correctly, and the environment is the one inside `.venv`.

7. Install a package by typing: `python -m pip install requests`
   Expected result: The package downloads and installs successfully, and pip confirms the installation.

8. Confirm the package is available by typing: `python -c "import requests; print(requests.__version__)"`
   Expected result: The terminal prints the installed version of the `requests` package.

9. Deactivate the environment after you finish by typing: `deactivate`
   Expected result: The terminal prompt returns to normal, and the `(.venv)` prefix disappears.

### Troubleshooting
The most common beginner problem is that PowerShell blocks script execution. If you see an error such as "running scripts is disabled on this system," open PowerShell and run:

`Set-ExecutionPolicy -Scope CurrentUser RemoteSigned`

Then close the terminal and try activating the environment again. This change allows the activation script to run without changing system-wide security settings.

---

## Exercise B: API Reference Entry

### Endpoint
Method: `POST`  
Path: `/api/v1/projects/{projectId}/tasks`

### Description
Creates a new task in a specific project. An authenticated user can add a task with a title, optional description, assignee, due date, and priority.

### Request Parameters

#### Path Parameters
- `projectId` (string, required)
  - The unique ID of the project that will contain the new task.

#### Query Parameters
- None

#### Body Parameters
- `title` (string, required)
  - The task title. Must be between 1 and 120 characters.
- `description` (string, optional)
  - A detailed description of the task. May be omitted or left empty.
- `assigneeId` (string, required)
  - The user ID of the person assigned to complete the task.
- `dueDate` (string, required)
  - The due date in ISO 8601 format, such as `2026-08-30`.
- `priority` (string, required)
  - Priority level. Allowed values: `low`, `medium`, or `high`.

### Required Request Headers
- `Authorization` (string, required)
  - Bearer token used for authentication. Example: `Authorization: Bearer eyJhbGciOi...`
- `Content-Type` (string, required)
  - Must be `application/json`

### Possible HTTP Response Codes
- `201 Created`
  - The task was created successfully.
- `400 Bad Request`
  - The request body is missing required fields or contains invalid data.
- `401 Unauthorized`
  - The request is missing a valid token or the token has expired.
- `403 Forbidden`
  - The authenticated user does not have permission to create tasks in this project.
- `404 Not Found`
  - The specified project ID does not exist.
- `409 Conflict`
  - A business rule conflict occurred, such as a duplicate task that the system rejects.
- `500 Internal Server Error`
  - The server encountered an unexpected problem while handling the request.

### Example Request Body
```json
{
  "title": "Prepare sprint demo",
  "description": "Collect screenshots, verify deployment, and rehearse the final walkthrough for the sprint review.",
  "assigneeId": "user_1048",
  "dueDate": "2026-08-30",
  "priority": "high"
}
```

### Example Successful Response Body
```json
{
  "id": "task_9821",
  "projectId": "proj_771",
  "title": "Prepare sprint demo",
  "description": "Collect screenshots, verify deployment, and rehearse the final walkthrough for the sprint review.",
  "assigneeId": "user_1048",
  "assigneeName": "Ariana Lee",
  "dueDate": "2026-08-30",
  "priority": "high",
  "status": "open",
  "createdAt": "2026-08-12T10:15:00Z",
  "updatedAt": "2026-08-12T10:15:00Z"
}
```

### Example HTTP Request
```http
POST /api/v1/projects/proj_771/tasks HTTP/1.1
Authorization: Bearer eyJhbGciOi...
Content-Type: application/json

{
  "title": "Prepare sprint demo",
  "description": "Collect screenshots, verify deployment, and rehearse the final walkthrough for the sprint review.",
  "assigneeId": "user_1048",
  "dueDate": "2026-08-30",
  "priority": "high"
}
```

---

## Exercise C: Brief Technical Report Section

The documentation process was evaluated through a timed exercise that required clear procedural writing, structured API documentation, and concise technical reporting. This format reflects real professional work, in which engineers must communicate technical content clearly and accurately while balancing completeness with practical deadlines. The user manual component emphasized step-by-step clarity, beginner-friendly language, and explicit expected outcomes, all of which support comprehension for people who are new to the tool.

The API reference entry demonstrated that technical writing depends on consistency as much as detail. A strong API document must explain request formats, authentication requirements, valid parameter values, and the conditions under which different errors occur. By including realistic JSON examples and a consistent response schema, the documentation becomes both understandable to developers and reliable as an integration specification.

Overall, strong technical documentation is defined by precision, completeness, and audience awareness. Good writing does not simply explain a process or endpoint; it tells the reader what they need to do, what the system expects, and what outcome to expect. These principles remain essential across user manuals, developer documentation, and technical reports in professional computing environments.

---

## Peer Critique Checklist

Use this checklist during the feedback stage:
- Is the procedure easy to follow in order?
- Does each step include one action and one expected result?
- Is the audience appropriate for a first-semester computing student?
- Does the API reference include all required parameters and headers?
- Are the response codes explained clearly in plain language?
- Are the JSON examples valid and consistent?
- Is the technical report section concise but informative?
- Does the document avoid unnecessary jargon or unexplained terms?

---

## Submission Notes

This assignment can be completed as:
1. a single combined document,
2. three separate files, or
3. a folder containing one file per exercise.

A strong submission should be complete, readable, and internally consistent, even if it is not flawless.
