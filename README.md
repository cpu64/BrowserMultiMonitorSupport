# Browser Multi-Window Shared State and Event Testing

## Overview

This test application demonstrates communication and state synchronization between multiple browser windows running on the same origin.

The application consists of:

* A controller window that can open additional chat windows.
* Multiple chat windows that share the same message history.
* Real-time event propagation between windows.

## BroadcastChannel API

The application uses the BroadcastChannel API for real-time communication between browser windows.
All windows subscribe to the same channel and broadcast update events whenever shared state changes.

## localStorage

The chat history is stored in `localStorage`, which acts as a shared state store accessible by all windows on the same origin.

## Enable Window Management Permission

Open the site settings page for your local test server:

```text
chrome://settings/content/siteDetails?site=http%3A%2F%2Flocalhost%3A8000
```

Enable the following permission:

* **Window management** → Allow

This permission is required for the browser to expose detailed multi-screen information.

## Running a Local Test Server

From the directory containing the test page:

```bash
python -m http.server 8000
```

The test page will be available at:

```text
http://localhost:8000
```

### Verified Test Environment

* Operating System: Arch Linux
* Browser: Chromium
