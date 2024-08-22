# Используем официальный образ .NET SDK для сборки приложения
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["ASPNETPROJECT1/ASPNETPROJECT1.csproj", "ASPNETPROJECT1/"]
RUN dotnet restore "ASPNETPROJECT1/ASPNETPROJECT1.csproj"

# Копируем остальные файлы и компилируем приложение
COPY . .
WORKDIR "/src/ASPNETPROJECT1"
RUN dotnet build "ASPNETPROJECT1.csproj" -c Release -o /app/build

# Публикуем приложение
FROM build AS publish
RUN dotnet publish "ASPNETPROJECT1.csproj" -c Release -o /app/publish

# Используем базовый образ для запуска опубликованного приложения
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "ASPNETPROJECT1.dll"]
