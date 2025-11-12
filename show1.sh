~/hackathon2/godel_graph$ env | grep GODEL_
GODEL_GRAPH_SG_CONTAINER=sourcegraph
GODEL_GRAPH_ANCHOR_LLM_ENABLED=true
GODEL_GRAPH_SCIP_CONCURRENCY=2
GODEL_GRAPH_REPOS_ROOT=*****/hackathon2/test/godel_repos
GODEL_GRAPH_SG_SERVE_PORT=3434
GODEL_GRAPH_SG_SERVE_HOST=localhost
GODEL_GRAPH_SCIP_ENABLED=true
GODEL_GRAPH_SG_URL=http://localhost:7080
GODEL_GRAPH_ANCHOR_LLM_TOKEN=*****
GODEL_GRAPH_ANCHOR_LLM_TIMEOUT=20000
GODEL_GRAPH_NODE_ENV=development
GODEL_GRAPH_SG_TOKEN=sgp_local_7b26d316c22c7c9456684da7da06c62d65916ff0
GODEL_GRAPH_ANCHOR_LLM_MODEL=gpt-4o-mini
GODEL_GRAPH_LOG_LEVEL=info
GODEL_GRAPH_ANCHOR_LLM_ENDPOINT=https://api.openai.com/v1/chat/completions
GODEL_GRAPH_SCIP_MAX_AGE_HOURS=168
GODEL_GRAPH_PORT=8088
GODEL_GRAPH_ANCHOR_LLM_PROVIDER=openai
GODEL_GRAPH_ANCHOR_LLM_MAX_PROPOSALS=25
~/hackathon2/godel_graph$ curl -s -X POST http://localhost:8088/oracle/gather     -H 'content-type: application/json'     -d '{"question":"how does WebSocketServer handle ping/pong?","repoHint":"foo"}' | jq
{
  "snippets": [
    {
      "id": "3d3956c2b8",
      "repo": "foo",
      "path": "lib/sender.js",
      "commit": "dabdd5b3018dd05792627a53517dfdb58ae19824",
      "lineStart": 214,
      "lineEnd": 254,
      "text": "      opcode: 0x08,\n      readOnly: false,\n      rsv1: false\n    };\n\n    if (this._state !== DEFAULT) {\n      this.enqueue([this.dispatch, buf, false, options, cb]);\n    } else {\n      this.sendFrame(Sender.frame(buf, options), cb);\n    }\n  }\n\n  /**\n   * Sends a ping message to the other peer.\n   *\n   * @param {*} data The message to send\n   * @param {Boolean} [mask=false] Specifies whether or not to mask `data`\n   * @param {Function} [cb] Callback\n   * @public\n   */\n  ping(data, mask, cb) {\n    let byteLength;\n    let readOnly;\n\n    if (typeof data === 'string') {\n      byteLength = Buffer.byteLength(data);\n      readOnly = false;\n    } else if (isBlob(data)) {\n      byteLength = data.size;\n      readOnly = false;\n    } else {\n      data = toBuffer(data);\n      byteLength = data.length;\n      readOnly = toBuffer.readOnly;\n    }\n\n    if (byteLength > 125) {\n      throw new RangeError('The data size must not be greater than 125 bytes');\n    }\n\n    const options = {",
      "why": "definition",
      "source": {
        "hopId": "resolve_and_lookup:ping:495da63c",
        "from": "definition"                                                                                                                                                                       
      },                                                                                                                                                                                           
      "score": 5,                                                                                                                                                                                  
      "provenance": {                                                                                                                                                                              
        "hopId": "resolve_and_lookup:ping:495da63c",                                                                                                                                               
        "sgQuery": "repo:foo \"ping\"",                                                                                                                                                            
        "policy": {                                                                                                                                                                                
          "caseInsensitive": false,                                                                                                                                                                
          "patternType": "regexp"                                                                                                                                                                  
        },                                                                                                                                                                                         
        "limits": {                                                                                                                                                                                
          "maxRefsPerSymbol": 15                                                                                                                                                                   
        }                                                                                                                                                                                          
      },
      "links": {
        "sgBlob": "http://sourcegraph:7080/foo@dabdd5b3018dd05792627a53517dfdb58ae19824/-/blob/lib/sender.js#L214-254"
      },
      "breadcrumb": {
        "repo": "foo",
        "commitShort": "dabdd5b",
        "pathSegments": [
          "lib",
          "sender.js"
        ],
        "rangeLabel": "L214–L254",
        "symbol": "ping",
        "whyLabel": "definition"
      }
    },
    {
      "id": "ccc19e40e6",
      "repo": "foo",
      "path": "lib/sender.js",
      "commit": "dabdd5b3018dd05792627a53517dfdb58ae19824",
      "lineStart": 266,
      "lineEnd": 306,
      "text": "      if (this._state !== DEFAULT) {\n        this.enqueue([this.getBlobData, data, false, options, cb]);\n      } else {\n        this.getBlobData(data, false, options, cb);\n      }\n    } else if (this._state !== DEFAULT) {\n      this.enqueue([this.dispatch, data, false, options, cb]);\n    } else {\n      this.sendFrame(Sender.frame(data, options), cb);\n    }\n  }\n\n  /**\n   * Sends a pong message to the other peer.\n   *\n   * @param {*} data The message to send\n   * @param {Boolean} [mask=false] Specifies whether or not to mask `data`\n   * @param {Function} [cb] Callback\n   * @public\n   */\n  pong(data, mask, cb) {\n    let byteLength;\n    let readOnly;\n\n    if (typeof data === 'string') {\n      byteLength = Buffer.byteLength(data);\n      readOnly = false;\n    } else if (isBlob(data)) {\n      byteLength = data.size;\n      readOnly = false;\n    } else {\n      data = toBuffer(data);\n      byteLength = data.length;\n      readOnly = toBuffer.readOnly;\n    }\n\n    if (byteLength > 125) {\n      throw new RangeError('The data size must not be greater than 125 bytes');\n    }\n\n    const options = {",               
      "why": "definition",
      "source": {
        "hopId": "resolve_and_lookup:pong:9573eb3d",
        "from": "definition"
      },
      "score": 5,
      "provenance": {
        "hopId": "resolve_and_lookup:pong:9573eb3d",
        "sgQuery": "repo:foo \"pong\"",
        "policy": {
          "caseInsensitive": false,
          "patternType": "regexp"
        },
        "limits": {
          "maxRefsPerSymbol": 15
        }
      },
      "links": {
        "sgBlob": "http://sourcegraph:7080/foo@dabdd5b3018dd05792627a53517dfdb58ae19824/-/blob/lib/sender.js#L266-306"
      },
      "breadcrumb": {
        "repo": "foo",
        "commitShort": "dabdd5b",
        "pathSegments": [
          "lib",
          "sender.js"
        ],
        "rangeLabel": "L266–L306",
        "symbol": "pong",
        "whyLabel": "definition"
      }
    },
    {
      "id": "5f4873dc9b",
      "repo": "foo",
      "path": "lib/websocket-server.js",
      "commit": "dabdd5b3018dd05792627a53517dfdb58ae19824",
      "lineStart": 7,
      "lineEnd": 47,
      "text": "const { Duplex } = require('stream');\nconst { createHash } = require('crypto');\n\nconst extension = require('./extension');\nconst PerMessageDeflate = require('./permessage-deflate');\nconst subprotocol = require('./subprotocol');\nconst WebSocket = require('./websocket');\nconst { GUID, kWebSocket } = require('./constants');\n\nconst keyRegex = /^[+/0-9A-Za-z]{22}==$/;\n\nconst RUNNING = 0;\nconst CLOSING = 1;\nconst CLOSED = 2;\n\n/**\n * Class representing a WebSocket server.\n *\n * @extends EventEmitter\n */\nclass WebSocketServer extends EventEmitter {\n  /**\n   * Create a `WebSocketServer` instance.\n   *\n   * @param {Object} options Configuration options\n   * @param {Boolean} [options.allowSynchronousEvents=true] Specifies whether\n   *     any of the `'message'`, `'ping'`, and `'pong'` events can be emitted\n   *     multiple times in the same tick\n   * @param {Boolean} [options.autoPong=true] Specifies whether or not to\n   *     automatically send a pong in response to a ping\n   * @param {Number} [options.backlog=511] The maximum length of the queue of\n   *     pending connections\n   * @param {Boolean} [options.clientTracking=true] Specifies whether or not to\n   *     track clients\n   * @param {Function} [options.handleProtocols] A hook to handle protocols\n   * @param {String} [options.host] The hostname where to bind the server\n   * @param {Number} [options.maxPayload=104857600] The maximum allowed message\n   *     size\n   * @param {Boolean} [options.noServer=false] Enable no server mode\n   * @param {String} [options.path] Accept only connections matching this path\n   * @param {(Boolean|Object)} [options.perMessageDeflate=false] Enable/disable",                                      
      "why": "definition",
      "source": {
        "hopId": "resolve_and_lookup:WebSocketServer:10d2c70b",
        "from": "definition"
      },
      "score": 5,
      "provenance": {
        "hopId": "resolve_and_lookup:WebSocketServer:10d2c70b",
        "sgQuery": "repo:foo \"WebSocketServer\"",
        "policy": {
          "caseInsensitive": false,
          "patternType": "regexp"
        },
        "limits": {
          "maxRefsPerSymbol": 15
        }
      },
      "links": {
        "sgBlob": "http://sourcegraph:7080/foo@dabdd5b3018dd05792627a53517dfdb58ae19824/-/blob/lib/websocket-server.js#L7-47"
      },
      "breadcrumb": {
        "repo": "foo",
        "commitShort": "dabdd5b",
        "pathSegments": [
          "lib",
          "websocket-server.js"
        ],
        "rangeLabel": "L7–L47",
        "symbol": "WebSocketServer",
        "whyLabel": "definition"
      }
    },
    {
      "id": "9e562d7c78",
      "repo": "foo",
      "path": "lib/websocket-server.js",
      "commit": "dabdd5b3018dd05792627a53517dfdb58ae19824",
      "lineStart": 422,
      "lineEnd": 462,
      "text": "      allowSynchronousEvents: this.options.allowSynchronousEvents,\n      maxPayload: this.options.maxPayload,\n      skipUTF8Validation: this.options.skipUTF8Validation\n    });\n\n    if (this.clients) {\n      this.clients.add(ws);\n      ws.on('close', () => {\n        this.clients.delete(ws);\n\n        if (this._shouldEmitClose && !this.clients.size) {\n          process.nextTick(emitClose, this);\n        }\n      });\n    }\n\n    cb(ws, req);\n  }\n}\n\nmodule.exports = WebSocketServer;\n\n/**\n * Add event listeners on an `EventEmitter` using a map of <event, listener>\n * pairs.\n *\n * @param {EventEmitter} server The event emitter\n * @param {Object.<String, Function>} map The listeners to add\n * @return {Function} A function that will remove the added listeners when\n *     called\n * @private\n */\nfunction addListeners(server, map) {\n  for (const event of Object.keys(map)) server.on(event, map[event]);\n\n  return function removeListeners() {\n    for (const event of Object.keys(map)) {\n      server.removeListener(event, map[event]);\n    }\n  };\n}",                                                                     
      "why": "reference",
      "source": {
        "hopId": "resolve_and_lookup:WebSocketServer:10d2c70b",
        "from": "reference"
      },
      "score": 4,
      "provenance": {
        "hopId": "resolve_and_lookup:WebSocketServer:10d2c70b",
        "sgQuery": "repo:foo \"WebSocketServer\"",
        "policy": {
          "caseInsensitive": false,
          "patternType": "regexp"
        },
        "limits": {
          "maxRefsPerSymbol": 15
        }
      },
      "links": {
        "sgBlob": "http://sourcegraph:7080/foo@dabdd5b3018dd05792627a53517dfdb58ae19824/-/blob/lib/websocket-server.js#L422-462"
      },
      "breadcrumb": {
        "repo": "foo",
        "commitShort": "dabdd5b",
        "pathSegments": [
          "lib",
          "websocket-server.js"
        ],
        "rangeLabel": "L422–L462",
        "symbol": "WebSocketServer",
        "whyLabel": "reference"
      }
    },
    {
      "id": "a7a481fc33",
      "repo": "foo",
      "path": "lib/websocket.js",
      "commit": "dabdd5b3018dd05792627a53517dfdb58ae19824",
      "lineStart": 361,
      "lineEnd": 401,
      "text": "    if (this.readyState === WebSocket.CONNECTING) {\n      throw new Error('WebSocket is not open: readyState 0 (CONNECTING)');\n    }\n\n    if (typeof data === 'function') {\n      cb = data;\n      data = mask = undefined;\n    } else if (typeof mask === 'function') {\n      cb = mask;\n      mask = undefined;\n    }\n\n    if (typeof data === 'number') data = data.toString();\n\n    if (this.readyState !== WebSocket.OPEN) {\n      sendAfterClose(this, data, cb);\n      return;\n    }\n\n    if (mask === undefined) mask = !this._isServer;\n    this._sender.ping(data || EMPTY_BUFFER, mask, cb);\n  }\n\n  /**\n   * Send a pong.\n   *\n   * @param {*} [data] The data to send\n   * @param {Boolean} [mask] Indicates whether or not to mask `data`\n   * @param {Function} [cb] Callback which is executed when the pong is sent\n   * @public\n   */\n  pong(data, mask, cb) {\n    if (this.readyState === WebSocket.CONNECTING) {\n      throw new Error('WebSocket is not open: readyState 0 (CONNECTING)');\n    }\n\n    if (typeof data === 'function') {\n      cb = data;\n      data = mask = undefined;\n    } else if (typeof mask === 'function') {\n      cb = mask;",                                                                                                                                                                                   
      "why": "reference",
      "source": {
        "hopId": "resolve_and_lookup:ping:495da63c",
        "from": "reference"
      },
      "score": 4,
      "provenance": {
        "hopId": "resolve_and_lookup:ping:495da63c",
        "sgQuery": "repo:foo \"ping\"",
        "policy": {
          "caseInsensitive": false,
          "patternType": "regexp"
        },
        "limits": {
          "maxRefsPerSymbol": 15
        }
      },
      "links": {
        "sgBlob": "http://sourcegraph:7080/foo@dabdd5b3018dd05792627a53517dfdb58ae19824/-/blob/lib/websocket.js#L361-401"
      },
      "breadcrumb": {
        "repo": "foo",
        "commitShort": "dabdd5b",
        "pathSegments": [
          "lib",
          "websocket.js"
        ],
        "rangeLabel": "L361–L401",
        "symbol": "ping",
        "whyLabel": "reference"
      }
    },
    {
      "id": "14bf456359",
      "repo": "foo",
      "path": "lib/websocket.js",
      "commit": "dabdd5b3018dd05792627a53517dfdb58ae19824",
      "lineStart": 393,
      "lineEnd": 433,
      "text": "    if (this.readyState === WebSocket.CONNECTING) {\n      throw new Error('WebSocket is not open: readyState 0 (CONNECTING)');\n    }\n\n    if (typeof data === 'function') {\n      cb = data;\n      data = mask = undefined;\n    } else if (typeof mask === 'function') {\n      cb = mask;\n      mask = undefined;\n    }\n\n    if (typeof data === 'number') data = data.toString();\n\n    if (this.readyState !== WebSocket.OPEN) {\n      sendAfterClose(this, data, cb);\n      return;\n    }\n\n    if (mask === undefined) mask = !this._isServer;\n    this._sender.pong(data || EMPTY_BUFFER, mask, cb);\n  }\n\n  /**\n   * Resume the socket.\n   *\n   * @public\n   */\n  resume() {\n    if (\n      this.readyState === WebSocket.CONNECTING ||\n      this.readyState === WebSocket.CLOSED\n    ) {\n      return;\n    }\n\n    this._paused = false;\n    if (!this._receiver._writableState.needDrain) this._socket.resume();\n  }\n\n  /**",                      
      "why": "reference",
      "source": {
        "hopId": "resolve_and_lookup:pong:9573eb3d",
        "from": "reference"
      },
      "score": 4,
      "provenance": {
        "hopId": "resolve_and_lookup:pong:9573eb3d",
        "sgQuery": "repo:foo \"pong\"",
        "policy": {
          "caseInsensitive": false,
          "patternType": "regexp"
        },
        "limits": {
          "maxRefsPerSymbol": 15
        }
      },
      "links": {
        "sgBlob": "http://sourcegraph:7080/foo@dabdd5b3018dd05792627a53517dfdb58ae19824/-/blob/lib/websocket.js#L393-433"
      },
      "breadcrumb": {
        "repo": "foo",
        "commitShort": "dabdd5b",
        "pathSegments": [
          "lib",
          "websocket.js"
        ],
        "rangeLabel": "L393–L433",
        "symbol": "pong",
        "whyLabel": "reference"
      }
    },
    {
      "id": "fea8b6f2e5",
      "repo": "foo",
      "path": "test/sender.test.js",
      "commit": "dabdd5b3018dd05792627a53517dfdb58ae19824",
      "lineStart": 255,
      "lineEnd": 295,
      "text": "      let count = 0;\n      const mockSocket = new MockSocket({\n        write: (data) => {\n          if (++count < 3) return;\n\n          if (count === 3) {\n            assert.deepStrictEqual(data, Buffer.from([0x89, 0x02]));\n          } else {\n            assert.strictEqual(data, 'hi');\n            done();\n          }\n        }\n      });\n      const sender = new Sender(mockSocket, {\n        'permessage-deflate': perMessageDeflate\n      });\n\n      perMessageDeflate.accept([{}]);\n\n      sender.send('foo', { compress: true, fin: true });\n      sender.ping('hi', false);\n    });\n\n    it('can send a `TypedArray` as ping payload', (done) => {\n      let count = 0;\n      const mockSocket = new MockSocket({\n        write: (data) => {\n          if (++count === 1) {\n            assert.deepStrictEqual(data, Buffer.from([0x89, 0x02]));\n          } else {\n            assert.deepStrictEqual(data, Buffer.from([0x68, 0x69]));\n            done();\n          }\n        }\n      });\n\n      const sender = new Sender(mockSocket);\n      const array = new Uint8Array([0x68, 0x69]);\n\n      sender.ping(array, false);\n    });",   
      "why": "reference",
      "source": {
        "hopId": "resolve_and_lookup:ping:495da63c",
        "from": "reference"
      },
      "score": 4,
      "provenance": {
        "hopId": "resolve_and_lookup:ping:495da63c",
        "sgQuery": "repo:foo \"ping\"",
        "policy": {
          "caseInsensitive": false,
          "patternType": "regexp"
        },
        "limits": {
          "maxRefsPerSymbol": 15
        }
      },
      "links": {
        "sgBlob": "http://sourcegraph:7080/foo@dabdd5b3018dd05792627a53517dfdb58ae19824/-/blob/test/sender.test.js#L255-295"
      },
      "breadcrumb": {
        "repo": "foo",
        "commitShort": "dabdd5b",
        "pathSegments": [
          "test",
          "sender.test.js"
        ],
        "rangeLabel": "L255–L295",
        "symbol": "ping",
        "whyLabel": "reference"
      }
    },
    {
      "id": "bf5c34cafd",
      "repo": "foo",
      "path": "test/sender.test.js",
      "commit": "dabdd5b3018dd05792627a53517dfdb58ae19824",
      "lineStart": 274,
      "lineEnd": 314,
      "text": "      sender.send('foo', { compress: true, fin: true });\n      sender.ping('hi', false);\n    });\n\n    it('can send a `TypedArray` as ping payload', (done) => {\n      let count = 0;\n      const mockSocket = new MockSocket({\n        write: (data) => {\n          if (++count === 1) {\n            assert.deepStrictEqual(data, Buffer.from([0x89, 0x02]));\n          } else {\n            assert.deepStrictEqual(data, Buffer.from([0x68, 0x69]));\n            done();\n          }\n        }\n      });\n\n      const sender = new Sender(mockSocket);\n      const array = new Uint8Array([0x68, 0x69]);\n\n      sender.ping(array, false);\n    });\n\n    it('can send an `ArrayBuffer` as ping payload', (done) => {\n      let count = 0;\n      const mockSocket = new MockSocket({\n        write: (data) => {\n          if (++count === 1) {\n            assert.deepStrictEqual(data, Buffer.from([0x89, 0x02]));\n          } else {\n            assert.deepStrictEqual(data, Buffer.from([0x68, 0x69]));\n            done();\n          }\n        }\n      });\n\n      const sender = new Sender(mockSocket);\n      const array = new Uint8Array([0x68, 0x69]);\n\n      sender.ping(array.buffer, false);\n    });",                                                                                                                                             
      "why": "reference",
      "source": {
        "hopId": "resolve_and_lookup:ping:495da63c",
        "from": "reference"
      },
      "score": 4,
      "provenance": {
        "hopId": "resolve_and_lookup:ping:495da63c",
        "sgQuery": "repo:foo \"ping\"",
        "policy": {
          "caseInsensitive": false,
          "patternType": "regexp"
        },
        "limits": {
          "maxRefsPerSymbol": 15
        }
      },
      "links": {
        "sgBlob": "http://sourcegraph:7080/foo@dabdd5b3018dd05792627a53517dfdb58ae19824/-/blob/test/sender.test.js#L274-314"
      },
      "breadcrumb": {
        "repo": "foo",
        "commitShort": "dabdd5b",
        "pathSegments": [
          "test",
          "sender.test.js"
        ],
        "rangeLabel": "L274–L314",
        "symbol": "ping",
        "whyLabel": "reference"
      }
    },
    {
      "id": "a1907884ab",
      "repo": "foo",
      "path": "test/sender.test.js",
      "commit": "dabdd5b3018dd05792627a53517dfdb58ae19824",
      "lineStart": 293,
      "lineEnd": 333,
      "text": "\n      sender.ping(array, false);\n    });\n\n    it('can send an `ArrayBuffer` as ping payload', (done) => {\n      let count = 0;\n      const mockSocket = new MockSocket({\n        write: (data) => {\n          if (++count === 1) {\n            assert.deepStrictEqual(data, Buffer.from([0x89, 0x02]));\n          } else {\n            assert.deepStrictEqual(data, Buffer.from([0x68, 0x69]));\n            done();\n          }\n        }\n      });\n\n      const sender = new Sender(mockSocket);\n      const array = new Uint8Array([0x68, 0x69]);\n\n      sender.ping(array.buffer, false);\n    });\n\n    it('can send a `Blob` as ping payload', function (done) {\n      if (!hasBlob) return this.skip();\n\n      let count = 0;\n      const mockSocket = new MockSocket({\n        write: (data) => {\n          if (++count % 2) {\n            assert.deepStrictEqual(data, Buffer.from([0x89, 0x02]));\n          } else {\n            assert.deepStrictEqual(data, Buffer.from([0x68, 0x69]));\n            if (count === 4) done();\n          }\n        }\n      });\n\n      const sender = new Sender(mockSocket);\n      const blob = new Blob(['hi']);\n",
      "why": "reference",
      "source": {
        "hopId": "resolve_and_lookup:ping:495da63c",
        "from": "reference"
      },
      "score": 4,
      "provenance": {
        "hopId": "resolve_and_lookup:ping:495da63c",
        "sgQuery": "repo:foo \"ping\"",
        "policy": {
          "caseInsensitive": false,
          "patternType": "regexp"
        },
        "limits": {
          "maxRefsPerSymbol": 15
        }
      },
      "links": {
        "sgBlob": "http://sourcegraph:7080/foo@dabdd5b3018dd05792627a53517dfdb58ae19824/-/blob/test/sender.test.js#L293-333"
      },
      "breadcrumb": {
        "repo": "foo",
        "commitShort": "dabdd5b",
        "pathSegments": [
          "test",
          "sender.test.js"
        ],
        "rangeLabel": "L293–L333",
        "symbol": "ping",
        "whyLabel": "reference"
      }
    },
    {
      "id": "64c9ec5baa",
      "repo": "foo",
      "path": "test/sender.test.js",
      "commit": "dabdd5b3018dd05792627a53517dfdb58ae19824",
      "lineStart": 342,
      "lineEnd": 382,
      "text": "      let count = 0;\n      const mockSocket = new MockSocket({\n        write: (data) => {\n          if (++count < 3) return;\n\n          if (count === 3) {\n            assert.deepStrictEqual(data, Buffer.from([0x8a, 0x02]));\n          } else {\n            assert.strictEqual(data, 'hi');\n            done();\n          }\n        }\n      });\n      const sender = new Sender(mockSocket, {\n        'permessage-deflate': perMessageDeflate\n      });\n\n      perMessageDeflate.accept([{}]);\n\n      sender.send('foo', { compress: true, fin: true });\n      sender.pong('hi', false);\n    });\n\n    it('can send a `TypedArray` as ping payload', (done) => {\n      let count = 0;\n      const mockSocket = new MockSocket({\n        write: (data) => {\n          if (++count === 1) {\n            assert.deepStrictEqual(data, Buffer.from([0x8a, 0x02]));\n          } else {\n            assert.deepStrictEqual(data, Buffer.from([0x68, 0x69]));\n            done();\n          }\n        }\n      });\n\n      const sender = new Sender(mockSocket);\n      const array = new Uint8Array([0x68, 0x69]);\n\n      sender.pong(array, false);\n    });",   
      "why": "reference",
      "source": {
        "hopId": "resolve_and_lookup:pong:9573eb3d",
        "from": "reference"
      },
      "score": 4,
      "provenance": {
        "hopId": "resolve_and_lookup:pong:9573eb3d",
        "sgQuery": "repo:foo \"pong\"",
        "policy": {
          "caseInsensitive": false,
          "patternType": "regexp"
        },
        "limits": {
          "maxRefsPerSymbol": 15
        }
      },
      "links": {
        "sgBlob": "http://sourcegraph:7080/foo@dabdd5b3018dd05792627a53517dfdb58ae19824/-/blob/test/sender.test.js#L342-382"
      },
      "breadcrumb": {
        "repo": "foo",
        "commitShort": "dabdd5b",
        "pathSegments": [
          "test",
          "sender.test.js"
        ],
        "rangeLabel": "L342–L382",
        "symbol": "pong",
        "whyLabel": "reference"
      }
    },
    {
      "id": "6c5b423c7b",
      "repo": "foo",
      "path": "test/sender.test.js",
      "commit": "dabdd5b3018dd05792627a53517dfdb58ae19824",
      "lineStart": 361,
      "lineEnd": 401,
      "text": "      sender.send('foo', { compress: true, fin: true });\n      sender.pong('hi', false);\n    });\n\n    it('can send a `TypedArray` as ping payload', (done) => {\n      let count = 0;\n      const mockSocket = new MockSocket({\n        write: (data) => {\n          if (++count === 1) {\n            assert.deepStrictEqual(data, Buffer.from([0x8a, 0x02]));\n          } else {\n            assert.deepStrictEqual(data, Buffer.from([0x68, 0x69]));\n            done();\n          }\n        }\n      });\n\n      const sender = new Sender(mockSocket);\n      const array = new Uint8Array([0x68, 0x69]);\n\n      sender.pong(array, false);\n    });\n\n    it('can send an `ArrayBuffer` as ping payload', (done) => {\n      let count = 0;\n      const mockSocket = new MockSocket({\n        write: (data) => {\n          if (++count === 1) {\n            assert.deepStrictEqual(data, Buffer.from([0x8a, 0x02]));\n          } else {\n            assert.deepStrictEqual(data, Buffer.from([0x68, 0x69]));\n            done();\n          }\n        }\n      });\n\n      const sender = new Sender(mockSocket);\n      const array = new Uint8Array([0x68, 0x69]);\n\n      sender.pong(array.buffer, false);\n    });",                                                                                                                                             
      "why": "reference",
      "source": {
        "hopId": "resolve_and_lookup:pong:9573eb3d",
        "from": "reference"
      },
      "score": 4,
      "provenance": {
        "hopId": "resolve_and_lookup:pong:9573eb3d",
        "sgQuery": "repo:foo \"pong\"",
        "policy": {
          "caseInsensitive": false,
          "patternType": "regexp"
        },
        "limits": {
          "maxRefsPerSymbol": 15
        }
      },
      "links": {
        "sgBlob": "http://sourcegraph:7080/foo@dabdd5b3018dd05792627a53517dfdb58ae19824/-/blob/test/sender.test.js#L361-401"
      },
      "breadcrumb": {
        "repo": "foo",
        "commitShort": "dabdd5b",
        "pathSegments": [
          "test",
          "sender.test.js"
        ],
        "rangeLabel": "L361–L401",
        "symbol": "pong",
        "whyLabel": "reference"
      }
    },
    {
      "id": "d4ef52ffe4",
      "repo": "foo",
      "path": "test/sender.test.js",
      "commit": "dabdd5b3018dd05792627a53517dfdb58ae19824",
      "lineStart": 380,
      "lineEnd": 420,
      "text": "\n      sender.pong(array, false);\n    });\n\n    it('can send an `ArrayBuffer` as ping payload', (done) => {\n      let count = 0;\n      const mockSocket = new MockSocket({\n        write: (data) => {\n          if (++count === 1) {\n            assert.deepStrictEqual(data, Buffer.from([0x8a, 0x02]));\n          } else {\n            assert.deepStrictEqual(data, Buffer.from([0x68, 0x69]));\n            done();\n          }\n        }\n      });\n\n      const sender = new Sender(mockSocket);\n      const array = new Uint8Array([0x68, 0x69]);\n\n      sender.pong(array.buffer, false);\n    });\n\n    it('can send a `Blob` as ping payload', function (done) {\n      if (!hasBlob) return this.skip();\n\n      let count = 0;\n      const mockSocket = new MockSocket({\n        write: (data) => {\n          if (++count % 2) {\n            assert.deepStrictEqual(data, Buffer.from([0x8a, 0x02]));\n          } else {\n            assert.deepStrictEqual(data, Buffer.from([0x68, 0x69]));\n            if (count === 4) done();\n          }\n        }\n      });\n\n      const sender = new Sender(mockSocket);\n      const blob = new Blob(['hi']);\n",
      "why": "reference",
      "source": {
        "hopId": "resolve_and_lookup:pong:9573eb3d",
        "from": "reference"
      },
      "score": 4,
      "provenance": {
        "hopId": "resolve_and_lookup:pong:9573eb3d",
        "sgQuery": "repo:foo \"pong\"",
        "policy": {
          "caseInsensitive": false,
          "patternType": "regexp"
        },
        "limits": {
          "maxRefsPerSymbol": 15
        }
      },
      "links": {
        "sgBlob": "http://sourcegraph:7080/foo@dabdd5b3018dd05792627a53517dfdb58ae19824/-/blob/test/sender.test.js#L380-420"
      },
      "breadcrumb": {
        "repo": "foo",
        "commitShort": "dabdd5b",
        "pathSegments": [
          "test",
          "sender.test.js"
        ],
        "rangeLabel": "L380–L420",
        "symbol": "pong",
        "whyLabel": "reference"
      }
    },
    {
      "id": "607aea593f",
      "repo": "foo",
      "path": "test/sender.test.js",
      "commit": "dabdd5b3018dd05792627a53517dfdb58ae19824",
      "lineStart": 314,
      "lineEnd": 355,
      "text": "    });\n\n    it('can send a `Blob` as ping payload', function (done) {\n      if (!hasBlob) return this.skip();\n\n      let count = 0;\n      const mockSocket = new MockSocket({\n        write: (data) => {\n          if (++count % 2) {\n            assert.deepStrictEqual(data, Buffer.from([0x89, 0x02]));\n          } else {\n            assert.deepStrictEqual(data, Buffer.from([0x68, 0x69]));\n            if (count === 4) done();\n          }\n        }\n      });\n\n      const sender = new Sender(mockSocket);\n      const blob = new Blob(['hi']);\n\n      sender.ping(blob, false);\n      sender.ping(blob, false);\n    });\n  });\n\n  describe('#pong', () => {\n    it('can send a string as ping payload', (done) => {\n      const perMessageDeflate = new PerMessageDeflate();\n      let count = 0;\n      const mockSocket = new MockSocket({\n        write: (data) => {\n          if (++count < 3) return;\n\n          if (count === 3) {\n            assert.deepStrictEqual(data, Buffer.from([0x8a, 0x02]));\n          } else {\n            assert.strictEqual(data, 'hi');\n            done();\n          }\n        }\n      });\n\n    it('can send a `Blob` as ping payload', function (done) {\n      if (!hasBlob) return this.skip();\n\n      let count = 0;\n      const mockSocket = new MockSocket({\n        write: (data) => {\n          if (++count % 2) {\n            assert.deepStrictEqual(data, Buffer.from([0x89, 0x02]));\n          } else {\n            assert.deepStrictEqual(data, Buffer.from([0x68, 0x69]));\n            if (count === 4) done();\n          }\n        }\n      });\n\n      const sender = new Sender(mockSocket);\n      const blob = new Blob(['hi']);\n\n      sender.ping(blob, false);\n      sender.ping(blob, false);\n    });\n  });\n\n  describe('#pong', () => {\n    it('can send a string as ping payload', (done) => {\n      const perMessageDeflate = new PerMessageDeflate();\n      let count = 0;\n      const mockSocket = new MockSocket({\n        write: (data) => {\n          if (++count < 3) return;\n\n          if (count === 3) {\n            assert.deepStrictEqual(data, Buffer.from([0x8a, 0x02]));\n          } else {\n            assert.strictEqual(data, 'hi');\n            done();\n          }\n        }\n      });\n      const sender = new Sender(mockSocket, {",     
      "why": "reference",
      "source": {
        "hopId": "resolve_and_lookup:ping:495da63c",
        "from": "reference"
      },
      "score": 4,
      "provenance": {
        "hopId": "resolve_and_lookup:ping:495da63c",
        "sgQuery": "repo:foo \"ping\"",
        "policy": {
          "caseInsensitive": false,
          "patternType": "regexp"
        },
        "limits": {
          "maxRefsPerSymbol": 15
        }
      },
      "links": {
        "sgBlob": "http://sourcegraph:7080/foo@dabdd5b3018dd05792627a53517dfdb58ae19824/-/blob/test/sender.test.js#L314-355"
      },
      "breadcrumb": {
        "repo": "foo",
        "commitShort": "dabdd5b",
        "pathSegments": [
          "test",
          "sender.test.js"
        ],
        "rangeLabel": "L314–L354",
        "symbol": "ping",
        "whyLabel": "reference"
      }
    },
    {
      "id": "7a196937a4",
      "repo": "foo",
      "path": "test/sender.test.js",
      "commit": "dabdd5b3018dd05792627a53517dfdb58ae19824",
      "lineStart": 401,
      "lineEnd": 442,
      "text": "    });\n\n    it('can send a `Blob` as ping payload', function (done) {\n      if (!hasBlob) return this.skip();\n\n      let count = 0;\n      const mockSocket = new MockSocket({\n        write: (data) => {\n          if (++count % 2) {\n            assert.deepStrictEqual(data, Buffer.from([0x8a, 0x02]));\n          } else {\n            assert.deepStrictEqual(data, Buffer.from([0x68, 0x69]));\n            if (count === 4) done();\n          }\n        }\n      });\n\n      const sender = new Sender(mockSocket);\n      const blob = new Blob(['hi']);\n\n      sender.pong(blob, false);\n      sender.pong(blob, false);\n    });\n  });\n\n  describe('#close', () => {\n    it('throws an error if the first argument is invalid', () => {\n      const mockSocket = new MockSocket();\n      const sender = new Sender(mockSocket);\n\n      assert.throws(\n        () => sender.close('error'),\n        /^TypeError: First argument must be a valid error code number$/\n      );\n\n      assert.throws(\n        () => sender.close(1004),\n        /^TypeError: First argument must be a valid error code number$/\n      );\n    });\n\n\n    it('can send a `Blob` as ping payload', function (done) {\n      if (!hasBlob) return this.skip();\n\n      let count = 0;\n      const mockSocket = new MockSocket({\n        write: (data) => {\n          if (++count % 2) {\n            assert.deepStrictEqual(data, Buffer.from([0x8a, 0x02]));\n          } else {\n            assert.deepStrictEqual(data, Buffer.from([0x68, 0x69]));\n            if (count === 4) done();\n          }\n        }\n      });\n\n      const sender = new Sender(mockSocket);\n      const blob = new Blob(['hi']);\n\n      sender.pong(blob, false);\n      sender.pong(blob, false);\n    });\n  });\n\n  describe('#close', () => {\n    it('throws an error if the first argument is invalid', () => {\n      const mockSocket = new MockSocket();\n      const sender = new Sender(mockSocket);\n\n      assert.throws(\n        () => sender.close('error'),\n        /^TypeError: First argument must be a valid error code number$/\n      );\n\n      assert.throws(\n        () => sender.close(1004),\n        /^TypeError: First argument must be a valid error code number$/\n      );\n    });\n\n    it('throws an error if the message is greater than 123 bytes', () => {",                                                                                                                                                                                               
      "why": "reference",
      "source": {
        "hopId": "resolve_and_lookup:pong:9573eb3d",
        "from": "reference"
      },
      "score": 4,
      "provenance": {
        "hopId": "resolve_and_lookup:pong:9573eb3d",
        "sgQuery": "repo:foo \"pong\"",
        "policy": {
          "caseInsensitive": false,
          "patternType": "regexp"
        },
        "limits": {
          "maxRefsPerSymbol": 15
        }
      },
      "links": {
        "sgBlob": "http://sourcegraph:7080/foo@dabdd5b3018dd05792627a53517dfdb58ae19824/-/blob/test/sender.test.js#L401-442"
      },
      "breadcrumb": {
        "repo": "foo",
        "commitShort": "dabdd5b",
        "pathSegments": [
          "test",
          "sender.test.js"
        ],
        "rangeLabel": "L401–L441",
        "symbol": "pong",
        "whyLabel": "reference"
      }
    }
  ],
  "graph": {
    "nodes": [
      {
        "kind": "file",
        "repo": "foo",
        "path": "lib/websocket-server.js",
        "commit": "dabdd5b3018dd05792627a53517dfdb58ae19824",
        "id": "foo|dabdd5b3018dd05792627a53517dfdb58ae19824|lib/websocket-server.js",
        "links": {
          "sgBlob": "http://sourcegraph:7080/foo@dabdd5b3018dd05792627a53517dfdb58ae19824/-/blob/lib/websocket-server.js#L1-1"
        },
        "breadcrumb": {
          "repo": "foo",
          "commitShort": "dabdd5b",
          "pathSegments": [
            "lib",
            "websocket-server.js"
          ]
        }
      },
      {
        "kind": "symbol",
        "repo": "foo",
        "path": "lib/websocket-server.js",
        "commit": "dabdd5b3018dd05792627a53517dfdb58ae19824",
        "line": 26,
        "character": 0,
        "id": "foo|dabdd5b3018dd05792627a53517dfdb58ae19824|lib/websocket-server.js|26|0",
        "label": "WebSocketServer",
        "links": {
          "sgBlob": "http://sourcegraph:7080/foo@dabdd5b3018dd05792627a53517dfdb58ae19824/-/blob/lib/websocket-server.js#L27-27"
        },
        "breadcrumb": {
          "repo": "foo",
          "commitShort": "dabdd5b",
          "pathSegments": [
            "lib",
            "websocket-server.js"
          ],
          "line": 26,
          "character": 0,
          "label": "WebSocketServer"
        }
      },
      {
        "kind": "symbol",
        "repo": "foo",
        "path": "lib/websocket-server.js",
        "commit": "dabdd5b3018dd05792627a53517dfdb58ae19824",
        "line": 441,
        "character": 0,
        "id": "foo|dabdd5b3018dd05792627a53517dfdb58ae19824|lib/websocket-server.js|441|0",
        "label": "WebSocketServer",
        "links": {
          "sgBlob": "http://sourcegraph:7080/foo@dabdd5b3018dd05792627a53517dfdb58ae19824/-/blob/lib/websocket-server.js#L442-442"
        },
        "breadcrumb": {
          "repo": "foo",
          "commitShort": "dabdd5b",
          "pathSegments": [
            "lib",
            "websocket-server.js"
          ],
          "line": 441,
          "character": 0,
          "label": "WebSocketServer"
        }
      },
      {
        "kind": "file",
        "repo": "foo",
        "path": "lib/sender.js",
        "commit": "dabdd5b3018dd05792627a53517dfdb58ae19824",
        "id": "foo|dabdd5b3018dd05792627a53517dfdb58ae19824|lib/sender.js",
        "links": {
          "sgBlob": "http://sourcegraph:7080/foo@dabdd5b3018dd05792627a53517dfdb58ae19824/-/blob/lib/sender.js#L1-1"
        },
        "breadcrumb": {
          "repo": "foo",
          "commitShort": "dabdd5b",
          "pathSegments": [
            "lib",
            "sender.js"
          ]
        }
      },
      {
        "kind": "symbol",
        "repo": "foo",
        "path": "lib/sender.js",
        "commit": "dabdd5b3018dd05792627a53517dfdb58ae19824",
        "line": 233,
        "character": 0,
        "id": "foo|dabdd5b3018dd05792627a53517dfdb58ae19824|lib/sender.js|233|0",
        "label": "ping",
        "links": {
          "sgBlob": "http://sourcegraph:7080/foo@dabdd5b3018dd05792627a53517dfdb58ae19824/-/blob/lib/sender.js#L234-234"
        },
        "breadcrumb": {
          "repo": "foo",
          "commitShort": "dabdd5b",
          "pathSegments": [
            "lib",
            "sender.js"
          ],
          "line": 233,
          "character": 0,
          "label": "ping"
        }
      },
      {
        "kind": "file",
        "repo": "foo",
        "path": "lib/websocket.js",
        "commit": "dabdd5b3018dd05792627a53517dfdb58ae19824",
        "id": "foo|dabdd5b3018dd05792627a53517dfdb58ae19824|lib/websocket.js",
        "links": {
          "sgBlob": "http://sourcegraph:7080/foo@dabdd5b3018dd05792627a53517dfdb58ae19824/-/blob/lib/websocket.js#L1-1"
        },
        "breadcrumb": {
          "repo": "foo",
          "commitShort": "dabdd5b",
          "pathSegments": [
            "lib",
            "websocket.js"
          ]
        }
      },
      {
        "kind": "symbol",
        "repo": "foo",
        "path": "lib/websocket.js",
        "commit": "dabdd5b3018dd05792627a53517dfdb58ae19824",
        "line": 380,
        "character": 0,
        "id": "foo|dabdd5b3018dd05792627a53517dfdb58ae19824|lib/websocket.js|380|0",
        "label": "ping",
        "links": {
          "sgBlob": "http://sourcegraph:7080/foo@dabdd5b3018dd05792627a53517dfdb58ae19824/-/blob/lib/websocket.js#L381-381"
        },
        "breadcrumb": {
          "repo": "foo",
          "commitShort": "dabdd5b",
          "pathSegments": [
            "lib",
            "websocket.js"
          ],
          "line": 380,
          "character": 0,
          "label": "ping"
        }
      },
      {
        "kind": "file",
        "repo": "foo",
        "path": "test/sender.test.js",
        "commit": "dabdd5b3018dd05792627a53517dfdb58ae19824",
        "id": "foo|dabdd5b3018dd05792627a53517dfdb58ae19824|test/sender.test.js",
        "links": {
          "sgBlob": "http://sourcegraph:7080/foo@dabdd5b3018dd05792627a53517dfdb58ae19824/-/blob/test/sender.test.js#L1-1"
        },
        "breadcrumb": {
          "repo": "foo",
          "commitShort": "dabdd5b",
          "pathSegments": [
            "test",
            "sender.test.js"
          ]
        }
      },
      {
        "kind": "symbol",
        "repo": "foo",
        "path": "test/sender.test.js",
        "commit": "dabdd5b3018dd05792627a53517dfdb58ae19824",
        "line": 274,
        "character": 0,
        "id": "foo|dabdd5b3018dd05792627a53517dfdb58ae19824|test/sender.test.js|274|0",
        "label": "ping",
        "links": {
          "sgBlob": "http://sourcegraph:7080/foo@dabdd5b3018dd05792627a53517dfdb58ae19824/-/blob/test/sender.test.js#L275-275"
        },
        "breadcrumb": {
          "repo": "foo",
          "commitShort": "dabdd5b",
          "pathSegments": [
            "test",
            "sender.test.js"
          ],
          "line": 274,
          "character": 0,
          "label": "ping"
        }
      },
      {
        "kind": "symbol",
        "repo": "foo",
        "path": "test/sender.test.js",
        "commit": "dabdd5b3018dd05792627a53517dfdb58ae19824",
        "line": 293,
        "character": 0,
        "id": "foo|dabdd5b3018dd05792627a53517dfdb58ae19824|test/sender.test.js|293|0",
        "label": "ping",
        "links": {
          "sgBlob": "http://sourcegraph:7080/foo@dabdd5b3018dd05792627a53517dfdb58ae19824/-/blob/test/sender.test.js#L294-294"
        },
        "breadcrumb": {
          "repo": "foo",
          "commitShort": "dabdd5b",
          "pathSegments": [
            "test",
            "sender.test.js"
          ],
          "line": 293,
          "character": 0,
          "label": "ping"
        }
      },
      {
        "kind": "symbol",
        "repo": "foo",
        "path": "test/sender.test.js",
        "commit": "dabdd5b3018dd05792627a53517dfdb58ae19824",
        "line": 312,
        "character": 0,
        "id": "foo|dabdd5b3018dd05792627a53517dfdb58ae19824|test/sender.test.js|312|0",
        "label": "ping",
        "links": {
          "sgBlob": "http://sourcegraph:7080/foo@dabdd5b3018dd05792627a53517dfdb58ae19824/-/blob/test/sender.test.js#L313-313"
        },
        "breadcrumb": {
          "repo": "foo",
          "commitShort": "dabdd5b",
          "pathSegments": [
            "test",
            "sender.test.js"
          ],
          "line": 312,
          "character": 0,
          "label": "ping"
        }
      },
      {
        "kind": "symbol",
        "repo": "foo",
        "path": "test/sender.test.js",
        "commit": "dabdd5b3018dd05792627a53517dfdb58ae19824",
        "line": 333,
        "character": 0,
        "id": "foo|dabdd5b3018dd05792627a53517dfdb58ae19824|test/sender.test.js|333|0",
        "label": "ping",
        "links": {
          "sgBlob": "http://sourcegraph:7080/foo@dabdd5b3018dd05792627a53517dfdb58ae19824/-/blob/test/sender.test.js#L334-334"
        },
        "breadcrumb": {
          "repo": "foo",
          "commitShort": "dabdd5b",
          "pathSegments": [
            "test",
            "sender.test.js"
          ],
          "line": 333,
          "character": 0,
          "label": "ping"
        }
      },
      {
        "kind": "symbol",
        "repo": "foo",
        "path": "test/sender.test.js",
        "commit": "dabdd5b3018dd05792627a53517dfdb58ae19824",
        "line": 334,
        "character": 0,
        "id": "foo|dabdd5b3018dd05792627a53517dfdb58ae19824|test/sender.test.js|334|0",
        "label": "ping",
        "links": {
          "sgBlob": "http://sourcegraph:7080/foo@dabdd5b3018dd05792627a53517dfdb58ae19824/-/blob/test/sender.test.js#L335-335"
        },
        "breadcrumb": {
          "repo": "foo",
          "commitShort": "dabdd5b",
          "pathSegments": [
            "test",
            "sender.test.js"
          ],
          "line": 334,
          "character": 0,
          "label": "ping"
        }
      },
      {
        "kind": "symbol",
        "repo": "foo",
        "path": "lib/sender.js",
        "commit": "dabdd5b3018dd05792627a53517dfdb58ae19824",
        "line": 285,
        "character": 0,
        "id": "foo|dabdd5b3018dd05792627a53517dfdb58ae19824|lib/sender.js|285|0",
        "label": "pong",
        "links": {
          "sgBlob": "http://sourcegraph:7080/foo@dabdd5b3018dd05792627a53517dfdb58ae19824/-/blob/lib/sender.js#L286-286"
        },
        "breadcrumb": {
          "repo": "foo",
          "commitShort": "dabdd5b",
          "pathSegments": [
            "lib",
            "sender.js"
          ],
          "line": 285,
          "character": 0,
          "label": "pong"
        }
      },
      {
        "kind": "symbol",
        "repo": "foo",
        "path": "lib/websocket.js",
        "commit": "dabdd5b3018dd05792627a53517dfdb58ae19824",
        "line": 412,
        "character": 0,
        "id": "foo|dabdd5b3018dd05792627a53517dfdb58ae19824|lib/websocket.js|412|0",
        "label": "pong",
        "links": {
          "sgBlob": "http://sourcegraph:7080/foo@dabdd5b3018dd05792627a53517dfdb58ae19824/-/blob/lib/websocket.js#L413-413"
        },
        "breadcrumb": {
          "repo": "foo",
          "commitShort": "dabdd5b",
          "pathSegments": [
            "lib",
            "websocket.js"
          ],
          "line": 412,
          "character": 0,
          "label": "pong"
        }
      },
      {
        "kind": "symbol",
        "repo": "foo",
        "path": "test/sender.test.js",
        "commit": "dabdd5b3018dd05792627a53517dfdb58ae19824",
        "line": 361,
        "character": 0,
        "id": "foo|dabdd5b3018dd05792627a53517dfdb58ae19824|test/sender.test.js|361|0",
        "label": "pong",
        "links": {
          "sgBlob": "http://sourcegraph:7080/foo@dabdd5b3018dd05792627a53517dfdb58ae19824/-/blob/test/sender.test.js#L362-362"
        },
        "breadcrumb": {
          "repo": "foo",
          "commitShort": "dabdd5b",
          "pathSegments": [
            "test",
            "sender.test.js"
          ],
          "line": 361,
          "character": 0,
          "label": "pong"
        }
      },
      {
        "kind": "symbol",
        "repo": "foo",
        "path": "test/sender.test.js",
        "commit": "dabdd5b3018dd05792627a53517dfdb58ae19824",
        "line": 380,
        "character": 0,
        "id": "foo|dabdd5b3018dd05792627a53517dfdb58ae19824|test/sender.test.js|380|0",
        "label": "pong",
        "links": {
          "sgBlob": "http://sourcegraph:7080/foo@dabdd5b3018dd05792627a53517dfdb58ae19824/-/blob/test/sender.test.js#L381-381"
        },
        "breadcrumb": {
          "repo": "foo",
          "commitShort": "dabdd5b",
          "pathSegments": [
            "test",
            "sender.test.js"
          ],
          "line": 380,
          "character": 0,
          "label": "pong"
        }
      },
      {
        "kind": "symbol",
        "repo": "foo",
        "path": "test/sender.test.js",
        "commit": "dabdd5b3018dd05792627a53517dfdb58ae19824",
        "line": 399,
        "character": 0,
        "id": "foo|dabdd5b3018dd05792627a53517dfdb58ae19824|test/sender.test.js|399|0",
        "label": "pong",
        "links": {
          "sgBlob": "http://sourcegraph:7080/foo@dabdd5b3018dd05792627a53517dfdb58ae19824/-/blob/test/sender.test.js#L400-400"
        },
        "breadcrumb": {
          "repo": "foo",
          "commitShort": "dabdd5b",
          "pathSegments": [
            "test",
            "sender.test.js"
          ],
          "line": 399,
          "character": 0,
          "label": "pong"
        }
      },
      {
        "kind": "symbol",
        "repo": "foo",
        "path": "test/sender.test.js",
        "commit": "dabdd5b3018dd05792627a53517dfdb58ae19824",
        "line": 420,
        "character": 0,
        "id": "foo|dabdd5b3018dd05792627a53517dfdb58ae19824|test/sender.test.js|420|0",
        "label": "pong",
        "links": {
          "sgBlob": "http://sourcegraph:7080/foo@dabdd5b3018dd05792627a53517dfdb58ae19824/-/blob/test/sender.test.js#L421-421"
        },
        "breadcrumb": {
          "repo": "foo",
          "commitShort": "dabdd5b",
          "pathSegments": [
            "test",
            "sender.test.js"
          ],
          "line": 420,
          "character": 0,
          "label": "pong"
        }
      },
      {
        "kind": "symbol",
        "repo": "foo",
        "path": "test/sender.test.js",
        "commit": "dabdd5b3018dd05792627a53517dfdb58ae19824",
        "line": 421,
        "character": 0,
        "id": "foo|dabdd5b3018dd05792627a53517dfdb58ae19824|test/sender.test.js|421|0",
        "label": "pong",
        "links": {
          "sgBlob": "http://sourcegraph:7080/foo@dabdd5b3018dd05792627a53517dfdb58ae19824/-/blob/test/sender.test.js#L422-422"
        },
        "breadcrumb": {
          "repo": "foo",
          "commitShort": "dabdd5b",
          "pathSegments": [
            "test",
            "sender.test.js"
          ],
          "line": 421,
          "character": 0,
          "label": "pong"
        }
      }
    ],
    "edges": [
      {
        "srcId": "foo|dabdd5b3018dd05792627a53517dfdb58ae19824|lib/websocket-server.js|26|0",
        "dstId": "foo|dabdd5b3018dd05792627a53517dfdb58ae19824|lib/websocket-server.js",
        "type": "defines"
      },
      {
        "srcId": "foo|dabdd5b3018dd05792627a53517dfdb58ae19824|lib/websocket-server.js|441|0",
        "dstId": "foo|dabdd5b3018dd05792627a53517dfdb58ae19824|lib/websocket-server.js",
        "type": "refers"
      },
      {
        "srcId": "foo|dabdd5b3018dd05792627a53517dfdb58ae19824|lib/sender.js|233|0",
        "dstId": "foo|dabdd5b3018dd05792627a53517dfdb58ae19824|lib/sender.js",
        "type": "defines"
      },
      {
