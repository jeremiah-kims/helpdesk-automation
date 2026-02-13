# Helpdesk Ticket Monitor (PowerShell)

Automates helpdesk monitoring by polling a ticketing system API and triggering instant desktop alerts when new tickets appear.

Built to reduce response time, eliminate constant inbox checking, and ensure critical incidents are never missed.

---

## 🚀 Features

* Periodically checks helpdesk API for new tickets
* Detects newly created incidents since last scan
* Sends immediate on-screen alerts
* Configurable polling interval
* Lightweight — runs in background with minimal resources

---

## 🧰 Use Cases

* SOC analysts monitoring incident queues
* IT support teams tracking incoming tickets
* Homelab automation projects
* Anyone tired of refreshing their helpdesk dashboard

---

## ⚙️ Requirements

* Windows with PowerShell 5.1+ or PowerShell 7+
* API access to your helpdesk/ticketing system
* Network access to the API endpoint

---

## 🔧 Configuration

Edit the script variables:

```powershell
$ApiUrl = "https://your-helpdesk/api/tickets"
$ApiKey = "YOUR_API_KEY"
$PollInterval = 60   # seconds
```

You may also customize:

* alert text
* sound notifications
* filtering rules
* ticket priority triggers

---

## ▶️ Usage

Run the script:

```powershell
.\ticket-monitor.ps1
```

The script will:

1. Query the API
2. Compare against previously seen tickets
3. Alert you if a new ticket appears
4. Wait for the next polling cycle

---

## 🔒 Security Notes

* Do not commit API keys to GitHub
* Use environment variables or local config files
* Consider storing credentials securely with Windows Credential Manager

---

## 🧠 What I Built This For

This script was created to automate ticket awareness and improve response times in IT environments where new incidents require quick attention.

It’s part of my broader focus on automation, monitoring, and operational efficiency.

---

## 📜 License

MIT License — free to use, modify, and adapt.

---

## 🙌 Contributions

Feel free to fork, improve, or adapt this script for your own environment.
