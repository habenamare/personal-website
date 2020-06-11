PROJECT_NAME := "personal-website"
OUTPUT_DIR := "public"

.PHONY: build clean

build:
	@echo 'Building' ${PROJECT_NAME}
	@hugo

clean:
	@rm -rf ${OUTPUT_DIR}
