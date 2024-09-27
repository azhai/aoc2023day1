#!/bin/bash

# curl -s "https://get.sdkman.io" | bash
# sdk install sbt 1.10.2
# sdk install scala 3.5.1

# rm -f ~/.sbt/boot/sbt.boot.lock
# sbt new scala-native/scala-native.g8
# > scala
# cd scala

sbt clean && sbt nativeLinkReleaseFull
\cp -f target/scala-3.5.1/native/Main ../bin/day1-sn
