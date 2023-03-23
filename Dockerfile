FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build-env
WORKDIR /source

# install nodejs v16
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs

# Copy everything
COPY . ./
# Restore as distinct layers
RUN dotnet restore
# Build and publish a release
RUN dotnet publish -c Release -o /app --no-restore ./src/web/TailwindCssAspNetCore.Web.csproj

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app
COPY --from=build-env /app .
ENTRYPOINT ["/app/TailwindCssAspNetCore.Web"]
