# protorepo
This repository contains inventory of Proto files in different folders, each folder representing a hypothetical service offered by a company.
Having a repository for Proto files separates definition and implementation which allows us to manage changes more effectively.

GRPC server use the generate code for a particular programming language from this repository to implement the API contract and clients use the generated code as the interface to make RPC request to the server using its URL.

# Service and proto files
Each folder represents a service. For example, there is a folder called `greet` where you will see:
- `greet.proto`: contains messages and service definitions
- `.protolangs`: contains list of languages we will be building proto files to.
- `lib`: Contains generated code for languages listed in _.protolangs_ file. The generated code is used as library by server and clients. Each language contains generated files in its own folder i.e. `lib/go`, `lib/python`
