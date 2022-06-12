FROM dotnet_deps:latest
VOLUME /build_artifacts
RUN echo 'Dockerfile running 🍉'
WORKDIR /build_artifacts
RUN pwd
ENTRYPOINT ["dotnet", "BasicNumberGuesser.dll"]
RUN ls ; dotnet run
