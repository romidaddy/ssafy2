// Auto-generated. Do not edit!

// (in-package ssafy_3.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class global_data {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.nodes_idx = null;
      this.links_idx = null;
    }
    else {
      if (initObj.hasOwnProperty('nodes_idx')) {
        this.nodes_idx = initObj.nodes_idx
      }
      else {
        this.nodes_idx = [];
      }
      if (initObj.hasOwnProperty('links_idx')) {
        this.links_idx = initObj.links_idx
      }
      else {
        this.links_idx = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type global_data
    // Serialize message field [nodes_idx]
    bufferOffset = _arraySerializer.string(obj.nodes_idx, buffer, bufferOffset, null);
    // Serialize message field [links_idx]
    bufferOffset = _arraySerializer.string(obj.links_idx, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type global_data
    let len;
    let data = new global_data(null);
    // Deserialize message field [nodes_idx]
    data.nodes_idx = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [links_idx]
    data.links_idx = _arrayDeserializer.string(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.nodes_idx.forEach((val) => {
      length += 4 + val.length;
    });
    object.links_idx.forEach((val) => {
      length += 4 + val.length;
    });
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ssafy_3/global_data';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '02d022257e750283e1f48933d4a8d19c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string[] nodes_idx
    string[] links_idx
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new global_data(null);
    if (msg.nodes_idx !== undefined) {
      resolved.nodes_idx = msg.nodes_idx;
    }
    else {
      resolved.nodes_idx = []
    }

    if (msg.links_idx !== undefined) {
      resolved.links_idx = msg.links_idx;
    }
    else {
      resolved.links_idx = []
    }

    return resolved;
    }
};

module.exports = global_data;
