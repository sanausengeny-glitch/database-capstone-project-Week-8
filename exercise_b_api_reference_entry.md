# Exercise B: API Reference Entry

## Endpoint
Method: `POST`  
Path: `/api/v1/projects/{projectId}/tasks`

## Description
Creates a new task in a specific project. An authenticated user can add a task with a title, optional description, assignee, due date, and priority.

## Request Parameters

### Path Parameters
- `projectId` (string, required)
  - The unique ID of the project that will contain the new task.

### Query Parameters
- None

### Body Parameters
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

## Required Request Headers
- `Authorization` (string, required)
  - Bearer token used for authentication. Example: `Authorization: Bearer eyJhbGciOi...`
- `Content-Type` (string, required)
  - Must be `application/json`

## Possible HTTP Response Codes
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

## Example Request Body
```json
{
  "title": "Prepare sprint demo",
  "description": "Collect screenshots, verify deployment, and rehearse the final walkthrough for the sprint review.",
  "assigneeId": "user_1048",
  "dueDate": "2026-08-30",
  "priority": "high"
}
```

## Example Successful Response Body
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

## Example HTTP Request
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
