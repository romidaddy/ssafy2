import { React, useState, useEffect } from "react";
import { Link } from "react-router-dom";
// import Firebase from "./Firebase";
import logo from "./SSAFYRARI_logo.png";
import "./Main.css";
import { auth } from "./Firebase";
import {
  GoogleAuthProvider,
  signInWithPopup,
  signInWithRedirect,
  setPersistence,
  browserSessionPersistence,
} from "firebase/auth";

function Main() {
  // console.log(Firebase)
  let sessionStorage = window.sessionStorage;
  const [userData, setUserData] = useState();
  // console.log(userData);

  useEffect(() => {
    if (sessionStorage.length) {
      setUserData(sessionStorage);
    } else setUserData("");
  }, []);

  function handleGoogleLogin() {
    const provider = new GoogleAuthProvider(); // provider를 구글로 설정
    setPersistence(auth, browserSessionPersistence).then(
      signInWithPopup(auth, provider) // popup을 이용한 signup
        .then((data) => {
          setUserData(data.user); // user data 설정
          // console.log(data); // console로 들어온 데이터 표시
        })
        .catch((err) => {
          console.log(err);
        })
    );
  }

  return (
    <div id="main">
      <div className="img-position"></div>
      <div className="img-box">
        <img className="img" src={logo} alt="ssafyrari_logo" />
      </div>
      {userData ? (
        <div className="Button">
          <Link to={"/taxi"}>
            <button className="call_button">택시호출</button>
          </Link>

          <Link to={"/sharetaxi"}>
            <button className="call_button">공유택시호출</button>
          </Link>
        </div>
      ) : (
        <div className="Button">
          <button className="call_button" onClick={handleGoogleLogin}>
            Login
          </button>
        </div>
      )}
    </div>
  );
}

export default Main;
