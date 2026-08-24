# Backup Verification

## Backup completion
The backup script creates a compressed dump in the backups folder.

```bash
bash backups/backup_script.sh
```

## Restore test
A sandbox database can be used to validate the backup.

```bash
bash backups/restore_commands.sh
```

## Evidence checklist
- backup artifact created with timestamp
- restore completed without errors
- data verified after restore
- smoke test executed on the restored database
