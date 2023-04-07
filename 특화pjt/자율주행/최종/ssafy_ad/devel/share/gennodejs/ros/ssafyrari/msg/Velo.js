// Auto-generated. Do not edit!

// (in-package ssafyrari.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Velo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.velo = null;
    }
    else {
      if (initObj.hasOwnProperty('velo')) {
        this.velo = initObj.velo
      }
      else {
        this.velo = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Velo
    // Serialize message field [velo]
    bufferOffset = _arraySerializer.float64(obj.velo, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Velo
    let len;
    let data = new Velo(null);
    // Deserialize message field [velo]
    data.velo = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.velo.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ssafyrari/Velo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'bed164f0ee5d61bd8bc4c275368453b2';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[] velo
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Velo(null);
    if (msg.velo !== undefined) {
      resolved.velo = msg.velo;
    }
    else {
      resolved.velo = []
    }

    return resolved;
    }
};

module.exports = Velo;
