import React, { useState, useEffect, useRef } from "react";
import {
  doc,
  onSnapshot,
  collection,
  query,
  where,
  setDoc,
} from "firebase/firestore";
import { Link, useNavigate } from "react-router-dom";
import { db } from "./Firebase";
import logo from "./SSAFYRARI_logo.png";
import "./Main.css";
import "./TaxiMatching.css";
import spinner from "./loading.gif";

// function useInterval(callback, delay) {
//   const savedCallback = useRef(); // 최근에 들어온 callback을 저장할 ref를 하나 만든다.

//   useEffect(() => {
//     savedCallback.current = callback; // callback이 바뀔 때마다 ref를 업데이트 해준다.
//   }, [callback]);

//   useEffect(() => {
//     function tick() {
//       savedCallback.current(); // tick이 실행되면 callback 함수를 실행시킨다.
//     }
//     if (delay !== null) {
//       // 만약 delay가 null이 아니라면
//       let id = setInterval(tick, delay); // delay에 맞추어 interval을 새로 실행시킨다.
//       return () => clearInterval(id); // unmount될 때 clearInterval을 해준다.
//     }
//   }, [delay]); // delay가 바뀔 때마다 새로 실행된다.
// }

function TaxiMatching() {
  const navigate = useNavigate();
  const [taxi, setTaxi] = useState([]);
  const [users, setUsers] = useState([]);
  const [egos, setEgos] = useState([]);
  const [userEmail, setuserEmail] = useState(
    JSON.parse(window.sessionStorage.getItem(window.sessionStorage.key(0)))[
      "email"
    ]
  );
  // 실패한 코드 1
  // useEffect(() => {
  //   const q = query(collection(db, "Ego"), where("isMatched", "==", "false"));
  //   onSnapshot(q, (snap) => {
  //     setTaxi(
  //       snap.docChanges().map((now) => {
  //         //   console.log(now.doc.data());
  //         return now.doc.data();
  //       })
  //     );
  //   });
  // }, []);
  // console.log(1, taxi);
  // 실패한 코드 2
  // useEffect(() => {
  //   let i = 0;
  //   const inter = setInterval(() => {
  //     i += 1;
  //     console.log("hi", i, taxi.length);
  //     const q = query(collection(db, "Ego"), where("isMatched", "==", "false"));
  //     onSnapshot(q, (snap) => {
  //       const result = snap.docChanges().map((now) => {
  //         console.log("now", now.doc.data());
  //         return now.doc.data();
  //       });
  //       console.log("result",result);
  //       setTaxi(result => result);
  //       console.log(taxi);
  //     });
  //     if (i === 10 && taxi.length === 0) {
  //       clearInterval(inter);
  //       alert("이용 가능한 택시가 없습니다.");
  //       navigate("/taxi");
  //     } else if (taxi.length !== 0) {
  //       clearInterval(inter);
  //     }
  //   }, 1000);
  // }, []);
  useEffect(() => {
    const qEgos = query(
      collection(db, "Ego"),
      where("isAvailable", "==", true)
    );
    onSnapshot(qEgos, (snap) => {
      setEgos(
        snap.docChanges().map((now) => {
          //   console.log(now.doc.data());
          return now.doc.data();
        })
      );
    });
    const qUsers = query(
      collection(db, "User"),
      where("isAvailable", "==", true)
    );
    onSnapshot(qUsers, (snap) => {
      setUsers(
        snap.docChanges().map((now) => {
          //   console.log(now.doc.data());
          return now.doc.data();
        })
      );
    });
  }, []);

  useEffect(() => {
    console.log(1, users, 2, egos);
    if (egos.length && users.length) {
      userEmail === "cloush24@gmail.com"
        ? setDoc(
            doc(db, "Taxi", "Taxi1"),
            {
              taxi_Initnode_lat: users[0]["Initnode_lat"],
              taxi_Initnode_lng: users[0]["Initnode_lng"],
              taxi_Endnode_lat: users[0]["Endnode_lat"],
              taxi_Endnode_lng: users[0]["Endnode_lng"],
            },
            { merge: true }
          )
        : setDoc(
            doc(db, "Taxi", "Taxi1"),
            {
              taxi_Init2node_lat: users[0]["Initnode_lat"],
              taxi_Init2node_lng: users[0]["Initnode_lng"],
              taxi_End2node_lat: users[0]["Endnode_lat"],
              taxi_End2node_lng: users[0]["Endnode_lng"],
            },
            { merge: true }
          );
      userEmail === "cloush24@gmail.com"
        ? setDoc(
            doc(db, "User", "User1"),
            {
              isAvailable: false,
            },
            { merge: true }
          )
        : setDoc(
            doc(db, "User", "User2"),
            {
              isAvailable: false,
            },
            { merge: true }
          );
      setTimeout(() => {
        navigate("/matched");
      }, 2000);
    }
  }, [users, egos]);

  return (
    <div>
      <div className="img-box">
        <img className="img" src={logo} alt="ssafyrari_logo" />
      </div>
      <div className="text_box">
        <span className="taxiMatching">택시 매칭중입니다.</span>
        <img src={spinner} alt="로딩중" className="loading_img" />
        <Link to={"/taxi"}>
          <button className="return_btn">돌아가기</button>
        </Link>
      </div>
      <div></div>
    </div>
  );
}

export default TaxiMatching;
