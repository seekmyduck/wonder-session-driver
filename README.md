# Wonder Session — Virtual Audio Drivers

4 virtual audio loopback drivers for macOS, built for the [Wonder Session](https://wondersession.com) platform.

## Drivers

| Driver | Description |
|--------|-------------|
| **WS - DAW to Talent** | Send audio from your DAW to the Talent |
| **WS - DAW to Conf** | Send audio from your DAW to the Conference |
| **WS - Conf to DAW** | Send audio from the Conference to your DAW |
| **WS - Talent to DAW** | Send audio from the Talent to your DAW |

## Requirements

- macOS 10.14 or later
- Apple Silicon (arm64) and Intel (x86_64) supported

## Installation

Download the latest `WonderSessionDriver.pkg` from [Releases](https://github.com/seekmyduck/wonder-session-driver/releases) and run the installer.

No restart required — drivers are active immediately.

## Build from source

```bash
git clone https://github.com/seekmyduck/wonder-session-driver.git
cd wonder-session-driver
make all
```

## License

This project is based on [BlackHole](https://github.com/ExistentialAudio/BlackHole) by Existential Audio Inc., licensed under GPL-3.0.

Wonder Session drivers are distributed under the same [GPL-3.0 license](LICENSE).

## Credits

- [BlackHole](https://github.com/ExistentialAudio/BlackHole) — Existential Audio Inc.
- Wonder Session — [Wonder Studio](https://wondersession.com)
