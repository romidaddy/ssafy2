import React from "react";
import { useNavigate } from "react-router";
import "./Back.css";

const Back = () => {
  const navigate = useNavigate();

  return (
    <div>
      <button className="backBtn txt" onClick={() => navigate(-1)}>ππ» λ€λ‘κ°κΈ°</button>
    </div>
  );
};

export default Back;
