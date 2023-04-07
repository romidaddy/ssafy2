// eslint-disable-next-line no-unused-vars
/*global kakao*/
import React, { useState, useEffect } from "react";
import { Link, useNavigate } from "react-router-dom";
import Modal from "react-modal";
import { setDoc, doc } from "firebase/firestore";
import { db } from "./Firebase";
import "./TaxiRequest.css";
import axios from "axios";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faMagnifyingGlass } from "@fortawesome/free-solid-svg-icons";
import SearchResult from "./SearchResult";

function TaxiRequest() {
  // const [initnode, setInitnode] = useState("");
  // const [endnode, setEndnode] = useState("");
  const [initcoor, setInitcoor] = useState([
    37.56826499654502, 126.89378559958499,
  ]);
  const [endcoor, setEndcoor] = useState([
    37.579520675516555, 126.8819363653686,
  ]);
  const [initmodalState, setInitModalState] = useState(false);
  const [searchmodalState, setSearchModalState] = useState(false);
  const [endmodalState, setEndModalState] = useState(false);
  const [initnodeAddress, setInitNodeAddress] = useState(false);
  const [endnodeAddress, setEndNodeAddress] = useState(false);
  const [searchResult, setSearchResult] = useState([]);
  const [selectedPosition, setSelectedPosition] = useState([]);
  // let initnode = ''
  // let endnode = ''
  //   setInitnode('');
  //   setEndnode('');
  // const hello = 'hello'

  const navigate = useNavigate();

  const [searchWord, setSearchWord] = useState("");

  const { kakao } = window;

  var geocoder = new kakao.maps.services.Geocoder();

  function changeInitModal() {
    setInitModalState(!initmodalState);
  }

  const onChange = (e) => {
    setSearchWord(e.target.value);
  };

  // const onReset = ()=>{
  //   setSearchWord("")
  // }

  function searchFunc() {
    if (searchWord) {
      axios
        .get(
          `https://business.juso.go.kr/addrlink/addrLinkApi.do?currentPage=1&countPerPage=10&keyword=${searchWord}&confmKey=devU01TX0FVVEgyMDIzMDMzMDExMDY1MzExMzY0MTg=&resultType=json&firstSort=(road:'서울')`
        )
        .then((res) => {
          // console.log("result", res);
          // console.log("axios", res.data);
          // console.log("data.result", res.data.results);
          setSearchResult(res.data.results.juso);
          // console.log("data", searchResult);
        });
    }
    // axios.get(`https://dapi.kakao.com/v2/local/search/address.json?query=${searchWord}`,{ headers:{'Authorization':'KakaoAK 3175478cb4c3aca8366273adba569b14'}})
    // .then(res =>{
    //   console.log('asdf',searchWord);
    //   console.log(res.data);
    // })
    // setSearchWord("")
  }

  function changeEndModal() {
    setEndModalState(!endmodalState);
  }

  function changeSearchModal() {
    setSearchModalState(!searchmodalState);
  }

  function setInitnodeCoor() {
    // setInitnode(initcoor);
    setInitModalState(false);
  }
  function reSearch() {
    setEndModalState(false);
    setSearchModalState(!searchmodalState);
  }

  function setEndnodeCoor() {
    // setEndnode(endcoor);
    setEndModalState(false);
  }

  function callTaxi() {
    const docRef = setDoc(
      doc(db, "User", "User1"),
      {
        Initnode_lat: initcoor[0],
        Initnode_lng: initcoor[1],
        Endnode_lat: endcoor[0],
        Endnode_lng: endcoor[1],
        isAvailable: true,
      },
      { merge: true }
    );

    navigate("/matching");

    // console.log("Document written with ID: ", docRef.id);
  }

  const appElement = document.getElementById("root");

  Modal.setAppElement(appElement);

  const selected = (data) => {
    setSelectedPosition(data);
    setSearchModalState(!searchmodalState);
    setEndModalState(!endmodalState);
  };

  useEffect(() => {
    var coord = new kakao.maps.LatLng(initcoor[0], initcoor[1]);
    var callback = function (result, status) {
      if (status === kakao.maps.services.Status.OK) {
        setInitNodeAddress(result[0].address.address_name);
      }
    };

    geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
  });

  return (
    <div className="Request">
      <div className="home_request">
        <Link to={"/"}>
          <button className="back_request">Back</button>
        </Link>
      </div>
      <span className="p_request">출발위치 </span>
      <br></br>
      <div>
        {initcoor ? (
          <div className="Node_request">
            <span className="span_request">{initnodeAddress}</span>{" "}
            <button className="select_request" onClick={changeInitModal}>
              출발지 변경
            </button>
          </div>
        ) : (
          <button className="select_request" onClick={changeInitModal}>
            출발지 선택
          </button>
        )}
      </div>

      <br></br>
      <span className="p_request">도착위치 </span>
      <br></br>
      <div>
        {endnodeAddress ? (
          <div className="Node_request">
            <span className="span_request">{endnodeAddress}</span>{" "}
            <button className="select_request" onClick={changeEndModal}>
              도착지 변경
            </button>
          </div>
        ) : (
          <button className="select_request" onClick={changeSearchModal}>
            도착지 선택
          </button>
        )}
      </div>
      <br></br>
      <br></br>

      <Modal
        className="modal_request"
        isOpen={initmodalState}
        onAfterOpen={() => {
          // console.log(initnode);
          // console.log(11);
          var mapContainer = document.getElementById("map"),
            mapOption = {
              center: new kakao.maps.LatLng(initcoor[0], initcoor[1]),
              level: 2,
              mapTypeId: kakao.maps.MapTypeId.ROADMAP,
              draggable: true,
            };
          var map = new kakao.maps.Map(mapContainer, mapOption);

          var startSrc =
            "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_b.png";
          var startSize = new kakao.maps.Size(50, 45);
          var startOption = { offset: new kakao.maps.Point(15, 43) };
          var startImage = new kakao.maps.MarkerImage(
            startSrc,
            startSize,
            startOption
          );
          var startPosition = new kakao.maps.LatLng(initcoor[0], initcoor[1]);
          var startMarker = new kakao.maps.Marker({
            map: map,
            position: startPosition,

            image: startImage,
          });

          kakao.maps.event.addListener(map, "center_changed", function () {
            var latlng = map.getCenter();

            startMarker.setPosition(
              new kakao.maps.LatLng(latlng.getLat(), latlng.getLng())
            );
            setInitcoor([latlng.getLat(), latlng.getLng()]);
          });

          var coord = new kakao.maps.LatLng(initcoor[0], initcoor[1]);
          var callback = function (result, status) {
            if (status === kakao.maps.services.Status.OK) {
              setInitNodeAddress(result[0].address.address_name);
            }
          };

          geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
        }}
      >
        <div className="close_button_request">
          <button className="close_request" onClick={changeInitModal}>
            ×
          </button>
        </div>
        <div className="modal_div_request">
          <span className="modal_span_request">출발지 설정</span>
        </div>
        <div id="map" style={{ width: "auto", height: 400 }}></div>
        <br></br>
        <div className="modal_div_request">
          <button className="select_request" onClick={setInitnodeCoor}>
            출발지로 선택
          </button>
        </div>
      </Modal>

      <Modal className="modal_request" isOpen={searchmodalState}>
        <div className="close_button_request">
          <button className="close_request" onClick={changeSearchModal}>
            ×
          </button>
        </div>
        <div className="modal_div_request">
          <span className="modal_span_request">도착지 설정</span>
        </div>
        <div>
          <div className="input_div">
            <input
              className="input_request"
              name="searchWord"
              placeholder="검색할 위치를 입력해주세요."
              onChange={onChange}
              value={searchWord}
            ></input>
            <FontAwesomeIcon
              icon={faMagnifyingGlass}
              style={{ color: "#ffffff" }}
              onClick={searchFunc}
            />
          </div>
          <SearchResult result={searchResult} selected={selected} />
        </div>

        <br></br>

        {/* <div className="modal_div_request">
          <button className="select_request" onClick={setEndnodeCoor}>
            도착지로 선택
          </button>
        </div> */}
      </Modal>

      <Modal
        className="modal_request"
        isOpen={endmodalState}
        onAfterOpen={() => {
          axios
            .get(
              `https://dapi.kakao.com/v2/local/search/address.json?query=${selectedPosition.roadAddr}`,
              {
                headers: {
                  Authorization: "KakaoAK 3175478cb4c3aca8366273adba569b14",
                },
              }
            )
            .then((res) => {
              // console.log("asdf", searchWord);

              // console.log(selectedPosition);
              // console.log("a", res.data);
              setEndcoor([res.data.documents[0].y, res.data.documents[0].x]);
              var geocoder = new kakao.maps.services.Geocoder();
              var mapContainer = document.getElementById("map2"),
                mapOption = {
                  center: new kakao.maps.LatLng(
                    res.data.documents[0].y,
                    res.data.documents[0].x
                  ),
                  level: 2,
                  mapTypeId: kakao.maps.MapTypeId.ROADMAP,
                  draggable: true,
                };
              var map2 = new kakao.maps.Map(mapContainer, mapOption);

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
                res.data.documents[0].y,
                res.data.documents[0].x
              );
              var arriveMarker = new kakao.maps.Marker({
                map: map2,
                position: arrivePosition,
                image: arriveImage,
              });
              kakao.maps.event.addListener(map2, "center_changed", function () {
                var latlng = map2.getCenter();

                arriveMarker.setPosition(
                  new kakao.maps.LatLng(latlng.getLat(), latlng.getLng())
                );
                setEndcoor([latlng.getLat(), latlng.getLng()]);
              });
              var coord = new kakao.maps.LatLng(endcoor[0], endcoor[1]);
              var callback = function (result, status) {
                if (status === kakao.maps.services.Status.OK) {
                  console.log(
                    setEndNodeAddress(result[0].address.address_name)
                  );
                }
              };

              geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
            });
        }}
      >
        <div className="close_button_request">
          <button className="close_request" onClick={changeEndModal}>
            ×
          </button>
        </div>
        <div className="modal_div_request">
          <span className="modal_span_request">도착지 설정</span>
        </div>

        <div
          id="map2"
          className="map2_request"
          style={{ width: "auto", height: 370 }}
        ></div>
        <br></br>
        <div className="modal_div_request">
          <button className="select_request" onClick={reSearch}>
            다시 검색
          </button>
          <button className="select_request" onClick={setEndnodeCoor}>
            선택 완료
          </button>
        </div>
      </Modal>

      {/* <Link to={"/matching"}>
        <button>matching</button>
      </Link> */}

      <div>
        <button className="call_request" onClick={callTaxi}>
          택시호출
        </button>
      </div>
    </div>
  );
}

export default TaxiRequest;
