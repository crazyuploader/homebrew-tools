# Crazyuploader Tools

Homebrew tap for crazyuploader's CLI tools.

## Available Tools

- **watchdog** - Lightweight monitoring framework for services with Apprise notifications
- **rclone_exporter** - Prometheus exporter for rclone

## Installation

### Install a specific cask

```
brew install crazyuploader/tools/<cask-name>
```

For example:
```
brew install crazyuploader/tools/watchdog
brew install crazyuploader/tools/rclone_exporter
```

### Tap first, then install

```
brew tap crazyuploader/tools
brew install watchdog
brew install rclone_exporter
```

### Using a Brewfile

Add to your `Brewfile`:

```
tap "crazyuploader/tools"
cask "watchdog"
cask "rclone_exporter"
```

Then run:
```
brew bundle
```

## Updating

To update to the latest version:

```
brew update
brew upgrade watchdog
brew upgrade rclone_exporter
```

## Uninstalling

```
brew uninstall watchdog
brew uninstall rclone_exporter
```

## Documentation

For general Homebrew help:
- `brew help`
- `man brew`
- [Homebrew's documentation](https://docs.brew.sh)
