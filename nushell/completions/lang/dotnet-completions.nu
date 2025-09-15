# Written by graefchen
# based on: Dotnet 8.0.403
# link: https://github.com/dotnet/dotnet

# TODO: Finish

# Add a package or reference to a .NET project.
export extern "dotnet add" []

# Build a .NET project.
export extern "dotnet build" []

# Interact with servers started by a build.
export extern "dotnet build-server" []

# Clean build outputs of a .NET project.
export extern "dotnet clean" []

# Apply style preferences to a project or solution.
export extern "dotnet format" []

# Show command line help.
export extern "dotnet help" []

# List project references of a .NET project.
export extern "dotnet list" []

# Run Microsoft Build Engine (MSBuild) commands.
export extern "dotnet msbuild" []

# Create a new .NET project or file.
export extern "dotnet new" []

# Provides additional NuGet commands.
export extern "dotnet nuget" []

# Create a NuGet package.
export extern "dotnet pack" []

# Publish a .NET project for deployment.
export extern "dotnet publish" []

# Remove a package or reference from a .NET project.
export extern "dotnet remove" []

# Restore dependencies specified in a .NET project.
export extern "dotnet restore" []

# Build and run a .NET project output.
export extern "dotnet run" []

# Manage .NET SDK installation.
export extern "dotnet sdk" []

# Modify Visual Studio solution files.
export extern "dotnet sln" []

# Store the specified assemblies in the runtime package store.
export extern "dotnet store" []

# Run unit tests using the test runner specified in a .NET project.
export extern "dotnet test" []

# Install or manage tools that extend the .NET experience.
export extern "dotnet tool" []

# Run Microsoft Test Engine (VSTest) commands.
export extern "dotnet vstest" []

# Manage optional workloads.
export extern "dotnet workload" []

# Create and manage development certificates.
export extern "dotnet dev-certs" []

# Start F# Interactive / execute F# scripts.
export extern "dotnet fsi" []

# Manage JSON Web Tokens in development.
export extern "dotnet user-jwts" []

# Manage development user secrets.
export extern "dotnet user-secrets" []

# Start a file watcher that runs a command when files change.
export extern "dotnet watch" []

export extern "dotnet" [
	--additionalprobingpath: path # Path containing probing policy and assemblies to probe for.
	--additional-deps: path       # Path to additional deps.json file.
	--depsfile                    # Path to <application>.deps.json file.
	--fx-version: string          # Version of the installed Shared Framework to use to run the application.
	--roll-forward: string        # Roll forward to framework version  (LatestPatch, Minor, LatestMinor, Major, LatestMajor, Disable).
	--runtimeconfig               # Path to <application>.runtimeconfig.json file.
	--diagnostics(-d)             # Enable diagnostic output.
	--help(-h)                    # Display help.
	--info                        # Display .NET information.
	--list-runtimes               # Display the installed runtimes.
	--list-sdks                   # Display the installed SDKs.
	--version                     # Display .NET SDK version in use.
]
