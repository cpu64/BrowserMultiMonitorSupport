# Browser Decode Capabilities

## Overview

This application is meant for testing the browser video decoding capabilities. It allows to choose up to 16 streams of each: 4k, 1080p, 480p, 360p videos.

The applications is packaged as a docker image, because of the video files.

It's currently using HLS for video streaming which is used for livestream replays. \<video\> tags are used for display.

## Running in Docker

```bash
docker run -it --rm -p 8000:8000 cpu64/browser-decode:latest
```

The test page will be available at:

```text
http://localhost:8000
```

### Verified Test Environment

* Operating System: Arch Linux
* Browser: Chromium
