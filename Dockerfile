FROM mcr.microsoft.com/dotnet/sdk:5.0 as build
WORKDIR /workdir/conversor-peso
COPY  . ./
RUN dotnet restore
RUN dotnet publish -c release -o /output --no-restore

FROM mcr.microsoft.com/dotnet/aspnet:5.0 as release
COPY --from=build /output ./

ENTRYPOINT  ["dotnet", "ConversaoPeso.Web.dll"]