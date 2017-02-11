FROM williamyeh/java8:latest

MAINTAINER Raphael Michel

RUN apt-get update && apt-get install -y  wget git lib32stdc++6 lib32z1 \
	expect curl locales

RUN locale-gen
RUN update-locale LANG=C.UTF-8
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

# Android dependencies
RUN wget http://dl.google.com/android/android-sdk_r24.3.4-linux.tgz && \
	tar xfz android-sdk_r24.3.4-linux.tgz && rm ../../android-sdk_r24.3.4-linux.tgz

ENV ANDROID_HOME /android-sdk-linux
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) |\
	/android-sdk-linux/tools/android update sdk --no-ui --all \
	--filter "build-tools-22.0.1,build-tools-23.0.1,build-tools-23.0.2,build-tools-23.0.3,build-tools-24.0.0,build-tools-24.0.1,build-tools-25.0.0,build-tools-25.0.2,android-22,android-23,android-24,android-25,extra-android-m2repository,extra-android-support,platform-tools,addon-google_apis-google-23,extra-google-m2repository"; 

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
