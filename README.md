# flava
Faker for Snowflake in Java. Generates fake data natively on Snowflake.

Uses java-faker by DiUS: https://github.com/DiUS/java-faker

This repo is a sequel to the [flaker](https://github.com/jamesweakley/flaker) repo. With flaker, faker runs in python on AWS API Gateway and is invoked as an External Function on Snowflake.

In this repo, we create a Java UDF which runs entirely within the Snowflake warehouse. Much easier to deploy!

# Installation

## Clone this repo
Use your favourite Git client to clone this repository on your locale machine.
## Install and configure SnowSQL
See https://docs.snowflake.com/en/user-guide/snowsql-install-config.html

## Upload jars to your Snowflake user stage

`snowsql -q "put 'file://target/*.jar' @~; put 'file://target/dependency/*.jar' @~"`

## Create the *fake* function:

`snowsql -f fake.sql`

# Examples

### 10 Fake names in the en_US locale:

`snowsql -q "select fake('en_US','#{Name.FullName}') as FULL_NAME from table(generator(rowcount => 10));"`

### 20 Fake addresses in the ja_JP locale:

`snowsql -q "select fake('ja_JP','#{Address.StreetAddress}') as STREET_ADDRESS from table(generator(rowcount => 10));"`

# Full reference
Here's all the things you can generate:

http://dius.github.io/java-faker/apidocs/index.html

# Downloading libraries from maven
I committed the dependencies to this repo to avoid the hassle of doing this. But if you prefer, here's how you can do it from scratch.
## Install a Java runtime environment
On Linux/WSL:

`sudo apt install default-jre-headless`

## Install Maven
On Linux/WSL:

`sudo apt install maven`

## Download javafaker and dependancies

`mvn install dependency:copy-dependencies`