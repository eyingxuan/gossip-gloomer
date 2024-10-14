const std = @import("std");
const message = @import("./message.zig");

const debug = std.debug;
const io = std.io;

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    const stdin = std.io.getStdIn().reader();
    var buffer = std.ArrayList(u8).init(allocator);
    while (true) {
        try stdin.streamUntilDelimiter(buffer.writer(), '\n', null);

        buffer.clearAndFree();
    }
}
