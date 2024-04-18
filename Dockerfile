FROM alpine:latest

# Update package list
RUN apk update

# Install required packages
RUN apk add openjdk8-jre wget

# Download JMeter
# RUN wget -O /opt/apache-jmeter-5.6.tgz http://mirrors.ocf.berkeley.edu/apache/jmeter/binaries/apache-jmeter-5.6.tgz
RUN wget -O /opt/apache-jmeter-5.6.tgz https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-5.6.tgz

# Extract JMeter
RUN tar -xzf /opt/apache-jmeter-5.6.tgz -C /opt --strip-components=1

# Remove downloaded archive
RUN rm /opt/apache-jmeter-5.6.tgz

# Install JMeter Plugins Manager
# RUN wget -O /opt/jmeter/lib/ext/jmeter-plugins-manager.jar https://jmeter-plugins.org/get/
# RUN java -cp /opt/jmeter/lib/ext/jmeter-plugins-manager.jar org.jmeterplugins.repository.PluginManagerCMDInstaller
# RUN /opt/jmeter/bin/PluginsManagerCMD.sh install jpgc-json

# Start JMeter in non-GUI mode by default when the container starts
ENTRYPOINT ["/opt/bin/jmeter"]
CMD ["--help"]