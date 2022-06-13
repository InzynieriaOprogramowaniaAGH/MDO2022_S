FROM build:latest AS test
CMD ["mvn", "-f", "/volume_in/DiscordSRV/pom.xml", "test"]
