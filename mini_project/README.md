# 📦 Folder Backup Script (Shell)

A simple and production-ready Bash script that:

- Takes backup of a source directory
- Compresses it into a timestamped `.zip` file
- Stores the backup in a destination directory
- Automatically deletes backup files older than 7 days (rotation policy)

---

## 🚀 Features

- ✅ Timestamped backup files
- ✅ Automatic destination directory creation
- ✅ 7-day automatic rotation
- ✅ Simple and clean Bash implementation
- ✅ Suitable for cron automation
- ✅ Production-style function structure

---

## 🛠️ Requirements

- Linux / Unix system
- `bash`
- `zip` utility installed

Install zip if not available:

```bash
# Ubuntu / Debian
sudo apt install zip

# RHEL / CentOS
sudo yum install zip
