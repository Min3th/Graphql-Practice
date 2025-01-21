import ballerina/io;
import ballerina/graphql;
import ballerina/http;

listener http:Listener httpListener = check new(4000);
listener graphql:Listener graphqlListener = check new (httpListener);

public type Person record {|
    string name;
    int age;
    string city;
|};

service /graphql on new graphql:Listener(4000) {
    private Person profile;

    function init() {
        self.profile = { name: "Walter De Silva", age: 50, city: "Canberra"};
    }

    resource function get profile() returns Person {
        return self.profile;
    }

    remote function updateName(string name) returns Person {
        self.profile.name = name;
        return self.profile;
    }

    remote function updateCity(string city) returns Person {
        self.profile.city = city;
        return self.profile;
    }

}
public function main() {
    io:println("Hello, World!");
}
