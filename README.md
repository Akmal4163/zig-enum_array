# zig-enum_array
Enumerated Arrays in Zig, for utility purposes

Usage

```zig
const std = @import("std");
const e = @import("enum_array.zig");

const color = enum {Red, Green, Blue};

pub fn main() !void {
    var colors = e.EnumArray(color, u8).init(0);
    colors.set(.Red, 255);
    colors.set(.Green, 0);
    colors.set(.Blue, 0);
    
    std.debug.print("Green = {}\n", .{colors.get(.Green)});
    std.debug.print("Red = {}\n", .{colors.get(.Red)});
    std.debug.print("Blue = {}\n", .{colors.get(.Blue)});
    std.debug.print("items: {any}\n", .{colors.items()});

}
```
