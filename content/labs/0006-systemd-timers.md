---
layout: lab
title: Timers
permalink: /lab/systemd/timers/
module: Systemd
---

Container Linux uses systemd timers to schedule tasks. This is comparable to a crontab job.

List all *enabled* timers on the system.

```
sudo systemctl list-timers --all
```

Create a new timer by creating an alternative for this crontab job: `*/10 * * * * /usr/bin/date >> /tmp/date`.

Create the systemd service unit.

```
sudo bash -c "cat > /etc/systemd/system/date.service" <<EOF
[Unit]
Description=Prints date into /tmp/date file

[Service]
Type=oneshot
ExecStart=/usr/bin/sh -c '/usr/bin/date >> /tmp/date'
EOF
```

Now create the timer unit that will run this job every 10 minutes.

```
sudo bash -c "cat > /etc/systemd/system/date.timer" <<EOF
[Unit]
Description=Run date.service every 10 minutes

[Timer]
OnCalendar=*:0/10
EOF
```

Start the timer.

```
sudo systemctl start date.timer
```

List all timers. The job should trigger in 10 minutes.

```
sudo systemctl list-timers --all
```
