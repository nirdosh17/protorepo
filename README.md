# protorepo
This repository contains an inventory of Proto files in different folders, each folder representing a hypothetical service offered by a company.

Having a repository for Proto files separates definition and implementation, allowing us to manage changes more effectively.

GRPC server uses the generated code for a particular programming language from this repository to implement the API contract. Clients use the generated code as the interface to make RPC requests to the server using its URL.

Here is a sample server implementing `Greet` service from this repository: https://github.com/nirdosh17/grpc-go-service

# Service and proto files
Each folder represents a service. For example, there is a folder called `greet` where you will see:
- `greet.proto`: contains messages and service definitions
- `.protolangs`: contains list of languages we will be building proto files to.
- `lib`: Contains generated code for languages listed in _.protolangs_ file. The generated code is used as library by server and clients. Each language contains generated files in its own folder i.e. `lib/go`, `lib/python`
