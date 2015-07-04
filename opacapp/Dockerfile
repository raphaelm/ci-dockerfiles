FROM debian:jessie

MAINTAINER Raphael Michel

RUN apt-get update && apt-get install -y  wget openjdk-7-jdk git lib32stdc++6 lib32z1 expect

# Android dependencies
RUN wget http://dl.google.com/android/android-sdk_r24.3.3-linux.tgz && \
	tar xfz android-sdk_r24.3.3-linux.tgz && rm ../../android-sdk_r24.3.3-linux.tgz

ENV ANDROID_HOME /android-sdk-linux
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) |\
	/android-sdk-linux/tools/android update sdk --no-ui --all --filter "build-tools-22.0.1,android-22,extra-android-m2repository,extra-android-support,platform-tools"; 

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
