import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import axios from "axios";
import "./History.css";

const History = () => {
  const [histchild, setHistchild] = useState([]);

  useEffect(() => {
    axios.get("http://i8c101.p.ssafy.io/api/history", {
      headers: {
        Authorization: `Bearer ${localStorage.getItem("accessToken")}`
      }
    }).then((response) => {
      const hist = response.data;
      setHistchild(
        hist.map((hist) => {
          let starpoint = "β­".repeat(hist.starPoint);
          return (
            <div key={hist.historyId} className="historyContainer">
              <div className="historycontent txt">
                {hist.studyDate.slice(0, 10)}
              </div>
              <div className="historycontent txt">{hist.story}</div>
              <div className="historycontent txt">{starpoint}</div>
              <Link
                to={`/history/${hist.historyId}`}
                style={{ textDecoration: "none" }}
                state={{ histId: hist.historyId }}
              >
                <div className="historycontent txt golook">π λ³΄λ¬κ°μ</div>
              </Link>
            </div>
          );
        })
      );
    });
  }, []);

  return (
    <div>
      <div>
        <Link to="/">
          <button className="backBtn txt">ππ» λ€λ‘κ°κΈ°</button>
        </Link>
      </div>
      <div className="historyBox">
        <h3 className="histMainText txt">π νμ΅κΈ°λ‘ π§</h3>
        <div className="historyContainer">
          <div className="historytitle txt">νμ΅λ μ§</div>
          <div className="historytitle txt">νμ΅λν</div>
          <div className="historytitle txt">λ³μ </div>
          <div className="historytitle txt">μμΈνλ³΄κΈ°</div>
        </div>
        <hr className="histLine"></hr>
        {histchild}
      </div>
    </div>
  );
};

export default History;
