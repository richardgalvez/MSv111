FROM eclipse-temurin:24-jdk

# Create a non-privileged user that the app will run under.
RUN useradd --create-home appuser

# Set folder for app to be located in user's home directory.
WORKDIR /home/appuser/v111

COPY . .

# Switch to the non-privileged user to run the application.
USER appuser

ENV CLASSPATH .:dist/*

CMD ["java", "-server", "-Dnet.sf.odinms.wzpath=wz/", "server.Start"]
