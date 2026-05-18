
import ballerina/mcp;
import ballerina/io;

configurable string x = ?;

listener mcp:Listener mcpListener = new (9091);

@mcp:ServiceConfig {
    info: {
        name: "Calculator Service",
        version: "1.0.0"
    },
    sessionMode: mcp:STATELESS
}
service mcp:Service /mcp on mcpListener {
    @mcp:Tool
    remote function add(int a, int b) returns int {
        io:println(x);
        return a + b;
    }
}
