# MongoDB Design for CampusLearn

## What data is stored
MongoDB stores user activity events, content engagement metrics, and learning logs. Examples include:
- login events
- course engagement events
- assessment submission history
- notification events
- telemetry and error documents

## Why MongoDB was selected
MongoDB is schema-flexible and suitable for event-based data that varies in shape. This helps accommodate growth without requiring repeated ALTER TABLE changes in the relational schema.

## Alternative relational approach
The same activity stream could be stored in PostgreSQL JSONB columns, but high-frequency event ingestion and flexible event types are a better natural match for MongoDB.

## Example document
```json
{
  "student_id": "cccccccc-cccc-cccc-cccc-cccccccccccc",
  "course_id": "33333333-3333-3333-3333-333333333333",
  "event_type": "lesson_view",
  "event_timestamp": "2026-08-19T12:45:00Z",
  "metadata": {
    "module_id": "66666666-6666-6666-6666-666666666666",
    "duration_seconds": 420,
    "device": "desktop"
  }
}
```
