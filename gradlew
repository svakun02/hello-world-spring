#!/bin/sh
set -eu
VERSION='9.8.2'
SHA256='21bd5da2de49b642904077f38c0efdc7778e92b3ed0889392dca61b97e389607'
BASE="${GRADLE_USER_HOME:-$HOME/.gradle}/hello-world-distributions"
GRADLE_HOME="$BASE/gradle-$VERSION"

if [ ! -x "$GRADLE_HOME/bin/gradle" ]; then
    mkdir -p "$BASE"
    ARCHIVE="$BASE/gradle-$VERSION-bin.zip"
    URL="https://services.gradle.org/distributions/gradle-$VERSION-bin.zip"
    if command -v curl >/dev/null 2>&1; then
        curl --fail --location --output "$ARCHIVE" "$URL"
    elif command -v wget >/dev/null 2>&1; then
        wget -O "$ARCHIVE" "$URL"
    else
        echo 'Install curl or wget to download Gradle.' >&2
        exit 1
    fi
    if command -v sha256sum >/dev/null 2>&1; then
        echo "$SHA256  $ARCHIVE" | sha256sum -c -
    elif command -v shasum >/dev/null 2>&1; then
        echo "$SHA256  $ARCHIVE" | shasum -a 256 -c -
    else
        echo 'SHA-256 checksum tool is required.' >&2
        exit 1
    fi
    unzip -q "$ARCHIVE" -d "$BASE"
    rm -f "$ARCHIVE"
fi
exec "$GRADLE_HOME/bin/gradle" "$@"
