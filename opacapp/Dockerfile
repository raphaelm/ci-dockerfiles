FROM openjdk:8-buster

MAINTAINER Raphael Michel

RUN apt-get update && apt-get install -y  wget git lib32stdc++6 lib32z1 \
	expect curl locales fdroidserver

RUN locale-gen
RUN update-locale LANG=C.UTF-8
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

# Android dependencies
RUN wget http://dl.google.com/android/android-sdk_r24.3.4-linux.tgz && \
	tar xfz android-sdk_r24.3.4-linux.tgz && rm ../../android-sdk_r24.3.4-linux.tgz
    
# Android SDK licenses
RUN mkdir /android-sdk-linux/licenses && \
    echo 8933bad161af4178b1185d1a37fbf41ea5269c55 >> /android-sdk-linux/licenses/android-sdk-license &&\
    echo d56f5187479451eabf01fb78af6dfcb131a6481e >> /android-sdk-linux/licenses/android-sdk-license &&\
    echo 24333f8a63b6825ea9c5514f83c2829b004d1fee >> /android-sdk-linux/licenses/android-sdk-license

ENV ANDROID_HOME /android-sdk-linux
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) |\
	/android-sdk-linux/tools/android update sdk --no-ui --all \
	--filter "build-tools-22.0.1,build-tools-23.0.1,build-tools-23.0.2,build-tools-23.0.3,build-tools-24.0.0,build-tools-24.0.1,build-tools-25.0.0,build-tools-25.0.2,build-tools-25.0.3,build-tools-26.0.2,build-tools-28.0.3,build-tools-29.0.2,android-27,android-23,android-24,android-25,android-28,android-29,extra-android-m2repository,extra-android-support,platform-tools,addon-google_apis-google-23,extra-google-m2repository"; 
    
# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/local/openjdk-8
RUN update-alternatives --install /usr/bin/jar jar /usr/local/openjdk-8/bin/jar 2222 && \
    update-alternatives --install /usr/bin/jarsigner jarsigner /usr/local/openjdk-8/bin/jarsigner 2222 && \
    update-alternatives --install /usr/bin/javac javac /usr/local/openjdk-8/bin/javac 2222 && \
    update-alternatives --install /usr/bin/java java /usr/local/openjdk-8/bin/java 2222 && \
    update-alternatives --install /usr/bin/javadoc javadoc /usr/local/openjdk-8/bin/javadoc 2222 && \
    update-alternatives --install /usr/bin/javap javap /usr/local/openjdk-8/bin/javap 2222 && \
    update-alternatives --install /usr/bin/jcmd jcmd /usr/local/openjdk-8/bin/jcmd 2222 && \
    update-alternatives --install /usr/bin/jdb jdb /usr/local/openjdk-8/bin/jdb 2222 && \
    update-alternatives --install /usr/bin/jinfo jinfo /usr/local/openjdk-8/bin/jinfo 2222 && \
    update-alternatives --install /usr/bin/jjs jjs /usr/local/openjdk-8/bin/jjs 2222 && \
    update-alternatives --install /usr/bin/jmap jmap /usr/local/openjdk-8/bin/jmap 2222 && \
    update-alternatives --install /usr/bin/jps jps /usr/local/openjdk-8/bin/jps 2222 && \
    update-alternatives --install /usr/bin/jrunscript jrunscript /usr/local/openjdk-8/bin/jrunscript 2222 && \
    update-alternatives --install /usr/bin/jstack jstack /usr/local/openjdk-8/bin/jstack 2222 && \
    update-alternatives --install /usr/bin/jstat jstat /usr/local/openjdk-8/bin/jstat 2222 && \
    update-alternatives --install /usr/bin/jstatd jstatd /usr/local/openjdk-8/bin/jstatd 2222 && \
    update-alternatives --install /usr/bin/keytool keytool /usr/local/openjdk-8/bin/keytool 2222 && \
    update-alternatives --install /usr/bin/rmic rmic /usr/local/openjdk-8/bin/rmic 2222 && \
    update-alternatives --install /usr/bin/rmid rmid /usr/local/openjdk-8/bin/rmid 2222 && \
    update-alternatives --install /usr/bin/rmiregistry rmiregistry /usr/local/openjdk-8/bin/rmiregistry 2222 && \
    update-alternatives --install /usr/bin/serialver serialver /usr/local/openjdk-8/bin/serialver 2222 && \
    update-alternatives --install /usr/bin/unpack200 unpack200 /usr/local/openjdk-8/bin/unpack200 2222


CMD ["/bin/bash"]
