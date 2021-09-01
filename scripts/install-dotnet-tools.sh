#!/usr/bin/env bash

dotnet tool install --global dotnet-ef
dotnet add package Microsoft.EntityFrameworkCore.Design
dotnet tool install -g dotnet-reportgenerator-globaltool
