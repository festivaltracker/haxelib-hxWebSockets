package haxe.ws.nodejs;

import haxe.io.Bytes;
#if js
import js.node.Buffer;

@:access(haxe.ws.nodejs.NodeSocket)
class NodeSocketOutput {
    private var _socket:NodeSocket;
    
    private var _buffer:Buffer = null;
    public function new(socket:NodeSocket) {
        _socket = socket;
    }
    
    public function write(data:Bytes) {
        var a = [];
        if (_buffer != null) {
            a.push(_buffer);
        }
        a.push(Buffer.hxFromBytes(data));
        _buffer = Buffer.concat(a);
    }
    
    public function flush() {
        _socket._socket.write(_buffer);
        _buffer = null;
    }
}
#end