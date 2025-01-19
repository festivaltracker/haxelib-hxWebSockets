package haxe.ws.java;

import haxe.io.BytesBuffer;
import haxe.io.BytesOutput;
#if java
import java.nio.ByteBuffer;

@:access(haxe.ws.java.NioSocket)
class NioSocketOutput extends BytesOutput {
    public var socket:NioSocket;

    public function new(socket:NioSocket) {
        super();
        this.socket = socket;
    }

    public override function flush() {
        var buffer = ByteBuffer.wrap(getBytes().getData());
        socket.channel.write(buffer);
        buffer.clear();
        b = new BytesBuffer();
    }
}
#end