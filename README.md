# flava
Faker for Snowflake in Java.

Uses java-faker by DiUS: https://github.com/DiUS/java-faker

# Installation
## Install Maven
On Linux/WSL:
```
sudo apt install maven
```

## Download javafaker and dependancies
```
mvn install dependency:copy-dependencies
```

## Install and configure SnowSQL
See https://docs.snowflake.com/en/user-guide/snowsql-install-config.html

## Upload jars to your Snowflake user stage

`snowsql -q "put 'file://target/*.jar' @~; put 'file://target/dependency/*.jar' @~"`

## Create the *fake* function:

`snowsql -f fake.sql`

# Examples

### 10 Fake names in the en_US locale:
```
snowsql -q "select fake('en_US','#{Name.FullName}') as FULL_NAME from table(generator(rowcount => 10));"
```

### 20 Fake addresses in the ja_JP locale:
```
snowsql -q "select fake('ja_JP','#{Address.StreetAddress}') as STREET_ADDRESS from table(generator(rowcount => 10));"
```

# Full reference
http://dius.github.io/java-faker/apidocs/index.html
