FROM fedora:36
WORKDIR /app
COPY . /app/

ENV CHROMIUM_VERSION 110.0
ENV XVFB_VERSION 1.20
ENV ROBOT_FRAMEWORK_VERSION 4.1
ENV FAKER_VERSION 5.0.0
ENV SELENIUM_LIBRARY_VERSION 5.1.3

RUN dnf upgrade -y --refresh \
  && dnf install -y \
    chromedriver-${CHROMIUM_VERSION}* \
    chromium-${CHROMIUM_VERSION}* \
    python3-pip \
    xorg-x11-server-Xvfb-${XVFB_VERSION}* \
  && dnf clean all

RUN mv /usr/lib64/chromium-browser/chromium-browser /usr/lib64/chromium-browser/chromium-browser-original \
  && ln -sfv /opt/robotframework/bin/chromium-browser /usr/lib64/chromium-browser/chromium-browser

RUN pip3 install \
--no-cache-dir \
robotframework==$ROBOT_FRAMEWORK_VERSION \
robotframework-faker==$FAKER_VERSION \
robotframework-seleniumlibrary==$SELENIUM_LIBRARY_VERSION

CMD ["robot", "-d", "results", "--output", "output.xml", "--report", "report.html", "--log", "log.html", "-T", "--variable", "BROWSER:headlesschrome", "/app/tests/buy_creams.robot"]