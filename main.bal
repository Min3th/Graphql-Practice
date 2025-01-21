import ballerina/io;
import ballerina/graphql;
import ballerina/http;

public type Person record {|
    string name;
    int age;
    string city;
|};

// Service-level CORS config
@http:ServiceConfig {
    cors: {
        allowOrigins: ["*"], // Allow all origins for development
        allowMethods: ["GET", "POST", "PUT", "DELETE"],
        allowHeaders: ["Content-Type"],
        allowCredentials: false
    }
}
service /graphql on new graphql:Listener(5000) {
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
