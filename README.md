# How to use

## Prepare
`generate.bat`

## Ruby
cd ruby
ruby server.rb
ruby client.rb

## Java
cd java\src
javac ThriftServer.java -cp ..\lib\*;.
java -classpath ..\lib\*;. ThriftServer
javac ThriftClient.java -cp ..\lib\*;.
java -classpath ..\lib\*;. ThriftClient

# Go