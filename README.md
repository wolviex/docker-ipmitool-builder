# Docker IPMI tool build

Docker Image with pre-set environment for building IPMI tool.

## Environment variables

* `GIT_CHECKOUT` - checkout IPMI tool from sf.net git. Any value means `true`.

## Usage

Run `% make;` to build Docker Image.

Run `% make run;` to run Docker Container.

## Volumes

* `/build` - is where build can be grabbed
* `/ipmitool-source` - where you can mount checked out IPMI tool source
* `/patches` - is meant for exchanging files with the Host
