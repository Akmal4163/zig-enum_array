pub fn EnumArray(comptime E: type, comptime T: type) type {
    const fields = @typeInfo(E).@"enum".fields;
    const length = fields.len;

    return struct {
        data: [length]T,

        pub fn init(value: T) @This() {
            return .{ .data = [_]T{value} ** length };
        }

        pub fn get(self: *const @This(), key: E) T {
            return self.data[@intFromEnum(key)];
        }

        pub fn set(self: *@This(), key: E, value: T) void {
            self.data[@intFromEnum(key)] = value;
        }

        pub fn items(self: *const @This()) []const T {
            return self.data[0..];
        }
    };
}