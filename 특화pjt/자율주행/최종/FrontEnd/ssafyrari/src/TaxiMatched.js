/*global kakao*/
import React, { useState, useEffect } from "react";
import { doc, onSnapshot } from "firebase/firestore";
import { db } from "./Firebase";
import taxiImg from "./taxi.png";

import "./TaxiMatched.css";
import { map } from "@firebase/util";

const { kakao } = window;

function TaxiMatched() {
  // getData()
  // console.log(getData())

  const [userData, setUserData] = useState([]);
  const [egoData, setEgoData] = useState([]);
  const [pathData, setPathData] = useState([]);
  const [matched, setMatched] = useState(false);
  const [userEmail, setuserEmail] = useState(
    JSON.parse(window.sessionStorage.getItem(window.sessionStorage.key(0)))[
      "email"
    ]
  );
  const [finalMap, setFinalMap] = useState(null);
  const [finalCar, setFinalCar] = useState(null);

  useEffect(() => {
    const userSs =
      userEmail === "cloush24@gmail.com"
        ? onSnapshot(doc(db, "User", "User1"), (doc) => {
            setUserData(doc.data());
          })
        : onSnapshot(doc(db, "User", "User2"), (doc) => {
            setUserData(doc.data());
          });
    const EgoSs = onSnapshot(doc(db, "Ego", "Ego1"), (doc) => {
      setEgoData(doc.data());
    });
    const PathSs = onSnapshot(doc(db, "Path", "UserPath"), (doc) => {
      setPathData(doc.data());
    });
  }, []);

  useEffect(() => {
    if (userData) {
      var mapContainer = document.getElementById("map"),
        mapOption = {
          center: new kakao.maps.LatLng(
            egoData["current_lat"],
            egoData["current_lng"]
          ),
          level: 2,
          mapTypeId: kakao.maps.MapTypeId.ROADMAP,
          draggable: true,
        };
      var map = new kakao.maps.Map(mapContainer, mapOption);

      // map.relayout();

      var startSrc =
        "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_b.png";
      var startSize = new kakao.maps.Size(50, 45);
      var startOption = { offset: new kakao.maps.Point(15, 43) };
      var startImage = new kakao.maps.MarkerImage(
        startSrc,
        startSize,
        startOption
      );
      var startPosition = new kakao.maps.LatLng(
        userData["Initnode_lat"],
        userData["Initnode_lng"]
      );
      var startMarker = new kakao.maps.Marker({
        map: map,
        position: startPosition,

        image: startImage,
      });

      var taxiSrc = taxiImg;
      var taxiSize = new kakao.maps.Size(30, 25);
      var taxiOption = { offset: new kakao.maps.Point(15, 12) };
      var taxiImage = new kakao.maps.MarkerImage(taxiSrc, taxiSize, taxiOption);
      var taxiPosition = new kakao.maps.LatLng(
        egoData["current_lat"],
        egoData["current_lng"]
      );
      var taxiMarker = new kakao.maps.Marker({
        map: map,
        position: taxiPosition,
        image: taxiImage,
      });

      var arriveSrc =
        "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_b.png";
      var arriveSize = new kakao.maps.Size(50, 45);
      var arriveOption = {
        offset: new kakao.maps.Point(15, 43),
      };

      var arriveImage = new kakao.maps.MarkerImage(
        arriveSrc,
        arriveSize,
        arriveOption
      );

      var arrivePosition = new kakao.maps.LatLng(
        userData["Endnode_lat"],
        userData["Endnode_lng"]
      );
      var arriveMarker = new kakao.maps.Marker({
        map: map,
        position: arrivePosition,
        image: arriveImage,
      });
      setFinalMap(map);
      setFinalCar(taxiMarker);
      // const EgoSs = onSnapshot(doc(db, "Ego", "Ego1"), (doc) => {
      //   map.setCenter(new kakao.maps.LatLng(
      //     egoData["current_lat"],
      //     egoData["current_lng"]
      //   ))
      // });
      // console.log(2)
    }
  }, [userData]);
  // console.log(1);
  useEffect(() => {
    if (finalMap) {
      finalMap.setCenter(
        new kakao.maps.LatLng(egoData["current_lat"], egoData["current_lng"])
      );
      finalCar.setPosition(
        new kakao.maps.LatLng(egoData["current_lat"], egoData["current_lng"])
      );
    }
  }, [egoData]);

  return (
    <div id="root">
      <div id="map" style={{ width: "auto", height: 600 }}></div>
    </div>
  );
}

export default TaxiMatched;
