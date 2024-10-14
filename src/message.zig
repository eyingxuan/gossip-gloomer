fn Message(comptime body_message_type: type) type {
    return struct { src: []u8, dest: []u8, body: body_message_type };
}

const EchoProtocol = struct {
    const Request = struct { type: []u8, msg_id: u64, echo: []u8 };
    const Response = struct {
        type: []u8,
        msg_id: u64,
        in_reply_to: []u8,
        echo: []u8,
    };

    const EchoRequest = Message(Request);
    const EchoResponse = Message(Response);

    pub fn init_response(
        src: []u8,
        dest: []u8,
        msg_id: u64,
        in_reply_to: []u8,
        echo: []u8,
    ) EchoResponse {
        return .{
            .src = src,
            .dest = dest,
            .body = .{
                .type = "echo",
                .msg_id = msg_id,
                .in_reply_to = in_reply_to,
                .echo = echo,
            },
        };
    }
};
