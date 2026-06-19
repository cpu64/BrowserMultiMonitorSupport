# Browser Multi-Monitor Support Testing

## Enable Window Management Permission

Open the site settings page for your local test server:

```text
chrome://settings/content/siteDetails?site=http%3A%2F%2Flocalhost%3A8000
```

Enable the following permission:

* **Window management** → Allow (Required for the browser to expose detailed multi-screen information.)
* **Pop-ups and redirects** → Allow (Required to open multiple windows at once.)

## API Reference

The test uses the Window Management API:

* https://developer.mozilla.org/en-US/docs/Web/API/Window/getScreenDetails

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
