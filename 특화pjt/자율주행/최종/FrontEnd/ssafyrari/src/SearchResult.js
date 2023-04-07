import React from "react";
import "./SearchResult.css";

function SearchResult({ result, selected }) {
  let mod_result = result;
  for (let index = 0; index < mod_result.length; index++) {
    mod_result[index]["id"] = index;
  }

  return (
    <div>
      {mod_result.map((res) => (
        <div
          key={res.id}
          className="div_searchresult"
          onClick={() => {
            selected(res);

          }}
        >
          <span>{res.bdNm}</span><span className="add_span_searchresult">{res.roadAddr}</span>
        </div>
      ))}
    </div>
  );
}

export default SearchResult;
