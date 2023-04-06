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

class GPS {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.longitude = null;
      this.latitude = null;
      this.eastOffset = null;
      this.northOffset = null;
    }
    else {
      if (initObj.hasOwnProperty('longitude')) {
        this.longitude = initObj.longitude
      }
      else {
        this.longitude = 0.0;
      }
      if (initObj.hasOwnProperty('latitude')) {
        this.latitude = initObj.latitude
      }
      else {
        this.latitude = 0.0;
      }
      if (initObj.hasOwnProperty('eastOffset')) {
        this.eastOffset = initObj.eastOffset
      }
      else {
        this.eastOffset = 0.0;
      }
      if (initObj.hasOwnProperty('northOffset')) {
        this.northOffset = initObj.northOffset
      }
      else {
        this.northOffset = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GPS
    // Serialize message field [longitude]
    bufferOffset = _serializer.float64(obj.longitude, buffer, bufferOffset);
    // Serialize message field [latitude]
    bufferOffset = _serializer.float64(obj.latitude, buffer, bufferOffset);
    // Serialize message field [eastOffset]
    bufferOffset = _serializer.float64(obj.eastOffset, buffer, bufferOffset);
    // Serialize message field [northOffset]
    bufferOffset = _serializer.float64(obj.northOffset, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GPS
    let len;
    let data = new GPS(null);
    // Deserialize message field [longitude]
    data.longitude = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [latitude]
    data.latitude = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [eastOffset]
    data.eastOffset = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [northOffset]
    data.northOffset = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 32;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ssafy_3/GPS';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '873a81f2a8fa219c502e38ff7956f609';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 longitude
    float64 latitude
    float64 eastOffset
    float64 northOffset
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GPS(null);
    if (msg.longitude !== undefined) {
      resolved.longitude = msg.longitude;
    }
    else {
      resolved.longitude = 0.0
    }

    if (msg.latitude !== undefined) {
      resolved.latitude = msg.latitude;
    }
    else {
      resolved.latitude = 0.0
    }

    if (msg.eastOffset !== undefined) {
      resolved.eastOffset = msg.eastOffset;
    }
    else {
      resolved.eastOffset = 0.0
    }

    if (msg.northOffset !== undefined) {
      resolved.northOffset = msg.northOffset;
    }
    else {
      resolved.northOffset = 0.0
    }

    return resolved;
    }
};

module.exports = GPS;
