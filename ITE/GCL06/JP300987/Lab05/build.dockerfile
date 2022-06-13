FROM maven:3.8.5-openjdk-17 AS build
CMD ["sh", "-c", "mvn -f /volume_in/DiscordSRV/pom.xml clean package && cp -r /volume_in/DiscordSRV/target ./volume_out && ls ./volume_out"]
