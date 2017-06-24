#!/usr/bin/env bash

launchctl unload -w /Library/LaunchDaemons/org.openobservatory.ooniprobe-agent.plist || true
launchctl load -w /Library/LaunchDaemons/org.openobservatory.ooniprobe-agent.plist
