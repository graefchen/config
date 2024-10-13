# Written by graefchen
# based on: go1.22.5
# link: https://go.dev

# TODO: Finish

# start a bug report
export extern "go bug" []

# compile packages and dependencies
export extern "go build" []

# remove object files and cached files
export extern "go clean" []

# show documentation for package or symbol
export extern "go doc" []

# print Go environment information
export extern "go env" []

# update packages to use new APIs
export extern "go fix" []

# gofmt (reformat) package sources
export extern "go fmt" []

# generate Go files by processing source
export extern "go generate" []

# add dependencies to current module and install them
export extern "go get" []

# compile and install packages and dependencies      
export extern "go install" []

# list packages or modules
export extern "go list" []

# module maintenance
export extern "go mod" []

# workspace maintenance
export extern "go work" []

# compile and run Go program
export extern "go run" []

# test packages
export extern "go test" []

# run specified go tool
export extern "go tool" []

# print Go version
export extern "go version " []

# report likely mistakes in packages
export extern "go vet" []

def "nu-complete go help" [] {
	[
		{ value: "bug ", description: "start a bug report" },
		{ value: "build", description: "compile packages and dependencies" },
		{ value: "clean", description: "remove object files and cached files" },
		{ value: "doc", description: "show documentation for package or symbol" },
		{ value: "env", description: "print Go environment information" },
		{ value: "fix", description: "update packages to use new APIs" },
		{ value: "fmt", description: "gofmt (reformat) package sources" },
		{ value: "generate", description: "generate Go files by processing source" },
		{ value: "get", description: "add dependencies to current module and install them" },
		{ value: "install", description: "compile and install packages and dependencies" },
		{ value: "list", description: "list packages or modules" },
		{ value: "mod", description: "module maintenance" },
		{ value: "work", description: "workspace maintenance" },
		{ value: "run", description: "compile and run Go program" },
		{ value: "test", description: "test packages" },
		{ value: "tool", description: "run specified go tool" },
		{ value: "version ", description: "print Go version" },
		{ value: "vet", description: "report likely mistakes in packages" },
		{ value: "buildconstraint", decription:"build constraints" },
		{ value: "buildmode", decription:"build modes" },
		{ value: "c", decription:"calling between Go and C" },
		{ value: "cache", decription:"build and test caching" },
		{ value: "environment", decription:"environment variables" },
		{ value: "filetype", decription:"file types" },
		{ value: "go.mod", decription:"the go.mod file" },
		{ value: "gopath", decription:"GOPATH environment variable" },
		{ value: "goproxy", decription:"module proxy protocol" },
		{ value: "importpath", decription:"import path syntax" },
		{ value: "modules", decription:"modules, module versions, and more" },
		{ value: "module-auth", decription:"module authentication using go.sum" },
		{ value: "packages", decription:"package lists and patterns" },
		{ value: "private", decription:"configuration for downloading non-public code" },
		{ value: "testflag", decription:"testing flags" },
		{ value: "testfunc", decription:"testing functions" },
		{ value: "vcs", decription:"controlling version control with GOVCS" },
	]
}

# get more information about a command/topic.
export extern "go help" [
	...command: string@"nu-complete go help"
]

# Go is a tool for managing Go source code.
export extern "go" []
