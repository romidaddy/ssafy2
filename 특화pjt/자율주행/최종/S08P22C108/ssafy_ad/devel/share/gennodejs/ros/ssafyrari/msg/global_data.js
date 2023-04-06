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

class global_data {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.nodes_idx = null;
      this.links_idx = null;
      this.nodes_idx1 = null;
      this.links_idx1 = null;
      this.nodes_idx2 = null;
      this.links_idx2 = null;
      this.change = null;
      this.CC = null;
      this.DD = null;
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
      if (initObj.hasOwnProperty('nodes_idx1')) {
        this.nodes_idx1 = initObj.nodes_idx1
      }
      else {
        this.nodes_idx1 = [];
      }
      if (initObj.hasOwnProperty('links_idx1')) {
        this.links_idx1 = initObj.links_idx1
      }
      else {
        this.links_idx1 = [];
      }
      if (initObj.hasOwnProperty('nodes_idx2')) {
        this.nodes_idx2 = initObj.nodes_idx2
      }
      else {
        this.nodes_idx2 = [];
      }
      if (initObj.hasOwnProperty('links_idx2')) {
        this.links_idx2 = initObj.links_idx2
      }
      else {
        this.links_idx2 = [];
      }
      if (initObj.hasOwnProperty('change')) {
        this.change = initObj.change
      }
      else {
        this.change = 0;
      }
      if (initObj.hasOwnProperty('CC')) {
        this.CC = initObj.CC
      }
      else {
        this.CC = [];
      }
      if (initObj.hasOwnProperty('DD')) {
        this.DD = initObj.DD
      }
      else {
        this.DD = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type global_data
    // Serialize message field [nodes_idx]
    bufferOffset = _arraySerializer.string(obj.nodes_idx, buffer, bufferOffset, null);
    // Serialize message field [links_idx]
    bufferOffset = _arraySerializer.string(obj.links_idx, buffer, bufferOffset, null);
    // Serialize message field [nodes_idx1]
    bufferOffset = _arraySerializer.string(obj.nodes_idx1, buffer, bufferOffset, null);
    // Serialize message field [links_idx1]
    bufferOffset = _arraySerializer.string(obj.links_idx1, buffer, bufferOffset, null);
    // Serialize message field [nodes_idx2]
    bufferOffset = _arraySerializer.string(obj.nodes_idx2, buffer, bufferOffset, null);
    // Serialize message field [links_idx2]
    bufferOffset = _arraySerializer.string(obj.links_idx2, buffer, bufferOffset, null);
    // Serialize message field [change]
    bufferOffset = _serializer.uint32(obj.change, buffer, bufferOffset);
    // Serialize message field [CC]
    bufferOffset = _arraySerializer.float64(obj.CC, buffer, bufferOffset, null);
    // Serialize message field [DD]
    bufferOffset = _arraySerializer.float64(obj.DD, buffer, bufferOffset, null);
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
    // Deserialize message field [nodes_idx1]
    data.nodes_idx1 = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [links_idx1]
    data.links_idx1 = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [nodes_idx2]
    data.nodes_idx2 = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [links_idx2]
    data.links_idx2 = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [change]
    data.change = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [CC]
    data.CC = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [DD]
    data.DD = _arrayDeserializer.float64(buffer, bufferOffset, null)
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
    object.nodes_idx1.forEach((val) => {
      length += 4 + val.length;
    });
    object.links_idx1.forEach((val) => {
      length += 4 + val.length;
    });
    object.nodes_idx2.forEach((val) => {
      length += 4 + val.length;
    });
    object.links_idx2.forEach((val) => {
      length += 4 + val.length;
    });
    length += 8 * object.CC.length;
    length += 8 * object.DD.length;
    return length + 36;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ssafyrari/global_data';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '835f29fffac894f6ad460b7c08855f8c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string[] nodes_idx
    string[] links_idx
    string[] nodes_idx1
    string[] links_idx1
    string[] nodes_idx2
    string[] links_idx2
    uint32 change
    float64[] CC
    float64[] DD
    
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

    if (msg.nodes_idx1 !== undefined) {
      resolved.nodes_idx1 = msg.nodes_idx1;
    }
    else {
      resolved.nodes_idx1 = []
    }

    if (msg.links_idx1 !== undefined) {
      resolved.links_idx1 = msg.links_idx1;
    }
    else {
      resolved.links_idx1 = []
    }

    if (msg.nodes_idx2 !== undefined) {
      resolved.nodes_idx2 = msg.nodes_idx2;
    }
    else {
      resolved.nodes_idx2 = []
    }

    if (msg.links_idx2 !== undefined) {
      resolved.links_idx2 = msg.links_idx2;
    }
    else {
      resolved.links_idx2 = []
    }

    if (msg.change !== undefined) {
      resolved.change = msg.change;
    }
    else {
      resolved.change = 0
    }

    if (msg.CC !== undefined) {
      resolved.CC = msg.CC;
    }
    else {
      resolved.CC = []
    }

    if (msg.DD !== undefined) {
      resolved.DD = msg.DD;
    }
    else {
      resolved.DD = []
    }

    return resolved;
    }
};

module.exports = global_data;
