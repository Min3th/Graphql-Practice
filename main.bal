import ballerina/io;
import ballerina/graphql;
import ballerina/http;

listener http:Listener httpListener = check new(4000);
listener graphql:Listener graphqlListener = check new (httpListener);

public function main() {
    io:println("Hello, World!");
}
