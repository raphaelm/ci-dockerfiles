FROM ubuntu:20.04

MAINTAINER Raphael Michel

ENV DEBIAN_FRONTEND="noninteractive" TZ="Europe/Berlin"

# fdroidserver package needs its docs to work.
RUN echo "path-include=/usr/share/doc/fdroidserver/*" > /etc/dpkg/dpkg.cfg.d/excludes

# install packages
RUN apt-get update && apt-get install -y  wget git lib32stdc++6 lib32z1 \
	expect curl locales openjdk-8-jdk-headless unzip && apt-get install -y fdroidserver

RUN locale-gen
RUN update-locale LANG=C.UTF-8
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

RUN update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java

# Android dependencies
RUN wget https://dl.google.com/android/repository/commandlinetools-linux-6609375_latest.zip && \
    mkdir /android-sdk-linux && \
    mkdir /android-sdk-linux/cmdline-tools && \
	unzip commandlinetools-linux-6609375_latest.zip -d /android-sdk-linux/cmdline-tools && \
    rm commandlinetools-linux-6609375_latest.zip
    
# Android SDK licenses
RUN mkdir /android-sdk-linux/licenses && \
    echo 8933bad161af4178b1185d1a37fbf41ea5269c55 >> /android-sdk-linux/licenses/android-sdk-license &&\
    echo d56f5187479451eabf01fb78af6dfcb131a6481e >> /android-sdk-linux/licenses/android-sdk-license &&\
    echo 24333f8a63b6825ea9c5514f83c2829b004d1fee >> /android-sdk-linux/licenses/android-sdk-license

COPY android-packages.txt /tmp/
ENV ANDROID_SDK_ROOT /android-sdk-linux
ENV PATH ${ANDROID_SDK_ROOT}/build-tools/29.0.2/:${PATH}:${ANDROID_SDK_ROOT}/cmdline-tools/tools/bin:${ANDROID_SDK_ROOT}/platform-tools:${ANDROID_SDK_ROOT}/emulator
RUN sdkmanager --install  --package_file=/tmp/android-packages.txt && \
    rm /tmp/android-packages.txt
    
# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
