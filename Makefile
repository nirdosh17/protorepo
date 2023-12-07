.DEFAULT_GOAL=help
SERVICE:=$(SERVICE)
LANG:=$(LANG)

ifeq ($(SERVICE),)
  $(error "SERVICE is empty!")
else ifeq ($(LANG),)
  $(error "LANG is empty!")
endif

PROTO_DIR:=$(strip $(SERVICE))
OUTPUT_DIR=${PROTO_DIR}/lib/${LANG}
PACKAGE=$(shell head -1 go.mod | awk '{print $$2}')


# Proto files are generated inside {PROTO_DIR}/lib/{LANG}

.PHONY: generate-go
generate-go: log ## Generator for Golang.
	@echo
	@echo "compiling proto files Go"
	@protoc -I${PROTO_DIR} --go_opt=module=${PACKAGE} --go_out=${OUTPUT_DIR} --go-grpc_opt=module=${PACKAGE} --go-grpc_out=${OUTPUT_DIR} ${PROTO_DIR}/*.proto

.PHONY: generate-python
generate-python: log ## Generator for Python.
	@echo
	@echo "compiling proto files Python"
	@protoc --proto_path=${PROTO_DIR} --python_out=${OUTPUT_DIR} ${PROTO_DIR}/*.proto


.PHONY: log
log:
	@echo "	LANG:  $(LANG)"
	@echo "	SERVICE: $(SERVICE)"
	@echo "	PROTODIR:  $(PROTO_DIR)"
	@echo "	OUTPUT_DIR: $(OUTPUT_DIR)"

help:
	@grep -E '^[a-zA-Z_-]+:.*?\#\# .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?\#\# "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
