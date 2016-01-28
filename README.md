# How to use
## Prepare
### Microsoft Windows

`generate.bat`

### Apple OS X

`./generate.sh`

## Ruby

```
cd ruby
ruby server.rb
ruby client.rb
```

## Java
### Microsoft Windows

```
cd java/src
javac ThriftServer.java -cp ../lib/*;.
java -classpath ../lib/*;. ThriftServer
javac ThriftClient.java -cp ../lib/*;.
java -classpath ../lib/*;. ThriftClient
```

### Apple OS X

```
cd java/src
javac -classpath ../lib/*:. ThriftServer.java
java -classpath ../lib/*:. ThriftServer
javac -classpath ../lib/*:. ThriftClient.java
java -classpath ../lib/*:. ThriftClient
```



# Go

```
go run ./go/*.go
```
