# GStreamerSwift

## Initial setup

1. Install GStreamer framework system wide GStreamer binary installer can be found at:
- https://gstreamer.freedesktop.org/download/#ios
- 설치 확인 
```bash
(base) ➜  ~ gst-inspect-1.0 --version
gst-inspect-1.0 version 1.26.0
GStreamer 1.26.0
https://github.com/Homebrew/homebrew-core
```
- 설치 경로
```
~/Library/Developer/GStreamer/iPhone.sdk
```
- 구조
```bash
(base) ➜  ~ ls ~/Library/Developer/GStreamer/iPhone.sdk
GStreamer.framework Templates
(base) ➜  ~ ls ~/Library/Developer/GStreamer/iPhone.sdk/GStreamer.framework
Commands  GStreamer Headers   Libraries Resources Versions
```

- 설치 오류 (링크 참고: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/396 )

2. Xcode Build Settings
- Header Search Path: `"$(HOME)/Library/Developer/GStreamer/iPhone.sdk/GStreamer.framework/Headers"`
- Framework search path: `"$(HOME)/Library/Developer/GStreamer/iPhone.sdk"`
- Other Linker Flags: `-lresolv` and `-lc++`
